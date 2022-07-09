import 'package:flutter/material.dart';

class StackDemo extends StatelessWidget {
  const StackDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Stack'),
          ),
          body: Stack(
            alignment: Alignment.center,
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                  height: 300,
                  width: 300,
                  child: Image.asset(
                    'assets/images/1.jpg',
                    fit: BoxFit.fill,
                  )),
              Container(
                  height: 200,
                  width: 200,
                  child: Image.asset(
                    'assets/images/2.jpg',
                    fit: BoxFit.fill,
                  )),
              Container(
                  height: 100,
                  width: 100,
                  child: Image.asset(
                    'assets/images/3.jpg',
                    fit: BoxFit.fill,
                  )),
            ],
          )
          /*const Center(
          child: Text(
            "Hello World!",
            textDirection: TextDirection.ltr,
            style: TextStyle(fontSize: 32, color: Colors.black87),
          ),
        ),*/
          ),
    );
  }
}
