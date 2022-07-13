import 'package:badges/badges.dart';
import 'package:demo_layout_widget/add_product.dart';
import 'package:demo_layout_widget/product.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _cartItem = 0;
  late final List<Product> productList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo'),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 16, 0),
            child: Badge(
              position: BadgePosition.topEnd(top: 4, end: -8),
              badgeContent: Text(
                '$_cartItem',
                style: const TextStyle(color: Colors.white, fontSize: 10),
              ),
              showBadge: _cartItem > 0 ? true : false,
              child: const Icon(Icons.shopping_cart),
            ),
          )
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            /*itemBuilder: (context, index) {
              if (index % 2 == 0) {
                return buildProduct(index + 1);
              } else {
                return buildProductTile(index + 1);
              }
            },
            itemCount: 50,*/
            itemCount: productList.length,
            itemBuilder: (context, index) {
              return buildProductTile(productList[index]);
            },
          )
          // SingleChildScrollView(
          //   scrollDirection: Axis.vertical,
          //   child: Column(
          //     children: [
          //       buildProduct(),
          //       buildProduct(),
          //       buildProduct(),
          //       buildProduct(),
          //       buildProduct(),
          //       buildProduct(),
          //       buildProduct(),
          //       buildProduct(),
          //       buildProduct(),
          //       buildProduct(),
          //       buildProduct(),
          //     ],
          //   ),
          // ),
          ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          Product product = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddProduct(),
              ));

          setState(() {
            productList.add(product);
          });
          print(productList);

          print('Hello');
          print('Hello 1');
        },
      ),
    );
  }

  buildProduct(int index) {
    return Column(
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                const Icon(
                  Icons.widgets,
                  size: 50,
                  color: Colors.black,
                ),
                const SizedBox(
                  width: 16,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Product $index',
                      style: const TextStyle(color: Colors.black87, fontSize: 18),
                    ),
                    const Text(
                      'Price',
                      style: TextStyle(color: Colors.black45, fontSize: 15),
                    ),
                  ],
                ),
                Expanded(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.add_shopping_cart,
                        color: Colors.black38,
                      ),
                      onPressed: () => _addToCart(),
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

  buildProductTile(Product product) {
    return Card(
      child: ListTile(
          leading: CircleAvatar(
            backgroundImage: FileImage(product.image),
            backgroundColor: Colors.transparent,
          ),
          title: Text(
            product.name,
            style: const TextStyle(color: Colors.black87, fontSize: 18),
          ),
          subtitle: Text(
            '${product.price}',
            style: const TextStyle(color: Colors.black45, fontSize: 15),
          ),
          trailing: IconButton(
            icon: const Icon(
              Icons.add_shopping_cart,
              color: Colors.black38,
            ),
            onPressed: () => _addToCart(),
          )),
    );
  }

  _addToCart() {
    setState(() {
      _cartItem++;
    });
  }
}
