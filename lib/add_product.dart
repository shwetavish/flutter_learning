import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final _formKey = GlobalKey<FormState>();
  String buttonText = 'Select an Image';
  CroppedFile? imageFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  color: Colors.grey[400],
                  child: (imageFile == null)
                      ? const Text('')
                      : Image.file(
                          File(imageFile!.path),
                        ),
                ),
                TextButton(
                    onPressed: () {
                      // _chooseImageAlert(context);
                      _showBottomSheet(context);
                    },
                    child: Text(buttonText)),
                const SizedBox(
                  height: 50.0,
                ),
                TextFormField(
                  decoration: const InputDecoration(hintText: 'Product Name'),
                  inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[a-z A-Z]'))],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter Product Name';
                    } else {
                      return null;
                    }
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(hintText: 'Price'),
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter Price';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pop(context);
                      }
                    },
                    child: const Text('Save'))
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                child: Text(
                  'Select Image',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                title: const Text('Camera'),
                onTap: () {
                  _openCameraGallery(ImageSource.camera);
                },
              ),
              ListTile(
                title: const Text('Gallery'),
                onTap: () {
                  _openCameraGallery(ImageSource.gallery);
                },
              )
            ],
          );
        });
  }

  void _chooseImageAlert(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("From where do you want to take the image?"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  child: const Text('Camera'),
                  onTap: () {
                    _openCameraGallery(ImageSource.camera);
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                GestureDetector(
                  child: const Text('Gallery'),
                  onTap: () {
                    _openCameraGallery(ImageSource.gallery);
                  },
                ),
              ],
            ),
          );
        });
  }

  void _openCameraGallery(ImageSource imageSource) async {
    Navigator.pop(context);
    try {
      final image = await ImagePicker().pickImage(source: imageSource);
      if (image == null) {
        return;
      }
      log('_openCameraGallery path ${image.path}');
      _cropImage(image.path);
    } catch (e) {
      log('_openCameraGallery Error: $e');
    }
  }

  void _cropImage(String path) async {
    try {
      log('_cropImage path: $path');

      CroppedFile? _croppedImage = await ImageCropper().cropImage(
        sourcePath: path,
        maxHeight: 1080,
        maxWidth: 1080,
      );

      if (_croppedImage != null) {
        setState(() {
          buttonText = 'Change Image';
          imageFile = _croppedImage;
        });
      }
    } catch (e) {
      log('_cropImage Error: $e');
    }
  }
}
