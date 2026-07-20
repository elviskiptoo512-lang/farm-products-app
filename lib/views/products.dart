import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/colors.dart';
import 'package:flutter_application_1/models/product.dart';

class ProductsScreen extends StatelessWidget {
  final String? category;

  const ProductsScreen({super.key, this.category});

  @override
  Widget build(BuildContext context) {
    final products = category == null
        ? dummyProducts
        : dummyProducts.where((p) => p.category == category).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category ?? 'Products'),
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: products.isEmpty
          ? const Center(child: Text('No products in this category yet'))
          : GridView.builder(
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 0.75,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return _ProductCard(product: product);
              },
            ),
    );
  }
}

class _ProductCard extends StatelessWidget {
  final Product product;

  const _ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              color: primaryColor.withValues(alpha: 0.1),
              child: product.imagePath.isEmpty
                  ? Icon(Icons.eco, size: 48, color: primaryColor)
                  : Image.asset(
                      product.imagePath,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(Icons.eco, size: 48, color: primaryColor);
                      },
                    ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  'KES ${product.price.toStringAsFixed(0)} / ${product.unit}',
                  style: TextStyle(color: secondaryColor, fontSize: 13),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
