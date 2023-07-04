import 'package:flutter/material.dart';

class ProductDisplayCardLoader extends StatelessWidget {
  const ProductDisplayCardLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170.0,
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
                  child: const Center(child: CircularProgressIndicator())),
              const Positioned(
                  top: 10.0,
                  right: 10.0,
                  child: Icon(Icons.favorite_outline, color: Colors.red)),
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
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    width: 50.0,
                    child: LinearProgressIndicator(
                        color: Color(0xff424242), minHeight: 15.0)),
                SizedBox(height: 5.0),
                LinearProgressIndicator(
                    color: Color(0xff424242), minHeight: 20.0),
                SizedBox(height: 10.0),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.yellow, size: 20.0),
                    LinearProgressIndicator(
                        color: Color(0xff424242), minHeight: 15.0),
                    Spacer(),
                    Text('\$ - -',
                        style: TextStyle(
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
