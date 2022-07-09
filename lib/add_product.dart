import 'package:flutter/material.dart';

class AddProduct extends StatelessWidget {
  AddProduct({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const ImageIcon(AssetImage('assets/images/1.jpg'), size: 50),
              const SizedBox(
                height: 50.0,
              ),
              TextFormField(
                decoration: const InputDecoration(hintText: 'Product Name'),
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
    );
  }
}
