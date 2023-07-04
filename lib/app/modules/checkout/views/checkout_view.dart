import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vd_commmerce/app/data/woocommerce_api.dart';
import 'package:vd_commmerce/app/models/address/address.dart';
import 'package:vd_commmerce/app/models/order/order.dart';
import 'package:vd_commmerce/app/modules/product_details/controllers/product_details_controller.dart';
import 'package:vd_commmerce/app/routes/app_pages.dart';

import '../controllers/checkout_controller.dart';

class CheckoutView extends GetView<CheckoutController> {
  const CheckoutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(15.0),
        children: [
          const Text(
            'Select a delivery address',
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
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
            'Select a payment method',
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20.0),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Checkbox(value: true, onChanged: (value) {}),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Cash on Delivery',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0)),
                      Text('Cash, UPI and Cards accepted')
                    ],
                  ),
                ],
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Checkbox(value: false, onChanged: (value) {}),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Net Banking/UPI',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0)),
                      Text('Google Pay, Phone Pay, Paytm')
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          ElevatedButton(
              onPressed: addressList.isEmpty
                  ? () {
                      Get.snackbar(
                          'Address not found!', 'Add details to continue..',
                          snackPosition: SnackPosition.BOTTOM,
                          margin: EdgeInsets.all(10.0));
                    }
                  : () {
                      final Order order = Order(
                          billing: addressList[0],
                          shipping: addressList[0],
                          lineItems: cart.cartProducts);
                      WooCommerceApi().createOrder(order);
                    },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  padding: const EdgeInsets.all(15.0),
                  foregroundColor: Colors.teal[700]),
              child: const Text(
                'Place Order',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
              ))
        ],
      ),
    );
  }
}

class AddressCard extends StatelessWidget {
  const AddressCard({super.key, required this.address});

  final Address address;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text('Viresh Dev',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
        Text(address.city, style: const TextStyle(fontSize: 18.0)),
        Text('${address.district}, ${address.state}, ${address.pincode}',
            style: const TextStyle(fontSize: 18.0)),
        Text(address.country, style: const TextStyle(fontSize: 18.0)),
        Row(
          children: [
            const Icon(Icons.phone_iphone_rounded),
            Text('Phone : ${address.phone}',
                style: const TextStyle(fontSize: 18.0))
          ],
        ),
        const SizedBox(height: 10.0),
        OutlinedButton(
            onPressed: () {
              Get.toNamed(Routes.ADD_ADDRESS);
            },
            child: const Text('Edit Address')),
        const SizedBox(height: 10.0),
        OutlinedButton(
            onPressed: () {
              addressList.remove(address);
            },
            child: const Text('Remove Address')),
      ],
    );
  }
}
