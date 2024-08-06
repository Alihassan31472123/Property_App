import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_request.freezed.dart';
part 'login_request.g.dart';

@unfreezed
class LoginRequest with _$LoginRequest {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  factory LoginRequest({
    @JsonKey(name: 'email') String? email,
    @JsonKey(name: 'pass') String? pass,
  }) = _LoginRequest;

  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);
}
