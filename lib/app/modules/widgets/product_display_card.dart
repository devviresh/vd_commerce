import 'package:flutter/material.dart';
import 'package:vd_commmerce/app/models/product/products.dart';

class ProductDisplayCard extends StatelessWidget {
  final Product product;

  const ProductDisplayCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160.0,
      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                color: Colors.blueGrey,
                height: 120.0,
                width: double.infinity,
                child: Image.network(
                  product.images.first.src,
                  fit: BoxFit.cover,
                ),
              ),
              const Positioned(
                  top: 10.0,
                  right: 10.0,
                  child: Icon(Icons.favorite, color: Colors.red)),
            ],
          ),
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0)),
              color: Colors.white12,
            ),
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("type",
                    style: TextStyle(fontSize: 12.0, color: Colors.white70)),
                const SizedBox(height: 5.0),
                Text(product.name),
                const SizedBox(height: 10.0),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.yellow, size: 20.0),
                    Text(3545.toString(),
                        style: const TextStyle(
                            fontSize: 12.0, color: Colors.white70)),
                    const Spacer(),
                    Text('\$${product.price}',
                        style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
