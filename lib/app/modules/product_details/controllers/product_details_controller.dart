import 'package:get/get.dart';
import 'package:vd_commmerce/app/models/cart/cart.dart';
import 'package:vd_commmerce/app/models/product/products.dart';

Cart cart = Cart();

class ProductDetailsController extends GetxController {
  final product = Get.arguments as Product;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
