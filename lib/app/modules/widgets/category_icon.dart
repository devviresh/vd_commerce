import 'package:flutter/material.dart';

class CategoryIcon extends StatelessWidget {
  const CategoryIcon({super.key, required this.onPressed,required this.icon, required this.category});

  final Icon icon;
  final VoidCallback onPressed;
  final String category;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0,top: 10.0),
      child: Column(
        children: [
          MaterialButton(
            onPressed: onPressed,
            color: Colors.white12,
            minWidth: 0.0,
            padding: const EdgeInsets.all(10.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: icon,
          ),
          const SizedBox(height: 10.0),
          Text(category,style: const TextStyle(fontSize: 12.0,color: Colors.white60),),
        ],
      ),
    );
  }
}