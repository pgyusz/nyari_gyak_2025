// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) =>
    CategoryModel(
      json['CategoryID'] as String,
      json['name'] as String,
      json['description'] as String,
      json['categoryImageURL'] as String,
    );

Map<String, dynamic> _$CategoryModelToJson(CategoryModel instance) =>
    <String, dynamic>{
      'CategoryID': instance.id,
      'name': instance.name,
      'description': instance.description,
      'categoryImageURL': instance.image,
    };
