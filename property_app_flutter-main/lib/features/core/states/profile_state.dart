import 'package:apni_property_app/networking/api_response/api_response.dart';
import 'package:apni_property_app/networking/network_exceptions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart' as format;
import '../../../configs/routes/routes_name.dart';
import '../../presentation/screens/home/home_screen.dart';
import '../models/response/userprofile/user_profile_response.dart';
import '../repositery/profile_repositry.dart';

part 'profile_state.freezed.dart';

@freezed
abstract class ProfileState with _$ProfileState {
  const factory ProfileState({required ApiResponse<UserprofileResponse> response}) = _ProfileState;
}

class ProfileStateNotifier extends StateNotifier<ProfileState> {
  final ProfileRepository profileRepository;

  ProfileStateNotifier({required this.profileRepository}) : super(ProfileState(response: ApiResponse.idle())) {
    // Replace 'yourVIDValue' with the actual VID value you want to fetch.
    getUserProfile();
  }

  final firstNameController = TextEditingController();
  final midNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final dateofBirthController = TextEditingController();
  var apiFormattedDate;
  final occupationController = TextEditingController();
  String gender = "Male";
  String countryCodeVal = '+92';
  final nominee1NameController = TextEditingController();
  final nominee1NIDController = TextEditingController();
  final nominee1PhoneController = TextEditingController();
  String nominee1Gender = "Male";
  final nominee1AddressController = TextEditingController();
  final nominee1RelationController = TextEditingController();
  final nominee2NameController = TextEditingController();
  final nominee2NIDController = TextEditingController();
  final nominee2PhoneController = TextEditingController();
  String nominee2Gender = "Male";
  final nominee2AddressController = TextEditingController();
  final nominee2RelationController = TextEditingController();
  final nidController = TextEditingController();
  final addressController = TextEditingController();
  final postalCodeController = TextEditingController();
  final contactController = TextEditingController();
  int stateId = 1;
  int cityId = 1;
  String clientImage = '';
  String base64ImageCode = '';
  int countryId = 1;
  int countryCodeId = 0;

  void _initData() {
    final data = state.response.data?.data;
    if (data == null) return;
    firstNameController.text = data.firstName ?? "";
    midNameController.text = data.middleName ?? "";
    lastNameController.text = data.lastName ?? "";
    apiFormattedDate = data.dateOfBirth ?? "";

    dateofBirthController.text = format.DateFormat('dd-MM-yyyy').format(DateTime.parse(data.dateOfBirth!)) ?? "";
    occupationController.text = data.occupation ?? "";
    gender = data.gender ?? "Male";
    nominee1NameController.text = data.nominee1Name ?? "";
    nominee1NIDController.text = data.nominee1NID ?? "";
    nominee1PhoneController.text = data.nominee1Phone ?? "";
    nominee1Gender = data.nominee1Gender ?? "Male";
    nominee1AddressController.text = data.nominee1Address ?? "";
    postalCodeController.text = data.postal_code ?? "";
    nominee1RelationController.text = data.nominee1Relation ?? "";
    nominee2NameController.text = data.nominee2Name ?? "";
    nominee2NIDController.text = data.nominee2NID ?? "";
    nominee2PhoneController.text = data.nominee2Phone ?? "";
    nominee2Gender = data.nominee2Gender ?? "Male";
    nominee2AddressController.text = data.nominee2Address ?? "";
    nominee2RelationController.text = data.nominee2Relation ?? "";
    nidController.text = data.nid ?? "";
    addressController.text = data.address ?? "";
    contactController.text = data.contactNumber ?? "";
    stateId = data.stateId != null ? data.stateId! : 1;
    cityId = data.cityId != null ? data.cityId! : 1;
    clientImage = data.profilePath != null ? data.profilePath!: "";
    countryId = data.countryId != null ? data.countryId! : 1;
    countryCodeId = data.countryCodeId != null ? data.countryCodeId! : 0;
  }

  Future<void> getUserProfile() async {
    try {
      state = state.copyWith(response: ApiResponse.loading());
      UserprofileResponse response = await profileRepository.getUserProfile();
      var isSuccessFull = response.status == "Success";
      if (isSuccessFull) {
        state = state.copyWith(response: ApiResponse.completed(response));
        _initData();
      } else {
        state = state.copyWith(response: ApiResponse.error(response.message));
      }
    } on NetworkException catch (e) {
      state = state.copyWith(
        response: ApiResponse.error(e.message.toString()),
      );
    } on Exception catch (e) {
      state = state.copyWith(
        response: ApiResponse.error(e.toString()),
      );
    }
  }

  Future<bool> updateUserProfile(context) async {
    final oldState = state;
    try {
      state = state.copyWith(response: ApiResponse.loading());
      print("dddffffffff: ${oldState.response.data?.data?.dateOfBirth}");
      // String formattedAPIDate = format.DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").format(DateTime.parse(dateofBirthController.text));
      print("base 64: $base64ImageCode");
      final data = {
        "client_id": oldState.response.data?.data?.clientID,
        "code": oldState.response.data?.data?.code,
        "email": oldState.response.data?.data?.email,
        "contactNumber": contactController.text,
        "address": addressController.text,
        // "postal_code": postalCodeController.text,
        "firstName": firstNameController.text,
        "middleName": midNameController.text,
        "lastName": lastNameController.text,
        "gender": gender,
        "nominee1Name": nominee1NameController.text,
        "nominee1NID": nominee1NIDController.text,
        "nominee1Phone": nominee1PhoneController.text,
        "nominee1Gender": nominee1Gender,
        "nominee1Address": nominee1AddressController.text,
        "nominee1Relation": nominee1RelationController.text,
        "nominee2Name": nominee2NameController.text,
        "nominee2NID": nominee2NIDController.text,
        "nominee2Phone": nominee2PhoneController.text,
        "nominee2Gender": nominee2Gender,
        "nominee2Address": nominee2AddressController.text,
        "nominee2Relation": nominee2RelationController.text,
        "NID": nidController.text,
        "countryId": countryId,
        "stateId": stateId,
        "cityId": cityId,
        "clientImage": base64ImageCode,
        "occupation": occupationController.text,
        "dateOfBirth": apiFormattedDate,
        "countryCodeId": countryCodeId,
      };
      UserprofileResponse response = await profileRepository.updateUserProfile(data);
      print("after response: $response");
      // Navigator.of(context).pushNamed(
      //   RouteNames.homeRoute,
      //   arguments: HomePage(),
      // );
      var isSuccessFull = response.status == "Success";
      if (isSuccessFull) {
        state = state.copyWith(response: ApiResponse.completed(response));
        return true;
      }
      state = oldState;

      return false;
    } on NetworkException {
      state = oldState;

      return false;
    } on Exception {
      state = oldState;

      return false;
    }
  }
}
