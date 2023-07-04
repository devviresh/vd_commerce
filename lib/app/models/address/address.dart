import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';
part 'address.freezed.dart';
part 'address.g.dart';

@freezed
class Address with _$Address {
  @JsonSerializable(
    fieldRename: FieldRename.snake,
  )
  const factory Address({
    required String firstName,
    required String lastName,
    required String? email,
    required String city,
    required String district,
    required String state,
    required String pincode,
    @Default('India') String country,
    required String phone,
  }) = _Address;

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
}

final addressList = <Address>[].obs;