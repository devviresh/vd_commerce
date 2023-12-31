import 'package:freezed_annotation/freezed_annotation.dart';
part 'customer.freezed.dart';
part 'customer.g.dart';

@freezed
class Customer with _$Customer {
  @JsonSerializable(
    fieldRename: FieldRename.snake,
  )
  const factory Customer(
      {required int id,
      required String firstName,
      required String lastName,
      required String email,
      required Object shipping}) = _Customer;

  factory Customer.fromJson(Map<String, dynamic> json) =>
      _$CustomerFromJson(json);
}
