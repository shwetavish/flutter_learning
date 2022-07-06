import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Flutter Demo'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                buildProduct(),
                buildProduct(),
                buildProduct(),
                buildProduct(),
                buildProduct(),
                buildProduct(),
              ],
            ),
          )),
    );
  }

  buildProduct() {
    return Column(
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                const Icon(
                  Icons.widgets,
                  size: 50,
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Product Name',
                      style: TextStyle(color: Colors.black87, fontSize: 18),
                    ),
                    Text(
                      'Price',
                      style: TextStyle(color: Colors.black45, fontSize: 15),
                    ),
                  ],
                ),
                Expanded(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Icon(
                      Icons.star,
                      color: Colors.black38,
                    ),
                  ],
                ))
              ],
            ),
          ),
        ),
      ],
    );
  }

  buildProductTile() {
    return const ListTile(
      leading: Icon(
        Icons.account_circle,
        size: 50,
      ),
      title: Text('Product 1'),
      subtitle: Text('Description 1'),
      trailing: Icon(Icons.star),
    );
  }
}
