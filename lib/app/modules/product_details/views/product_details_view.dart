import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:vd_commmerce/app/modules/widgets/product_display_card.dart';
import 'package:vd_commmerce/app/routes/app_pages.dart';

import '../controllers/product_details_controller.dart';

class ProductDetailsView extends GetView<ProductDetailsController> {
  const ProductDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.favorite)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.share_rounded)),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.shopping_cart_outlined)),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white12,
              ),
              padding: const EdgeInsets.all(5.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: controller.product.images
                        .map((e) => Container(
                              margin: const EdgeInsets.all(5.0),
                              height: 50.0,
                              width: 50.0,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(5.0)),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5.0),
                                  child: Image.network(
                                    e.src,
                                    fit: BoxFit.cover,
                                  )),
                            ))
                        .toList(),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(5.0),
                      height: 300.0,
                      decoration: BoxDecoration(
                          color: Colors.purple,
                          borderRadius: BorderRadius.circular(10.0)),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.network(
                            controller.product.images.first.src,
                            fit: BoxFit.cover,
                          )),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 10.0),
            const Row(
              children: [
                Icon(Icons.storefront_outlined),
                SizedBox(width: 10.0),
                Text('amazon.com')
              ],
            ),
            const SizedBox(height: 10.0),
            Text(controller.product.name,
                style: const TextStyle(color: Colors.blueGrey, fontSize: 18.0)),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  '3.5',
                  style: TextStyle(fontSize: 16.0),
                ),
                const SizedBox(width: 5.0),
                RatingBarIndicator(
                  itemBuilder: (context, index) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  itemCount: 5,
                  itemSize: 24.0,
                  rating: 3.5,
                ),
                const Spacer(),
                TextButton(onPressed: () {}, child: const Text('456 reviews'))
              ],
            ),
            const Text(
              'Description',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10.0),
            const Text(
                'It had been her dream for years but Dana had failed to take any action toward making it come true. There had always been a good excuse to delay or prioritize another project. As she woke, she realized she was once again at a crossroads. Would it be another excuse or would she finally find the courage to pursue her dream? Dana rose and took her first step.'),
            const SizedBox(height: 15.0),
            const Text(
              'Recommendations',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10.0),
            SizedBox(
              height: 240.0,
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Get.toNamed(Routes.PRODUCT_DETAILS,
                            preventDuplicates: false);
                      },
                      child: ProductDisplayCard(
                        product: controller.product,
                        // imageURl: '',
                        // type: 'Shirt',
                        // description: 'description of the shirt is as follows',
                        // reviewsCount: 456821,
                        // price: '12.35',
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  'Total Price',
                  style: TextStyle(fontSize: 12.0, color: Colors.white60),
                ),
                Text('\$ ${controller.product.price}',
                    style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal))
              ],
            ),
            Expanded(child: Container()),
            MaterialButton(
                onPressed: () {},
                color: Colors.teal,
                padding: const EdgeInsets.all(0.0),
                height: 45.0,
                child: const Row(
                  children: [
                    Icon(Icons.shopping_bag),
                    SizedBox(width: 8.0),
                    Text('1')
                  ],
                )),
            MaterialButton(
                onPressed: () {
                  cart.addToCart(controller.product) ?Get.snackbar(
                    'Product Added',
                    'Check in cart page',
                    snackPosition: SnackPosition.BOTTOM,
                    margin: EdgeInsets.all(10.0),
                  ):Get.snackbar(
                    'Product already in cart',
                    'Check in cart page for details',
                    snackPosition: SnackPosition.BOTTOM,
                    margin: EdgeInsets.all(10.0),


                  );
                  // Get.snackbar(
                  //   'Product Added',
                  //   'Check in cart page',
                  //   snackPosition: SnackPosition.BOTTOM,
                  //   margin: EdgeInsets.all(10.0),
                  // );
                  // print(cart.cartProducts[0].price);
                },
                color: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                height: 45.0,
                child: const Text(
                  'Add to cart',
                  style: TextStyle(color: Colors.teal),
                )),
          ],
        ),
      ),
    );
  }
}
