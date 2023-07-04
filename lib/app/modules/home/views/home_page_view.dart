import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:vd_commmerce/app/modules/home/controllers/home_controller.dart';
import 'package:vd_commmerce/app/modules/widgets/category_icon.dart';
import 'package:get/get.dart';
import 'package:vd_commmerce/app/modules/widgets/product_display_card.dart';

class HomePageView extends GetView<HomeController> {
  const HomePageView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(13.0),
                        isDense: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        hintText: 'Search'),
                  ),
                ),
                const SizedBox(width: 10.0),
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.shopping_cart_outlined)),
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.message_outlined)),
              ],
            ),
            const SizedBox(height: 20.0),
            CarouselSlider(
              options: CarouselOptions(
                  height: 220.0, viewportFraction: 0.95, autoPlay: true),
              items: [1, 2, 3, 4, 5].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: const BoxDecoration(color: Colors.deepPurple),
                        child: Center(
                            child: Text(
                          'Image $i',
                          style: const TextStyle(fontSize: 16.0),
                        )));
                  },
                );
              }).toList(),
            ),
            SizedBox(
              height: 85.0,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return CategoryIcon(
                    onPressed: () {},
                    icon: const Icon(Icons.category_outlined),
                    category: 'Category $index',
                  );
                },
                itemCount: 5,
                scrollDirection: Axis.horizontal,
              ),
            ),
            const Divider(height: 10.0, color: Colors.white38, thickness: 0.5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Best Sale Product',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                TextButton(onPressed: () {}, child: const Text('See more'))
              ],
            ),
            Obx(() {
              return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 0.7),
                  itemCount: controller.products.length,
                  shrinkWrap: true,
                  primary: false,
                  itemBuilder: (context, index) {
                    final product = controller.products[index];
                    return InkWell(
                      onTap: () {
                        Get.toNamed('/product-details', arguments: product);
                      },
                      child: ProductDisplayCard(
                        product: product,
                      ),
                    );
                  });
            })
            // FutureBuilder(
            //     future: getProducts(),
            //     builder: (context, snapshot) {
            //       if (snapshot.hasData) {
            //         final productsList = snapshot.data;
            //         return GridView.builder(
            //             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //                 crossAxisCount: 2, childAspectRatio: 0.7),
            //             itemCount: productsList.length,
            //             shrinkWrap: true,
            //             primary: false,
            //             itemBuilder: (context, index) {
            //               final product = productsList[index];
            //               return InkWell(
            //                 onTap: () {
            //                   Get.toNamed('/product-details',
            //                       arguments: product);
            //                 },
            //                 child: ProductDisplayCard(
            //                   imageURl: product['images'][0]['src'],
            //                   type: product['type'],
            //                   description: product['name'],
            //                   reviewsCount: 456821,
            //                   price: product['price'],
            //                 ),
            //               );
            //             });
            //       } else {
            //         return
            //             // Center(child: ProductDisplayCardLoader());
            //             const Center(child: CircularProgressIndicator());
            //       }
            //     }),
          ],
        ),
      ),
    );
  }
}
