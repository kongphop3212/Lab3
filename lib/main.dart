import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); // Added Key parameter

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Shopping Cart',
      home: ShoppingCart(),
    );
  }
}

class ShoppingCart extends StatefulWidget {
  const ShoppingCart({super.key}); // Added Key parameter

  @override
  // ignore: library_private_types_in_public_api
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  int ipadCount = 0;
  int ipadMiniCount = 0;
  int ipadAirCount = 0;
  int ipadProCount = 0;

  final int ipadPrice = 19000;
  final int ipadMiniPrice = 23000;
  final int ipadAirPrice = 29000;
  final int ipadProPrice = 39000;

  int get totalPrice {
    return (ipadCount * ipadPrice) +
        (ipadMiniCount * ipadMiniPrice) +
        (ipadAirCount * ipadAirPrice) +
        (ipadProCount * ipadProPrice);
  }

  String formatPrice(int price) {
    final formatter = NumberFormat('#,##0');
    return formatter.format(price);
  }

  void clearCart() {
    setState(() {
      ipadCount = 0;
      ipadMiniCount = 0;
      ipadAirCount = 0;
      ipadProCount = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'), // Added const
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            buildCartItem('iPad', ipadPrice, ipadCount, (newCount) {
              setState(() {
                ipadCount = newCount;
              });
            }),
            buildCartItem('iPad mini', ipadMiniPrice, ipadMiniCount, (newCount) {
              setState(() {
                ipadMiniCount = newCount;
              });
            }),
            buildCartItem('iPad Air', ipadAirPrice, ipadAirCount, (newCount) {
              setState(() {
                ipadAirCount = newCount;
              });
            }),
            buildCartItem('iPad Pro', ipadProPrice, ipadProCount, (newCount) {
              setState(() {
                ipadProCount = newCount;
              });
            }),
            const SizedBox(height: 20), // Added const
            Text(
              'ราคารวม: ${formatPrice(totalPrice)} บาท',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold), // Added const
            ),
            const SizedBox(height: 20), // Added const
            ElevatedButton(
              onPressed: clearCart,
              child: const Text('Clear'), // Added const
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCartItem(String name, int price, int count, Function(int) onCountChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            '$name: ${formatPrice(price)} บาท',
            style: const TextStyle(fontSize: 16), // Added const
          ),
          Row(
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.remove), // Added const
                onPressed: () {
                  if (count > 0) {
                    onCountChanged(count - 1);
                  }
                },
              ),
              Text('$count', style: const TextStyle(fontSize: 16)), // Added const
              IconButton(
                icon: const Icon(Icons.add), // Added const
                onPressed: () {
                  onCountChanged(count + 1);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
