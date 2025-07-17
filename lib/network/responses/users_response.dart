import 'package:json_annotation/json_annotation.dart';
import 'package:nyari_gyak_2025/network/responses/api_base_response.dart';
import 'package:nyari_gyak_2025/network/responses/user_model.dart';

part 'users_response.g.dart';

@JsonSerializable()
class UsersResponse extends ApiBaseResponse {
  UsersResponse(
    super.success,
    super.message,
    super.interpretedMessage,
    this.users,
  );

  final List<UserModel> users;

  factory UsersResponse.fromJson(Map<String, dynamic> json) =>
      _$UsersResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$UsersResponseToJson(this);
}
