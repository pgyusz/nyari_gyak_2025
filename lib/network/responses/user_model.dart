import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  UserModel(this.id, this.name, this.createdAt, this.dateOfBirth, this.city);

  final String id;
  final String name;
  final String createdAt;
  @JsonKey(name: 'date_of_birth')
  final String dateOfBirth;
  final String city;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
