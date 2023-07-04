// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Product _$$_ProductFromJson(Map<String, dynamic> json) => _$_Product(
      id: json['id'] as int?,
      createdDate: json['created_date'] == null
          ? null
          : DateTime.parse(json['created_date'] as String),
      name: json['name'] as String,
      price: json['price'] as String,
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => ImageData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_ProductToJson(_$_Product instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_date': instance.createdDate?.toIso8601String(),
      'name': instance.name,
      'price': instance.price,
      'images': listObjToJson(instance.images),
    };

_$_Images _$$_ImagesFromJson(Map<String, dynamic> json) => _$_Images(
      src: json['src'] as String,
    );

Map<String, dynamic> _$$_ImagesToJson(_$_Images instance) => <String, dynamic>{
      'src': instance.src,
    };
