import 'package:flutter/material.dart';

class RowDemoFlexible extends StatelessWidget {
  final width = 50.0;
  final height = 50.0;
  const RowDemoFlexible({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Row Flexible'),
          ),
          body: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                  height: width,
                  width: height,
                  child: Image.asset(
                    'assets/images/1.jpg',
                    fit: BoxFit.fill,
                  )),
              Flexible(
                flex: 1,
                fit: FlexFit.loose,
                //Result will be same as Expanded when use "FlexFit.tight"
                // fit: FlexFit.tight,
                child: Container(
                    height: width,
                    width: height,
                    child: Image.asset(
                      'assets/images/2.jpg',
                      fit: BoxFit.fill,
                    )),
              ),
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Container(
                    height: width,
                    width: height,
                    child: Image.asset(
                      'assets/images/3.jpg',
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
