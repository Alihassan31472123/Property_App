import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_request.freezed.dart';

part 'sign_up_request.g.dart';

@unfreezed
class SignUpRequest with _$SignUpRequest {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  factory SignUpRequest({
    @JsonKey(name: 'clientID') @Default(0) int? clientID,
    @JsonKey(name: 'email') String? email,
    @JsonKey(name: 'firstName') String? firstName,
    @JsonKey(name: 'middleName') String? middleName,
    @JsonKey(name: 'lastName') String? lastName,
    @JsonKey(name: 'contactNumber') String? contactNumber,
    @JsonKey(name: 'password') String? password,
    @JsonKey(name: 'insertedBy') int? insertedBy,
    @JsonKey(name: 'insertedIp') String? insertedIp,
    @JsonKey(name: 'businessID') @Default(1) int? businessID,
    @JsonKey(name: 'isActive') @Default(true) bool? isActive,
    @JsonKey(name: 'countryCodeId') int? countryCodeID,
    @JsonKey(name: 'age') int? age,
    @JsonKey(name: 'countryId') int? countryId,
    @JsonKey(name: 'stateId') int? stateId,
    @JsonKey(name: 'cityId') int? cityId,
    @JsonKey(name: 'address') String? address,
    @JsonKey(name: 'postal_code') String? postal_code,
    @JsonKey(name: 'dateOfBirth') String? dateOfBirth,
  }) = _SignUpRequest;

  factory SignUpRequest.fromJson(Map<String, dynamic> json) =>
      _$SignUpRequestFromJson(json);
}
