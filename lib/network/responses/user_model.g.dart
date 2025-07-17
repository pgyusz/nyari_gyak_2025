// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
  json['id'] as String,
  json['name'] as String,
  json['createdAt'] as String,
  json['date_of_birth'] as String,
  json['city'] as String,
);

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'createdAt': instance.createdAt,
  'date_of_birth': instance.dateOfBirth,
  'city': instance.city,
};
