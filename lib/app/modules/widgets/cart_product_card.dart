import 'package:flutter/material.dart';
import 'package:vd_commmerce/app/models/product/products.dart';

class CartProductCard extends StatelessWidget {
  final Product product;

  const CartProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      decoration: BoxDecoration(
          color: Colors.white12, borderRadius: BorderRadius.circular(10.0)),
      child: Row(
        children: [
          Container(
            height: 100.0,
            width: 100.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.teal,
            ),
            child: Image.network(
              product.images.first.src,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.name,
                    style: const TextStyle(
                        fontSize: 18.0, fontWeight: FontWeight.w500)),
                const Text('T shirt', style: TextStyle(color: Colors.white60)),
                const SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const AddRemoveProductWidget(),
                    const SizedBox(width: 10.0),
                    Text('\$${product.price}',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                            color: Colors.teal)),
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

class AddRemoveProductWidget extends StatelessWidget {
  const AddRemoveProductWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35.0,
      width: 108.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        children: [
          IconButton(
              onPressed: () {},
              padding: EdgeInsets.zero,
              icon: const Icon(
                Icons.remove,
                color: Colors.black54,
              )),
          const Text(
            '1',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18.0),
          ),
          IconButton(
              onPressed: () {},
              padding: EdgeInsets.zero,
              icon: const Icon(
                Icons.add,
                color: Colors.black54,
              )),
        ],
      ),
    );
  }
}
