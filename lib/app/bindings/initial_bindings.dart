import 'package:get/get.dart';
import 'package:vd_commmerce/app/data/woocommerce_api.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WooCommerceApi>(() => WooCommerceApi());
  }
}
