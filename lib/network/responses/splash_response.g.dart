// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SplashResponse _$SplashResponseFromJson(Map<String, dynamic> json) =>
    SplashResponse(
      json['success'] as String,
      json['message'] as String,
      json['interpreted_msg'] as String?,
      json['ID'] as String?,
      (json['translations'] as List<dynamic>?)
          ?.map((e) => Map<String, String>.from(e as Map))
          .toList(),
      (json['categories'] as List<dynamic>?)
          ?.map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SplashResponseToJson(SplashResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'success': instance.success,
      'interpreted_msg': instance.interpretedMessage,
      'ID': instance.id,
      'translations': instance.translations,
      'categories': instance.categories,
    };
