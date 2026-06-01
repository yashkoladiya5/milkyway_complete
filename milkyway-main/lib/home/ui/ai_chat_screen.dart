import 'dart:io';
import 'dart:ui';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:milkyway/constant/app_colors.dart';
import 'package:milkyway/constant/app_strings.dart';
import 'package:milkyway/provider/theme_controller.dart';
import 'package:milkyway/services/backend_api.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AiChatScreen extends StatefulWidget {
  const AiChatScreen({super.key});

  @override
  State<AiChatScreen> createState() => _AiChatScreenState();
}

class _AiChatScreenState extends State<AiChatScreen> {
  final TextEditingController _textController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final List<Map<String, String>> _messages = [];
  final ImagePicker _picker = ImagePicker();
  
  bool _isSending = false;
  late double height;
  late double width;
  late ThemeController themeController;
  String _userId = '';

  final List<String> _quickChips = [
    "📊 Predict Dairy Budget",
    "🥛 Zero-waste Milk Recipe",
    "⚡ Electricity Saving Tips",
    "💡 Ask Milkyway Rules"
  ];

  @override
  void initState() {
    super.initState();
    _loadUserId();
    // Add default greeting message
    _messages.add({
      'role': 'model',
      'text': 'Hello! I am your Milkyway AI Concierge. How can I help you coordinate subscriptions, analyze your household budget, cook zero-waste milk recipes, or scan utility bills today?'
    });
  }

