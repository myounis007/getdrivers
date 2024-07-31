import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_transfer_driver/widgets/Colors.dart';
import 'package:get_transfer_driver/widgets/snackBar.dart';
import 'package:image_picker/image_picker.dart';

class AddPhotosScreen extends StatefulWidget {
  const AddPhotosScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AddPhotosScreenState createState() => _AddPhotosScreenState();
}

class _AddPhotosScreenState extends State<AddPhotosScreen> {
  final ImagePicker _picker = ImagePicker();

  // List to store image paths
  final List<String?> _imagePaths = List<String?>.filled(5, null);

  // Function to pick image through gallery
  Future<void> pickImage(int imageIndex) async {
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _imagePaths[imageIndex - 1] = pickedImage.path;
      });
    }
  }

  Future<void> getImage(int imageIndex) async {
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      setState(() {
        _imagePaths[imageIndex - 1] = pickedImage.path;
      });
    }
  }

  void deleteImage(int imageIndex) {
    setState(() {
      _imagePaths[imageIndex - 1] = null;
    });
  }

  void showImage(BuildContext context, String? imagePath) {
    if (imagePath != null) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Image.file(File(imagePath)),
        ),
      );
    }
  }

  // void _showSnackbar(String message) {
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       content: Text(message),
  //       backgroundColor: AppColors.primaryColor,
  //       behavior: SnackBarBehavior.floating,
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aito M5'),
        actions: [
          TextButton(
            onPressed: () {
              if (_imagePaths.any((path) => path != null)) {
                Snackbar.snackBar('MEQ Drivers', "Image saved successfully!");
              } else {
                Snackbar.snackBar('MEQ Drivers', "No image selected!");
              }
            },
            child: Text(
              'Done',
              style: TextStyle(color: AppColors.primaryColor),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Center(
            child: Column(
              children: [
                IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          height: height * 0.3,
                          width: width,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 14, vertical: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Add photo'.tr,
                                    style: const TextStyle(
                                        fontSize: 16, color: Colors.grey),
                                  ),
                                  ListTile(
                                    onTap: () {
                                      getImage(1); // Use the correct index
                                      Navigator.pop(context);
                                    },
                                    title: const Text('Camera'),
                                  ),
                                  ListTile(
                                    onTap: () {
                                      pickImage(1); // Use the correct index
                                      Navigator.pop(context);
                                    },
                                    title: const Text('Gallery'),
                                  ),
                                  ListTile(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    title: const Text('Go Back'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                  icon: const Icon(Icons.add_a_photo_outlined),
                ),
                _imagePaths[0] != null
                    ? Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.file(
                              File(_imagePaths[0]!),
                              height: 200,
                              width: 200,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            top: 5,
                            right: 5,
                            child: IconButton(
                              icon: const Icon(Icons.delete_forever_outlined,
                                  color: Colors.red),
                              onPressed: () {
                                deleteImage(1); // Delete the first image
                              },
                            ),
                          ),
                        ],
                      )
                    : const Text('No photo added!'),
              ],
            ),
          ),
          const Spacer(),
          InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Container(
                    height: height * 0.3,
                    width: width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Add photo'.tr,
                              style: const TextStyle(
                                  fontSize: 16, color: Colors.grey),
                            ),
                            ListTile(
                              onTap: () {
                                getImage(
                                    1); // Assuming the first image index is 1
                                Navigator.pop(context);
                              },
                              title: const Text('Camera'),
                            ),
                            ListTile(
                              onTap: () {
                                pickImage(
                                    1); // Assuming the first image index is 1
                                Navigator.pop(context);
                              },
                              title: const Text('Gallery'),
                            ),
                            ListTile(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              title: const Text('Go Back'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
            child: Container(
              height: height * .1,
              width: width,
              decoration: const BoxDecoration(),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.camera_alt_outlined,
                      color: AppColors.primaryColor,
                    ),
                    SizedBox(
                      width: width * .016,
                    ),
                    Text(
                      'ADD VEHICLE PHOTOS',
                      style: TextStyle(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
