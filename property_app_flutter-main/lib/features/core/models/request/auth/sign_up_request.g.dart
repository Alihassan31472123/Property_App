// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SignUpRequest _$$_SignUpRequestFromJson(Map<String, dynamic> json) =>
    _$_SignUpRequest(
      clientID: json['clientID'] as int? ?? 0,
      email: json['email'] as String?,
      firstName: json['firstName'] as String?,
      middleName: json['middleName'] as String?,
      lastName: json['lastName'] as String?,
      contactNumber: json['contactNumber'] as String?,
      password: json['password'] as String?,
      insertedBy: json['insertedBy'] as int?,
      insertedIp: json['insertedIp'] as String?,
      businessID: json['businessID'] as int? ?? 1,
      isActive: json['isActive'] as bool? ?? true,
      countryCodeID: json['countryCodeId'] as int?,
      age: json['age'] as int?,
      countryId: json['countryId'] as int?,
      stateId: json['stateId'] as int?,
      cityId: json['cityId'] as int?,
      address: json['address'] as String?,
      postal_code: json['postal_code'] as String?,
      dateOfBirth: json['dateOfBirth'] as String?,
    );

Map<String, dynamic> _$$_SignUpRequestToJson(_$_SignUpRequest instance) =>
    <String, dynamic>{
      'clientID': instance.clientID,
      'email': instance.email,
      'firstName': instance.firstName,
      'middleName': instance.middleName,
      'lastName': instance.lastName,
      'contactNumber': instance.contactNumber,
      'password': instance.password,
      'insertedBy': instance.insertedBy,
      'insertedIp': instance.insertedIp,
      'businessID': instance.businessID,
      'isActive': instance.isActive,
      'countryCodeId': instance.countryCodeID,
      'age': instance.age,
      'countryId': instance.countryId,
      'stateId': instance.stateId,
      'cityId': instance.cityId,
      'address': instance.address,
      'postal_code': instance.postal_code,
      'dateOfBirth': instance.dateOfBirth,
    };
