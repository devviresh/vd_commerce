import 'package:flutter/material.dart';
import 'package:vd_commmerce/app/modules/product_details/controllers/product_details_controller.dart';
import 'package:vd_commmerce/app/modules/widgets/cart_product_card.dart';
import 'package:vd_commmerce/app/routes/app_pages.dart';
import 'package:get/get.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const Text('My Cart',
                    style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
                const SizedBox(height: 10.0),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      if (cart.cartProducts.isEmpty) {
                        return const Column(
                          children: [
                            SizedBox(height: 120.0),
                            Text(
                              'Cart is empty..',
                              style: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(height: 10.0),
                            Text('Visit Homepage to view Products!'),
                          ],
                        );
                      }
                      return CartProductCard(
                        product: cart.cartProducts[0],
                      );
                    },
                    itemCount: cart.cartProducts.isEmpty
                        ? 1
                        : cart.cartProducts.length,
                  ),
                ),
                // Expanded(
                //     child: SingleChildScrollView(
                //       physics: BouncingScrollPhysics(),
                //   child: Column(
                //     children: [
                //       for(int i=0;i<5;i++)
                //         CartProductCard()
                //     ],
                //   ),
                // )),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Total',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0),
                        ),
                        Text('\$ ${cart.getCartValue()}',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                                color: Colors.teal)),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    ElevatedButton(
                        onPressed: cart.cartProducts.isEmpty
                            ? () {
                          Get.snackbar(
                              'Cart is empty', 'Try adding some product',
                          snackPosition: SnackPosition.BOTTOM);
                        }
                            : () {
                          Get.toNamed(Routes.CHECKOUT);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.teal,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            padding:
                            const EdgeInsets.symmetric(vertical: 15.0)),
                        child: const Text('CheckOut'))
                  ],
                )
              ],
            )));
  }
}
