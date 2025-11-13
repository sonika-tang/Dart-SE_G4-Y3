import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Products')),
        body: Container(
          color: Colors.blue,
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.all(16),
          child: Column(
            children: const [
              ExpandedProductCard(product: Product.dart),
              ExpandedProductCard(product: Product.flutter),
              ExpandedProductCard(product: Product.firebase),
            ],
          ),
        ),
      ),
    ),
  );
}

class ExpandedProductCard extends StatelessWidget {
  final Product product;
  const ExpandedProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      width: double.infinity,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(product.image, width: 60, height: 60),
              const SizedBox(height: 16),
              Text(
                product.title,
                style: const TextStyle(fontSize: 20, color: Colors.black),
              ),
              const SizedBox(height: 4),
              Text(
                product.description,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum Product {
  dart(
    title: 'Dart',
    description: 'the best object language',
    image:
        '/Users/nika/Computer_Science/Term1-Year3/Flutter/Lab_Practice/Dart-SE_G4-Y3/flutter_practice/lib/w5_practice/assets/ex3/dart.png',
  ),
  flutter(
    title: 'Flutter',
    description: 'the best mobile wider library',
    image:
        '/Users/nika/Computer_Science/Term1-Year3/Flutter/Lab_Practice/Dart-SE_G4-Y3/flutter_practice/lib/w5_practice/assets/ex3/flutter.png',
  ),
  firebase(
    title: 'Firebase',
    description: 'the best cloud database',
    image:
        '/Users/nika/Computer_Science/Term1-Year3/Flutter/Lab_Practice/Dart-SE_G4-Y3/flutter_practice/lib/w5_practice/assets/ex3/firebase.png',
  );

  const Product({
    required this.title,
    required this.description,
    required this.image,
  });

  final String title;
  final String description;
  final String image;
}
