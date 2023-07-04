// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Order _$$_OrderFromJson(Map<String, dynamic> json) => _$_Order(
      id: json['id'] as int?,
      createdDate: json['created_date'] == null
          ? null
          : DateTime.parse(json['created_date'] as String),
      total: json['total'] as String?,
      billing: Address.fromJson(json['billing'] as Map<String, dynamic>),
      shipping: Address.fromJson(json['shipping'] as Map<String, dynamic>),
      lineItems: (json['line_items'] as List<dynamic>)
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_OrderToJson(_$_Order instance) => <String, dynamic>{
      'created_date': instance.createdDate?.toIso8601String(),
      'total': instance.total,
      'billing': objToJson(instance.billing),
      'shipping': objToJson(instance.shipping),
      'line_items': listObjToJson(instance.lineItems),
    };
