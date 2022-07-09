import 'package:flutter/material.dart';

class RowDemoExpanded extends StatelessWidget {
  final width = 50.0;
  final height = 50.0;
  const RowDemoExpanded({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Row Expanded'),
          ),
          body: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                  height: width,
                  width: height,
                  child: Image.asset(
                    'assets/images/3.jpg',
                    fit: BoxFit.fill,
                  )),
              Expanded(
                child: Container(
                    height: width,
                    width: height,
                    child: Image.asset(
                      'assets/images/2.jpg',
                      fit: BoxFit.fill,
                    )),
              ),
              Expanded(
                child: Container(
                    height: width,
                    width: height,
                    child: Image.asset(
                      'assets/images/1.jpg',
                      fit: BoxFit.fill,
                    )),
              ),
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
