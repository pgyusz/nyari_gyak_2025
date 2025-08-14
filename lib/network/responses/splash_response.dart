import 'package:json_annotation/json_annotation.dart';
import 'package:nyari_gyak_2025/models/category.dart';
import 'package:nyari_gyak_2025/network/responses/api_base_response.dart';

part 'splash_response.g.dart';

@JsonSerializable()
class SplashResponse extends ApiBaseResponse {
  SplashResponse(
    super.success,
    super.message,
    super.interpretedMessage,
    this.id,
    this.translations,
    this.categories,
  );

  @JsonKey(name: 'ID')
  final String? id;
  final List<Map<String, String>>? translations;
  final List<CategoryModel>? categories;

  factory SplashResponse.fromJson(Map<String, dynamic> json) =>
      _$SplashResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$SplashResponseToJson(this);
}
