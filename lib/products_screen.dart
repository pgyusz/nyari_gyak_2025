import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nyari_gyak_2025/dummy_data.dart';
import 'package:nyari_gyak_2025/product.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children:
              products
                  .map((Product product) => Row(children: [Text(product.name)]))
                  .toList(),
        ),
      ),
    );
  }
}
