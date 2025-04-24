import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class ProfileEditScreenController extends ChangeNotifier {
  File? _selectedFile;
  ImagePicker _picker = ImagePicker();
  Map<String, dynamic> _userData = {};
  TextEditingController _nameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _mobileController = TextEditingController();

  File? get selectedFile => _selectedFile;
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
          final directory = await getTemporaryDirectory();

          _selectedFile = File(photo.path);
          notifyListeners();
          print("Image Path: ${photo.path}");
          Future.microtask(() {
            Navigator.pop(context); // pop once
          });
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

    if (status.isGranted) {
      try {
        final XFile? photo = await _picker.pickImage(
          source: ImageSource.gallery,
        );
        if (photo != null) {
          final directory = await getTemporaryDirectory();

          _selectedFile = File(photo.path);

          print("Image Path: ${photo.path}");
          Future.microtask(() {
            Navigator.pop(context); // pop once
          });
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

  void fetchAndFillData(Map<String, dynamic> data) {
    if (data.containsKey("lastName") == false) {
      List<String> nameData = data["name"].split(' ');

      if (nameData.length < 2) {
        _nameController.text = _userData["name"];
        _lastNameController.text = "";
        _mobileController.text = data["mobileNumber"];
        _emailController.text = data["email"];
      } else if (nameData.length > 2) {
        _nameController.text = _userData["name"];
        _lastNameController.text = nameData[1] + nameData[2];
        _mobileController.text = data["mobileNumber"];
        _emailController.text = data["email"];
      } else {
        _nameController.text = _userData["name"];
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
    final mobileRegex = RegExp(r"^(\+91[\-\s]?)?[6-9]\d{9}$");

    if (value.isEmpty) {
      return "Required Field!!";
    } else if (!mobileRegex.hasMatch(value)) {
      return "Enter Valid Email";
    } else {
      return null;
    }
  }
}
