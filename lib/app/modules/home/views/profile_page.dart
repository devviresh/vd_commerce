import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vd_commmerce/app/models/address/address.dart';
import 'package:vd_commmerce/app/modules/checkout/views/checkout_view.dart';
import 'package:vd_commmerce/app/modules/widgets/cart_product_card.dart';
import 'package:vd_commmerce/app/routes/app_pages.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('My Profile',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
            const SizedBox(height: 10.0),
            // const Text(
            //   'Profile Details',
            //   style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            // ),
            const SizedBox(height: 20.0),
            Obx(() {
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: addressList.isEmpty
                      ? ElevatedButton(
                          onPressed: () {
                            Get.toNamed(Routes.ADD_ADDRESS);
                          },
                          child: const Text('Add Details'))
                      : AddressCard(
                          address: addressList[0],
                        ),
                ),
              );
            }),
            const SizedBox(height: 20.0),
            const Text(
              'My Orders',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20.0),
            // Obx(() {
            //   return CartProductCard(product: product)
            // }),
          ],
        ),
      ),
    ));
  }
}
