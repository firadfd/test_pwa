import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class ImagePickerController extends GetxController {
// Rx<File?> selectedImage = Rx<File?>(null); // Single image
  RxList<File> selectedImages = <File>[].obs; // Multiple images

  Rx<File?> selectedImage = Rx<File?>(null);
  Rx<File?> idCardBack = Rx<File?>(null);
  Rx<File?> idCardFront = Rx<File?>(null);

  Future<void> pickFromStorage() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );
    if (result != null && result.files.isNotEmpty) {
      selectedImage.value = File(result.files.single.path!);
    }
  }

  /// Request Storage Permission
  Future<bool> _requestStoragePermission() async {
    PermissionStatus status = await Permission.storage.request();
    if (status.isGranted) {
      return true;
    } else {
      if (status.isPermanentlyDenied) {
        Get.snackbar(
          "Permission Required",
          "Please enable storage permission from settings.",
          snackPosition: SnackPosition.BOTTOM,
          mainButton: TextButton(
            onPressed: () => openAppSettings(),
            child: const Text("Open Settings"),
          ),
        );
      } else {
        Get.snackbar("Permission Denied", "Storage permission is required.");
      }
      return false;
    }
  }

  /// Pick a single image using `FilePicker`
  Future<void> pickSingleImage() async {
    bool permissionGranted = await _requestStoragePermission(); //get the bool value
    if (!permissionGranted) return; //then negate the bool value

    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.image,
        allowMultiple: false,
      );

      if (result != null && result.files.isNotEmpty && result.files.single.path != null) {
        selectedImage.value = File(result.files.single.path!);
      }
    } catch (e) {
      print("Error selecting file: $e");
      Get.snackbar("Error", "Failed to select file.", snackPosition: SnackPosition.BOTTOM);
    }
  }

 /// Pick a single image using `FilePicker`
  Future<void> pickFontImage() async {

    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );
    if (result != null && result.files.isNotEmpty) {
      idCardFront.value = File(result.files.single.path!);
    }

  }

  /// Pick a single image using `FilePicker`
  Future<void> pickBackImage() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );
    if (result != null && result.files.isNotEmpty) {
      idCardBack.value = File(result.files.single.path!);
    }
  }

  /// Pick multiple images using `FilePicker`
  Future<void> pickMultipleImages() async {
    bool permissionGranted = await _requestStoragePermission(); //get the bool value
    if (!permissionGranted) return; //then negate the bool value

    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.image,
        allowMultiple: true,
      );

      if (result != null && result.files.isNotEmpty) {
        List<File> validFiles = result.files
            .where((file) => file.path != null) // Ensure paths are valid
            .map((file) => File(file.path!))
            .toList();

        if (validFiles.isNotEmpty) {
          selectedImages.addAll(validFiles);
        } else {
          Get.snackbar("Error", "No valid files were selected.");
        }
      }
    } catch (e) {
      print("Error selecting files: $e");
      Get.snackbar("Error", "Failed to select images.", snackPosition: SnackPosition.BOTTOM);
    }
  }

  /// Clear selected images
  void clearImages() {
    selectedImage.value = null;
    selectedImages.clear();
  }
}
