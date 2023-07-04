import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:vd_commmerce/app/modules/home/views/cart_page.dart';
import 'package:vd_commmerce/app/modules/home/views/home_page_view.dart';
import 'package:vd_commmerce/app/modules/home/views/profile_page.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 4,
      child: Scaffold(
        body: TabBarView(
          children: [
            const HomePageView(),
            Container(),
            const CartPage(),
            const ProfilePage()
          ],
        ),
        bottomNavigationBar: const TabBar(
          tabs: [
            Tab(icon: Icon(Icons.home), text: 'Home'),
            Tab(icon: Icon(Icons.favorite), text: 'Favourite'),
            Tab(icon: Icon(Icons.shopping_cart), text: 'Cart'),
            Tab(icon: Icon(Icons.person), text: 'Profile'),
          ],
        ),
      ),
    );
  }
}
