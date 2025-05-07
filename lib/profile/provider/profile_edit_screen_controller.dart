import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileEditScreenController extends ChangeNotifier {
  File? _selectedFile;
  String _imageUrl = "";
  ImagePicker _picker = ImagePicker();
  Map<String, dynamic> _userData = {};
  TextEditingController _nameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _mobileController = TextEditingController();

  File? get selectedFile => _selectedFile;
  String get imageUrl => _imageUrl;
  ImagePicker get picker => _picker;
  Map<String, dynamic> get userData => _userData;
  TextEditingController get nameController => _nameController;
  TextEditingController get lastNameController => _lastNameController;
  TextEditingController get emailController => _emailController;
  TextEditingController get mobileController => _mobileController;

  Future<void> getImage(BuildContext context) async {
    var status = await Permission.camera.request();

    if (status.isGranted) {
      try {
        final XFile? photo = await _picker.pickImage(
          source: ImageSource.camera,
        );
        if (photo != null) {
          _selectedFile = File(photo.path);

          final user = Supabase.instance.client.auth.currentUser;

          if (user == null) {
            print("User is not authenticated");

            final response =
                await Supabase.instance.client.auth.signInWithPassword(
              email: 'yash.aviratinfo@gmail.com',
              password: 'Yash@Avirat2489',
            );

            if (response.user == null) {
              print('Authentication failed: ${response}');
            } else {
              print('User signed in: ${response}');
            }

            return;
          }

          final storage = Supabase.instance.client.storage.from('user-images');
          final filePath = 'uploads/${photo.name}';

          final response = await storage.upload(filePath, _selectedFile!);

          if (response.isNotEmpty) {
            final fileUrl = await storage.getPublicUrl(filePath);
            print('File URL: $fileUrl');
            _imageUrl = fileUrl;

            Future.microtask(() {
              Navigator.pop(context);
            });
          } else {
            print('Error uploading file: ${response}');
          }

          print("Image Path: ${photo.path}");
        }
      } catch (e) {
        print("Error capturing image: $e");
      }
    } else if (status.isDenied) {
      print("Camera permission denied");
    } else if (status.isPermanentlyDenied) {
      openAppSettings();
    }

    notifyListeners();
  }

  Future<void> getGalleryImage(BuildContext context) async {
    var status = await Permission.camera.request();
    if (Platform.isIOS) {
      final XFile? photo = await _picker.pickImage(
        source: ImageSource.gallery,
      );

      if (photo != null) {
        _selectedFile = File(photo.path);

        final user = Supabase.instance.client.auth.currentUser;

        if (user == null) {
          print("User is not authenticated");

          final response =
              await Supabase.instance.client.auth.signInWithPassword(
            email: 'yash.aviratinfo@gmail.com',
            password: 'Yash@Avirat2489',
          );

          if (response.user == null) {
            print('Authentication failed: ${response}');
          } else {
            print('User signed in: ${response}');
          }

          // return;
        }

        final storage = Supabase.instance.client.storage.from('user-images');
        final filePath = 'uploads/${photo.name}';

        final response = await storage.upload(filePath, _selectedFile!);

        if (response.isNotEmpty) {
          final fileUrl = await storage.getPublicUrl(filePath);
          print('File URL: $fileUrl');
          _imageUrl = fileUrl;

          Future.microtask(() {
            Navigator.pop(context);
          });
        } else {
          print('Error uploading file: ${response}');
        }

        print("Image Path: ${photo.path}");
      }
    } else {
      if (status.isGranted) {
        try {
          final XFile? photo = await _picker.pickImage(
            source: ImageSource.gallery,
          );
          if (photo != null) {
            _selectedFile = File(photo.path);

            final user = Supabase.instance.client.auth.currentUser;

            if (user == null) {
              print("User is not authenticated");

              final response =
                  await Supabase.instance.client.auth.signInWithPassword(
                email: 'yash.aviratinfo@gmail.com',
                password: 'Yash@Avirat2489',
              );

              if (response.user == null) {
                print('Authentication failed: ${response}');
              } else {
                print('User signed in: ${response}');
              }

              return;
            }

            final storage =
                Supabase.instance.client.storage.from('user-images');
            final filePath = 'uploads/${photo.name}';

            final response = await storage.upload(filePath, _selectedFile!);

            if (response.isNotEmpty) {
              final fileUrl = await storage.getPublicUrl(filePath);
              print('File URL: $fileUrl');
              _imageUrl = fileUrl;

              Future.microtask(() {
                Navigator.pop(context);
              });
            } else {
              print('Error uploading file: ${response}');
            }

            print("Image Path: ${photo.path}");
          }
        } catch (e) {
          print("Error capturing image: $e");
        }
      } else if (status.isDenied) {
        print("Camera permission denied");
      } else if (status.isPermanentlyDenied) {
        openAppSettings();
      }
    }

    notifyListeners();
  }

  void fetchAndFillData(Map<String, dynamic> data) {
    if (data.containsKey("lastName") == false) {
      List<String> nameData = data["name"].split(' ');

      if (nameData.length < 2) {
        _nameController.text = data["name"];
        _lastNameController.text = "";
        _mobileController.text = data["mobileNumber"];
        _emailController.text = data["email"];
      } else if (nameData.length > 2) {
        _nameController.text = nameData[0];
        _lastNameController.text = nameData[1] + nameData[2];
        _mobileController.text = data["mobileNumber"];
        _emailController.text = data["email"];
      } else {
        _nameController.text = nameData[0];
        _lastNameController.text = nameData[1];
        _mobileController.text = data["mobileNumber"];
        _emailController.text = data["email"];
      }
    } else {
      _nameController.text = data["name"];
      _mobileController.text = data["mobileNumber"];
      _emailController.text = data["email"];
      _lastNameController.text = data["lastName"];
    }

    if (data.containsKey("image") == true) {
      _selectedFile = File(data["image"]);
    }

    notifyListeners();
  }

  void saveData(BuildContext context) {
    if (_selectedFile != null &&
        _nameController.text.isNotEmpty &&
        _lastNameController.text.isNotEmpty &&
        _emailController.text.isNotEmpty &&
        _mobileController.text.isNotEmpty) {
      final nameRegex = RegExp(r"^[A-Za-z\s\-]{2,}$");

      if (!nameRegex.hasMatch(_nameController.text)) {}
    } else {
      //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: content))
    }
  }

  String? nameValidation(String value) {
    final nameRegex = RegExp(r"^[A-Za-z\s\-]{2,}$");

    if (value.isEmpty) {
      return "Required Field!!";
    } else if (!nameRegex.hasMatch(value)) {
      return "Enter Valid Name";
    } else {
      return null;
    }
  }

  String? lastNameValidation(String value) {
    final nameRegex = RegExp(r"^[A-Za-z\s\-]{2,}$");

    if (value.isEmpty) {
      return "Required Field!!";
    } else if (!nameRegex.hasMatch(value)) {
      return "Enter Valid Last Name";
    } else {
      return null;
    }
  }

  String? emailValidation(String value) {
    final emailRegex = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");

    if (value.isEmpty) {
      return "Required Field!!";
    } else if (!emailRegex.hasMatch(value)) {
      return "Enter Valid Email";
    } else {
      return null;
    }
  }

  String? mobileValidation(String value) {
    final mobileRegex = RegExp(r"^(\+91[\-\s]?)?[4-9]\d{9}$");

    if (value.isEmpty) {
      return "Required Field!!";
    } else if (!mobileRegex.hasMatch(value)) {
      return "Enter Valid Mobile Number";
    } else {
      return null;
    }
  }

  clearImage() {
    _imageUrl = "";
    notifyListeners();
  }
}
