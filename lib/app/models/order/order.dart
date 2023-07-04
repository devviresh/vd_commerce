import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';
import 'package:vd_commmerce/app/models/address/address.dart';
import 'package:vd_commmerce/app/models/product/products.dart';
part 'order.freezed.dart';
part 'order.g.dart';

@freezed
class Order with _$Order{
  @JsonSerializable(
    fieldRename: FieldRename.snake,
  )
  const factory Order({
    @JsonKey(includeToJson: false) int? id,
    DateTime? createdDate,
    String? total,
    @JsonKey(toJson: objToJson) required Address billing,
    @JsonKey(toJson: objToJson) required Address shipping,
    @JsonKey(toJson: listObjToJson) required List<Product> lineItems,
}) = _Order;

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
}

Map<String, dynamic>? objToJson(event) => event?.toJson();

List<Map<String, dynamic>> listObjToJson(List<Product> event) =>
    event.map((e) => e.toJson()).toList();


final ordersList = <Order>[].obs;