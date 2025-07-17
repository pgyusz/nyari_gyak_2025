import 'package:json_annotation/json_annotation.dart';

part 'api_base_response.g.dart';

@JsonSerializable()
class ApiBaseResponse {
  ApiBaseResponse(this.success, this.message, this.interpretedMessage);

  final String message;
  final String success;
  @JsonKey(name: 'interpreted_msg')
  final String? interpretedMessage;

  factory ApiBaseResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiBaseResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ApiBaseResponseToJson(this);

  @override
  String toString() {
    return 'ApiBaseResponse{message: $message, success: $success}';
  }
}