  Future<void> _loadUserId() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _userId = prefs.getString(SharedPreferenceKeys.userIdKey) ?? '';
    });
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  Future<void> _sendMessage(String text) async {
    if (text.trim().isEmpty || _isSending) return;

    setState(() {
      _messages.add({'role': 'user', 'text': text});
      _isSending = true;
    });
    _textController.clear();
    _scrollToBottom();

    try {
      final List<Map<String, String>> apiHistory = [];
      if (_messages.length > 1) {
        // Skip the local welcome greeting at index 0 which is from role 'model'
        apiHistory.addAll(_messages.sublist(1, _messages.length - 1));
      }

      final response = await BackendApi.sendAiChatMessage(
        message: text,
        history: apiHistory,
      );

      setState(() {
        _isSending = false;
        if (response['success'] == true) {
          _messages.add({'role': 'model', 'text': response['reply'] ?? ''});
        } else {
          _messages.add({
            'role': 'model',
            'text': 'Sorry, I encountered an issue processing your query. Please verify your connection.'
          });
        }
      });
    } catch (e) {
      setState(() {
        _isSending = false;
        _messages.add({
          'role': 'model',
          'text': 'Exception occurred while communicating with the server: $e'
        });
      });
    }
    _scrollToBottom();
  }

  Future<void> _scanBillFromChat() async {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        final bool isDark = !themeController.isLight;
        final Color cardBg = HexColor(isDark ? AppColorsDark.darkGreyColor : AppColorsLight.lightGreyColor);
        final Color textColor = HexColor(isDark ? AppColorsDark.whiteColor : AppColorsLight.darkBlueColor);

        return Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: cardBg,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Select Attachment Source",
                style: TextStyle(
                  fontFamily: "poppins",
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: textColor,
                ),
              ),
              const SizedBox(height: 20),
              ListTile(
                leading: Icon(Icons.camera_alt_outlined, color: HexColor(AppColorsLight.orangeColor)),
                title: Text("Take Photo", style: TextStyle(color: textColor, fontFamily: "poppins")),
                onTap: () {
                  Navigator.pop(context);
                  _pickAndScanBillFromChat(ImageSource.camera);
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_library_outlined, color: HexColor(AppColorsLight.orangeColor)),
                title: Text("Choose from Gallery", style: TextStyle(color: textColor, fontFamily: "poppins")),
                onTap: () {
                  Navigator.pop(context);
                  _pickAndScanBillFromChat(ImageSource.gallery);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _pickAndScanBillFromChat(ImageSource source) async {
    if (source == ImageSource.camera) {
      final status = await Permission.camera.request();
      if (!status.isGranted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Camera permission is required to take photos.'))
        );
        return;
      }
    }

    try {
      final XFile? photo = await _picker.pickImage(source: source);
      if (photo == null) return;

      setState(() {
        _messages.add({
          'role': 'user',
          'text': '📷 [Uploaded Image: Scanning Utility Bill / Document]'
        });
        _isSending = true;
      });
      _scrollToBottom();

      final response = await BackendApi.scanBillWithAi(file: File(photo.path));

      setState(() {
        _isSending = false;
        if (response['success'] == true && response['bill'] != null) {
          final bill = response['bill'];
          _messages.add({
            'role': 'model',
            'text': '🧾 **AI Billing OCR Results:**\n\n'
                '• **Provider**: ${bill['provider'] ?? 'Unknown'}\n'
                '• **Consumer ID**: ${bill['customerNo'] ?? 'Unknown'}\n'
                '• **Amount**: ₹${(bill['amount'] ?? 0.0).toStringAsFixed(2)}\n'
                '• **Due Date**: ${bill['dueDate'] ?? 'Unknown'}\n'
                '• **State**: ${bill['state'] ?? 'Unknown'}\n\n'
                'Would you like me to guide you to the Bill Payment portal to settle this balance?'
          });
        } else {
          _messages.add({
            'role': 'model',
            'text': 'Could not extract valid billing information from the image. Please ensure the document is clearly legible.'
          });
        }
      });
    } catch (e) {
      setState(() {
        _isSending = false;
        _messages.add({
          'role': 'model',
          'text': 'Error uploading scan image: $e'
        });
      });
    }
    _scrollToBottom();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    themeController = Provider.of<ThemeController>(context);

    final bool isDark = !themeController.isLight;
    final Color bgColor = HexColor(isDark ? AppColorsDark.backgroundColor : AppColorsLight.backgroundColor);
    final Color cardBg = HexColor(isDark ? AppColorsDark.darkGreyColor : AppColorsLight.lightGreyColor);
    final Color textColor = HexColor(isDark ? AppColorsDark.whiteColor : AppColorsLight.darkBlueColor);

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: cardBg,
        elevation: 0,
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.auto_awesome, color: HexColor(AppColorsLight.orangeColor)),
            const SizedBox(width: 8),
            Text(
              "Milkyway AI",
              style: TextStyle(
                fontFamily: "poppins",
                fontWeight: FontWeight.bold,
                color: textColor,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          // Prompt chips for quick accessibility
          Container(
            height: 48,
            margin: const EdgeInsets.only(top: 8),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _quickChips.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: ActionChip(
                    backgroundColor: cardBg,
                    side: BorderSide(color: HexColor(AppColorsLight.orangeColor).withOpacity(0.3)),
                    label: Text(
                      _quickChips[index],
                      style: TextStyle(color: textColor, fontSize: 13, fontFamily: "poppins"),
                    ),
                    onPressed: () {
                      _sendMessage(_quickChips[index]);
                    },
                  ),
                );
              },
            ),
          ),

          // Message history list viewport
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final msg = _messages[index];
                final isUser = msg['role'] == 'user';

                return Align(
                  alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    width: width * 0.78,
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: isUser
                          ? HexColor(AppColorsLight.orangeColor)
                          : cardBg,
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(16),
                        topRight: const Radius.circular(16),
                        bottomLeft: isUser ? const Radius.circular(16) : Radius.zero,
                        bottomRight: isUser ? Radius.zero : const Radius.circular(16),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.04),
                          blurRadius: 4,
                          spreadRadius: 1,
                        )
                      ]
                    ),
                    child: Text(
                      msg['text'] ?? '',
                      style: TextStyle(
                        fontFamily: "poppins",
                        fontSize: 14.5,
                        color: isUser
                            ? Colors.white
                            : textColor,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // Shimmer/indicator while waiting for response
          if (_isSending)
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 12),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: HexColor(AppColorsLight.orangeColor),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "Milkyway is typing...",
                      style: TextStyle(color: textColor.withOpacity(0.6), fontSize: 12, fontFamily: "poppins"),
                    ),
                  ],
                ),
              ),
            ),

          // Message input bar
          SafeArea(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: cardBg,
                border: Border(top: BorderSide(color: Colors.black.withOpacity(0.05))),
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.camera_alt_outlined, color: HexColor(AppColorsLight.orangeColor)),
                    onPressed: _scanBillFromChat,
                  ),
                  Expanded(
                    child: TextField(
                      controller: _textController,
                      style: TextStyle(color: textColor, fontFamily: "poppins"),
                      decoration: const InputDecoration(
                        hintText: "Ask anything or type a budget query...",
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 8),
                      ),
                      onSubmitted: _sendMessage,
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: HexColor(AppColorsLight.orangeColor),
                    radius: 20,
                    child: IconButton(
                      icon: const Icon(Icons.send, color: Colors.white, size: 18),
                      onPressed: () => _sendMessage(_textController.text),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
