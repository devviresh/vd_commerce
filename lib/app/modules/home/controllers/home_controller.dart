import 'package:get/get.dart';
import 'package:vd_commmerce/app/data/woocommerce_api.dart';
import 'package:vd_commmerce/app/models/product/products.dart';

class HomeController extends GetxController {
  final WooCommerceApi _wooCommerceApi;
  final products = <Product>[].obs;

  HomeController(this._wooCommerceApi);

  @override
  void onInit() {
    _wooCommerceApi.getProducts().then((value) {
      products.value = value;
    });

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
