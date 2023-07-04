import 'package:freezed_annotation/freezed_annotation.dart';
part 'products.freezed.dart';
part 'products.g.dart';

@freezed
class Product with _$Product {
  @JsonSerializable(
    fieldRename: FieldRename.snake,
  )
  const factory Product({
    int? id,
    DateTime? createdDate,
    required String name,
    required String price,
    @JsonKey(toJson: listObjToJson) @Default([]) List<ImageData> images,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}

@freezed
class ImageData with _$ImageData {
  const factory ImageData({
    required String src,
  }) = _Images;

  factory ImageData.fromJson(Map<String, dynamic> json) =>
      _$ImageDataFromJson(json);
}

List<Map<String, dynamic>> listObjToJson(List<ImageData> event) =>
    event.map((e) => e.toJson()).toList();
