import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

@JsonSerializable()
class CategoryModel {
  CategoryModel(this.id, this.name, this.description, this.image);
  @JsonKey(name: "CategoryID")
  final String id;
  final String name;
  final String description;
  @JsonKey(name: "categoryImageURL")
  final String image;

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}
