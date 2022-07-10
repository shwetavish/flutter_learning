import 'package:demo_layout_widget/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var nameController = TextEditingController();
  var passwordController = TextEditingController();
  var _validateName = false;
  var _validatePassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const FlutterLogo(
                size: 100.0,
              ),
              const SizedBox(
                height: 50.0,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Name',
                  errorText: _validateName ? 'Enter Name' : null,
                ),
                inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[a-z A-Z]'))],
                controller: nameController,
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Password',
                  errorText: _validatePassword ? 'Enter Password' : null,
                ),
                controller: passwordController,
                obscureText: true,
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () => openHomePage(),
                child: const Text('Login'),
              )
            ],
          ),
        ),
      ),
    );
  }

  openHomePage() {
    setState(() {
      _validateName = nameController.text.isEmpty;
      _validatePassword = passwordController.text.isEmpty;
    });

    if (!_validatePassword && !_validateName) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    }
  }
}
