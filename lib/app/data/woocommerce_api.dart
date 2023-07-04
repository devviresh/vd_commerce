import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:vd_commmerce/app/data/api_key.dart';
import 'package:vd_commmerce/app/models/address/address.dart';
import 'package:vd_commmerce/app/models/customer/customer.dart';
import 'package:vd_commmerce/app/models/order/order.dart';
import '../models/product/products.dart';

class WooCommerceApi extends GetxService {
  final client = Dio(BaseOptions(
      contentType: Headers.jsonContentType,
      baseUrl: ApiConstants.baseUrl,
      headers: {
        'Authorization':
            'Basic ${base64Encode(utf8.encode('${ApiConstants.consumerKey}:${ApiConstants.consumerSecret}'))}',
      }));

//===================================== get products list =======================================
  Future<List<Product>> getProducts() async {
    final res = await client.get('/products');

    if (res.statusCode == 200) {
      final List<dynamic> productsList = res.data;
      final products = productsList.map((e) => Product.fromJson(e)).toList();
      return products;
    } else {
      print(res.statusCode);
      return [];
    }
  }

  //====================================== get Product details ==================================
  Future<Product?> getProductDetails(String productId) async {
    final res = await client.get('/products/$productId');

    if (res.statusCode == 200) {
      final Product product = Product.fromJson(res.data);
      return product;
    } else {
      print(res.statusCode);
      return null;
    }
  }

  //================================= get customers list ========================================
  Future<List<Customer>> getCustomers() async {
    final res = await client.get('/customers');

    if (res.statusCode == 200) {
      final List<dynamic> customersList = res.data;
      final customers = customersList.map((e) => Customer.fromJson(e)).toList();
      print(customers);
      return customers;
    } else {
      print(res.statusCode);
      return [];
    }
  }

  //===================================== create customer ==================================
  Future<void> createCustomer(Address address) async {
    print(address.email);
    try {
      final res = await client.post('/customers', data: {
        "email": address.email,
        "first_name": address.firstName,
        "last_name": address.lastName,
        "billing": address.toJson(),
      });
      if (res.statusCode == 200) {
        // print('customer creates succesfully');
      } else {
        print(res.statusCode);
        // print('ooh ooww');
      }
    } on DioException catch (e) {
      // print(e.response);
      // print(e.error);
      // print(e.message);
    } catch (e) {
      print(e);
    }
  }

  //=====================================  create order  ========================================
  Future<void> createOrder(Order order) async {
    try {
      final res = await client.post('/orders', data: {
        "payment_method": "bacs",
        // "email": "john.doe@example.com",
        "customer_id": 2, //to be passed from shared preference
        "payment_method_title": "Direct Bank Transfer",
        "set_paid": true,
        "billing": order.billing.toJson(),
        "line_items": [
          {"product_id": order.lineItems[0].id, "quantity": 2},
        ],
        "shipping_lines": [
          {
            "method_id": "flat_rate",
            "method_title": "Flat Rate",
            "total": "10.00"
          }
        ]
      });
      if (res.statusCode == 200) {
      } else {
        print(res.statusCode);
      }
    } on DioException catch (e) {
      // print(e.response);
      // print(e.error);
      // print(e.message);
    } catch (e) {
      print(e);
    }
  }

//=====================================  List all orders  ========================================
  Future<List<Order>> getOrders() async {
    final res = await client.get('/orders');

    if (res.statusCode == 200) {
      final List<dynamic> customersList = res.data;
      final orders = customersList.map((e) => Order.fromJson(e)).toList();
      print(orders);
      return orders;
    } else {
      print(res.statusCode);
      return [];
    }
  }
}
