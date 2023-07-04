import 'package:vd_commmerce/app/models/product/products.dart';

class Cart {

  List<Product> cartProducts = [];

  bool addToCart(Product product){
    if(cartProducts.contains(product)){
      return false;
    }else{
      cartProducts.add(product);
      return true;
    }
  }

  String getCartValue(){
    double total = 0;
    for (var item in cartProducts){
      total+=int.parse(item.price);
    }
    return total.toString();
  }

}