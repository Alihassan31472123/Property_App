import 'package:apni_property_app/configs/res/resource/src/strings.dart';
import 'package:apni_property_app/configs/res/style/style.dart';
import 'package:apni_property_app/configs/routes/routes_name.dart';
import 'package:apni_property_app/features/core/providers/state_providers.dart';
import 'package:apni_property_app/features/core/states/auth_state/auth_state.dart';
import 'package:apni_property_app/features/presentation/components/app_text_field.dart';
import 'package:apni_property_app/features/presentation/components/base_screen.dart';
import 'package:apni_property_app/helper/dialogs/loading_dialog.dart';
import 'package:apni_property_app/helper/extenstions.dart';
import 'package:apni_property_app/helper/helpers.dart';
import 'package:apni_property_app/networking/api_response/api_response.dart';
import 'package:apni_property_app/utils/constants.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:apni_property_app/helper/navigation_extentions.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../configs/shared_prefrence_keys.dart';
import '../../../core/providers/providers.dart';
import '../../../core/repositery/getCountryCode_repository.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  String? selectedCode = "+92";
  String? selectedState = "Punjab";
  String? selectedCountry = "Pakistan";
  String? selectedCity = "Lahore";
  int selectedCodeID = 1;
  int selectedStateID = 1;
  int selectedCountryID = 1;
  int selectedCityID = 1;
  int calculatedAge = 0;
  String dateOfBirth = '';
  bool isChecked = false;

  List<dynamic> countryCodeList = [];
  String? password;
  String? confirmPassword;
  TextEditingController controllerAge = TextEditingController();


  void handleCountrySelection(int selectedCountryId) async {
    // Fetch states for the selected country
    var stateList = await GetCountryCode().GetStateList(selectedCountryId);

    // Now update the UI with the new state list
    setState(() {
      selectedCountryID = selectedCountryId;
      AppConstants.getStateValue = stateList;
      selectedStateID = 1; // Reset selected state ID
    });
  }

  @override
  Widget build(BuildContext context) {
    var authState = ref.watch(authStateProvider);
    final authStateCountryCode = ref.watch(myCountryCode);
    final authStateCountryCode1 = ref.watch(myStateCode(selectedCountryID));
    final authStateCountryCode2 = ref.watch(myCountryList);
    final authStateCountryCode3 = ref.watch(myCityList(selectedStateID));
    final authStateCountryCode4 = ref.watch(myGetPrivacy);
    if(AppConstants.getCountryCodeValue.isEmpty){
      authState.signUpRequest?.countryCodeID = 1;
      print("ddddfffff: ${authState.signUpRequest?.countryCodeID}");
      print("ffdsfsdfsd: ${selectedState}");
    }

    if(AppConstants.getStateValue.isEmpty){
      authState.signUpRequest?.stateId = 1;
      print("ddddfffff: ${authState.signUpRequest?.stateId}");
    }

    if(AppConstants.getCountryValue.isEmpty){
      authState.signUpRequest?.countryId = 1;
      print("ddddfffff: ${authState.signUpRequest?.countryId}");

    }

    if(AppConstants.getCityValue.isEmpty){
      authState.signUpRequest?.cityId = 1;

    }
    ref.listen<AuthState>(authStateProvider, (previous, next) async {
      if (previous!.registerResponse?.status != next.registerResponse?.status) {
        if (next.registerResponse?.status == Status.LOADING) {
          Future(() => LoadingDialog.showLoadingIndicator(context));
        } else if (next.registerResponse?.status == Status.SUCCESS) {
          var message = next.registerResponse?.data?.message ??
              next.registerResponse?.message ??
              "Register Successfully";
          var isSuccessFull = next.registerResponse?.data?.status == Status.SUCCESS.name;
          LoadingDialog.hideDialog(context);
          showDialog(
              context: context,
              builder: (_) => AlertDialog(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0))),
                backgroundColor: Colors.white,
                content:  Container(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.check_circle, color: Colors.green, size: 50,),
                          SizedBox(
                            height: 20,
                          ),
                          Text("$message")
                        ])),
              ));
          // context.showSnackBar(message: message);
          if (isSuccessFull) {
            context.pushReplacement(routeName: RouteNames.loginRoute);
          }
        } else if (next.registerResponse?.status == Status.ERROR) {
          var message = next.registerResponse?.data?.message ??
              next.registerResponse?.message ??
              "Something went wrong";
          LoadingDialog.hideDialog(context);
          context.showSnackBar(message: message);
        }
      }
    });
    return ScreenBase(
      screenTitle: Text(Strings.register),
      screenBody: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24.0, vertical: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Strings.enterYourDetails,
                        style: const TextStyle().copyWith(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      Text(
                        Strings.firstName,
                        style: const TextStyle().copyWith(fontSize: 12.0),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      AppTextField(
                        readOnly: false,
                        validator: (value) =>
                        value.isEmpty ? Strings.firstName : null,
                        hintText: Strings.firstName,
                        onChanged: (String? value) {},
                        onSaved: (String? value) {
                          authState.signUpRequest?.firstName = value;
                        },
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        Strings.middleName,
                        style: const TextStyle().copyWith(fontSize: 12.0),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      AppTextField(
                        readOnly: false,
                        // validator: (value) =>
                        //     value.isEmpty ? Strings.middleName : null,
                        hintText: Strings.middleName,
                        onChanged: (String? value) {},
                        onSaved: (String? value) {
                          authState.signUpRequest?.middleName = value;
                        },
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        Strings.lastName,
                        style: const TextStyle().copyWith(fontSize: 12.0),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      AppTextField(
                        readOnly: false,
                        validator: (value) =>
                        value.isEmpty ? Strings.lastName : null,
                        hintText: Strings.lastName,
                        onChanged: (String? value) {},
                        onSaved: (String? value) {
                          authState.signUpRequest?.lastName = value;
                        },
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        "Date of Birth",
                        style: const TextStyle().copyWith(fontSize: 12.0),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      AppTextField(
                        readOnly: true,
                        textEditingController: controllerAge,
                        validator: (value) =>
                        value.isEmpty ? Strings.age : null,
                        hintText: "Date of Birth",
                        onTap: () async{
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime.now(),
                          );

                          if (pickedDate != null) {
                            print(pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000

                            // Calculate age
                             // Age in years
                            DateTime currentDate = DateTime.now();
                            int age = currentDate.year - pickedDate.year;
                            if (pickedDate.month > currentDate.month ||
                                (pickedDate.month == currentDate.month && pickedDate.day > currentDate.day)) {
                              age--;
                            }

                            print(age); // Age in years


                            setState(() {
                              // controllerAge.text = age.toString(); // Set age to TextField value.
                              // authState.signUpRequest?.age = int.parse(controllerAge.text);
                              // print("age ha is ki ====> ${authState.signUpRequest?.age}");
                              dateOfBirth = pickedDate.toIso8601String();
                              print("value end: $dateOfBirth");
                              controllerAge.text = DateFormat('dd/MM/yyyy').format(pickedDate); // Set age to TextField value.
                              calculatedAge = age;
                              authState.signUpRequest?.age = age;
                              print("age ha is ki ====> ${authState.signUpRequest?.age}");

                            });
                          } else {
                            print("Date is not selected");
                          }
                        },
                        onChanged: (String? value) {},
                        onSaved: (String? value) {
                          print("age ha is ki ====> ${value}");

                          authState.signUpRequest?.age = calculatedAge;
                          authState.signUpRequest?.dateOfBirth = dateOfBirth;
                        },
                      ),
                     Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 8.0,
                          ),
                          Text(
                            "Country",
                            style: const TextStyle().copyWith(fontSize: 12.0),
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          DropdownSearch<int>(
                            popupProps: PopupProps.menu(
                              showSearchBox: true,
                              constraints: BoxConstraints( // Adjust the width as needed
                                maxHeight: 280, // Adjust the height as needed
                              ),
                              itemBuilder: (context, item, isSelected) {
                                return ListTile(
                                  title: Text(AppConstants.getCountryValue.firstWhere(
                                          (country) => country['id'] == item,
                                      orElse: () => {'id': 0, 'type': 'Unknown'}
                                  )['type']),
                                );
                              },
                              searchFieldProps: TextFieldProps(
                                decoration: InputDecoration(
                                  hintText: 'Search a Country',
                                  contentPadding: EdgeInsets.fromLTRB(12, 12, 8, 0),
                                ),
                              ),
                            ),
                            // mode: Mode.MENU,
                            // showSelectedItems: true,
                            // showSearchBox: true,
                            // dropdownSearchDecoration: InputDecoration(
                            //   labelText: "Select Country",
                            //   contentPadding: EdgeInsets.fromLTRB(12, 12, 8, 0),
                            //   border: OutlineInputBorder(),
                            // ),
                            items: AppConstants.getCountryValue.map((country) {
                              // Explicitly cast or convert each 'id' to an integer
                              return int.tryParse(country['id'].toString()) ?? 0;
                            }).toList(),
                            itemAsString: (int? id) {
                              var country = AppConstants.getCountryValue.firstWhere(
                                      (country) => country['id'] == id,
                                  orElse: () => {'id': 0, 'type': 'Unknown'}
                              );
                              return country['type'];
                            },
                            onChanged: (int? value) {
                              if (value != null) {
                                setState(() {
                                  selectedCountryID = value;
                                  authState.signUpRequest?.countryId = selectedCountryID;
                                  handleCountrySelection(value);
                                });
                              }
                            },
                            selectedItem: selectedCountryID,
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [

                          Text(
                            "State",
                            style: const TextStyle().copyWith(fontSize: 12.0),
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          DropdownSearch<int>(
                            popupProps: PopupProps.menu(
                              showSearchBox: true,
                              constraints: BoxConstraints( // Adjust the width as needed
                                maxHeight: 280, // Adjust the height as needed
                              ),
                              itemBuilder: (context, item, isSelected) {
                                return ListTile(
                                  title: Text(AppConstants.getStateValue.firstWhere(
                                          (state) => state['id'] == item,
                                      orElse: () => {'id': 0, 'type': 'Unknown'}
                                  )['type']),
                                );
                              },
                              searchFieldProps: TextFieldProps(
                                decoration: InputDecoration(
                                  hintText: 'Search a State',
                                  contentPadding: EdgeInsets.fromLTRB(12, 12, 8, 0),
                                ),
                              ),
                            ),
                            items: AppConstants.getStateValue.map((state) {
                              // Explicitly cast or convert each 'id' to an integer
                              return int.tryParse(state['id'].toString()) ?? 0;
                            }).toList(),
                            itemAsString: (int? id) {
                              var state = AppConstants.getStateValue.firstWhere(
                                      (state) => state['id'] == id,
                                  orElse: () => {'id': 0, 'type': 'Unknown'}
                              );
                              return state['type'];
                            },
                            onChanged: (int? value) {
                              if (value != null) {
                                setState(() {
                                  selectedStateID = value;
                                  authState.signUpRequest?.stateId = selectedStateID;
                                  GetCountryCode().GetCityList(value);
                                });
                              }
                            },
                            selectedItem: selectedStateID,
                            dropdownBuilder: (context, selectedItem) {
                              return Text(AppConstants.getStateValue.firstWhere(
                                      (state) => state['id'] == selectedItem,
                                  orElse: () => {'id': 0, 'type': 'Select State'}
                              )['type']);
                            },
                          )

                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 8.0,
                          ),
                          Text(
                            "City",
                            style: const TextStyle().copyWith(fontSize: 12.0),
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          DropdownSearch<int>(
                            popupProps: PopupProps.menu(
                              showSearchBox: true,
                              constraints: BoxConstraints( // Adjust the width as needed
                                maxHeight: 280, // Adjust the height as needed
                              ),
                              itemBuilder: (context, item, isSelected) {
                                return ListTile(
                                  title: Text(AppConstants.getCityValue.firstWhere(
                                          (city) => city['id'] == item,
                                      orElse: () => {'id': 0, 'type': 'Unknown'}
                                  )['type']),
                                );
                              },
                              searchFieldProps: TextFieldProps(
                                decoration: InputDecoration(
                                  hintText: 'Search a City',
                                  contentPadding: EdgeInsets.fromLTRB(12, 12, 8, 0),
                                ),
                              ),
                            ),
                            items: AppConstants.getCityValue.map((city) {
                              // Explicitly cast or convert each 'id' to an integer
                              return int.tryParse(city['id'].toString()) ?? 0;
                            }).toList(),
                            itemAsString: (int? id) {
                              var city = AppConstants.getCityValue.firstWhere(
                                      (city) => city['id'] == id,
                                  orElse: () => {'id': 0, 'type': 'Unknown'}
                              );
                              return city['type'];
                            },
                            onChanged: (int? value) {
                              if (value != null) {
                                setState(() {
                                  selectedCityID = value;
                                  authState.signUpRequest?.cityId = selectedCityID;
                                });
                              }
                            },
                            selectedItem: selectedCityID,
                            dropdownBuilder: (context, selectedItem) {
                              return Text(AppConstants.getCityValue.firstWhere(
                                      (city) => city['id'] == selectedItem,
                                  orElse: () => {'id': 0, 'type': 'Select City'}
                              )['type']);
                            },
                          )
                        ],
                      ),

                      const SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        Strings.phoneNumber,
                        style: const TextStyle().copyWith(fontSize: 12.0),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),

                      Container(
                        decoration: BoxDecoration(
                            border: Border.all( color: Colors.grey.shade400),
                            borderRadius: BorderRadius.circular(8)
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 1),
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 14),
                                child: DropdownButton<String>(
                                  value: selectedCode,
                                  // isExpanded: true,
                                  underline: SizedBox(),
                                  icon: SizedBox(),
                                  items: AppConstants.getCountryCodeValue.map((item) {
                                    selectedCodeID = item['id'];
                                    authState.signUpRequest?.countryCodeID = selectedCodeID;
                                    return DropdownMenuItem<String>(
                                      value: item['code'],
                                      child: Text(item['code']),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      selectedCode = newValue;
                                      authState.signUpRequest?.countryCodeID = selectedCodeID;
                                      print("value cvhange ID: ${authState.signUpRequest?.countryCodeID}");
                                      // Handle the case where the list might be empty
                                    });
                                  },
                                ),
                              ),
                            ),
                            // CountryCodePicker(
                            //   onChanged: (countryCode) {
                            //     setState(() {
                            //
                            //     });
                            //   },
                            //   initialSelection: 'PK',
                            //
                            //   showCountryOnly: false,
                            //   showFlag: false,
                            //   showOnlyCountryWhenClosed: false,
                            //   favorite: const ['+92', 'PK'],
                            // ),
                            Expanded(
                              child: TextFormField(
                                readOnly: false,
                                keyboardType: TextInputType.phone,
                                inputFormatters: [LengthLimitingTextInputFormatter(11)],
                                onChanged: (String? value) {},

                                decoration: InputDecoration(
                                  hintText: Strings.phoneNumber,
                                  border: InputBorder.none,
                                ),
                                onSaved: (String? value){
                                  authState.signUpRequest?.contactNumber = value;
                                },
                              ),
                            ),
                            // AppTextField(
                            //   readOnly: false,
                            //   validator: (value) => !Helpers.isPhoneNumberValid(value.toString())
                            //       ? Strings.phoneNumber
                            //       : null,
                            //   inputType: TextInputType.phone,
                            //   inputFormatters: [LengthLimitingTextInputFormatter(11)],
                            //   hintText: Strings.phoneNumber,
                            //   onChanged: (String? value) {},
                            //   onSaved: (String? value) {
                            //     authState.signUpRequest?.contactNumber = value;
                            //   },
                            // ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        "Address",
                        style: const TextStyle().copyWith(fontSize: 12.0),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      AppTextField(
                        readOnly: false,
                        // validator: (value) =>
                        //     value.isEmpty ? Strings.middleName : null,
                        hintText: "Address",
                        onChanged: (String? value) {},
                        onSaved: (String? value) {
                          authState.signUpRequest?.address = value;
                        },
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        "Postal Code",
                        style: const TextStyle().copyWith(fontSize: 12.0),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      AppTextField(
                        readOnly: false,
                        // validator: (value) =>
                        //     value.isEmpty ? Strings.middleName : null,
                        hintText: "Postal Code",
                        onChanged: (String? value) {},
                        onSaved: (String? value) {
                          authState.signUpRequest?.postal_code = value;
                        },
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        Strings.email,
                        style: const TextStyle().copyWith(fontSize: 12.0),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      AppTextField(
                        readOnly: false,
                        validator: (value) => EmailValidator.validate(value)
                            ? null
                            : Strings.enterYourEmail,
                        hintText: Strings.enterYourEmail,
                        onChanged: (String? value) {},
                        onSaved: (String? value) {
                          authState.signUpRequest?.email = value;
                        },
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        Strings.password,
                        style: const TextStyle().copyWith(fontSize: 12.0),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      AppTextField(
                        readOnly: false,
                        validator: (value) {
                          if (value.isEmpty) {
                            return Strings.passwordBlankError;
                          } else if (value.length < 8) {
                            return 'Password must be at least 8 characters';
                          }else if (!RegExp(r'^(?=.*[A-Z])').hasMatch(value)) {
                            // Check if the password contains at least one uppercase letter
                            return 'Password must contain at least one uppercase letter';
                          }
                          password = value;
                          return null;
                        },
                        hintText: Strings.enterYourPassword,
                        obscureText: authState.obscureText,
                        inputType: TextInputType.visiblePassword,
                        suffixIcon: IconButton(
                          onPressed: () {
                            ref
                                .read(authStateProvider.notifier)
                                .togglePasswordText();
                          },
                          icon: Icon(
                            authState.obscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        ),
                        onChanged: (String? value) {},
                        onSaved: (String? value) {},
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        Strings.confirmPassword,
                        style: const TextStyle().copyWith(fontSize: 12.0),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      AppTextField(
                        readOnly: false,
                        validator: (value) {
                          if (value.isEmpty) {
                            return Strings.confirmPassword;
                          } else if (value != password) {
                            return 'Passwords do not match';
                          }
                          // Set the confirmPassword value for validation
                          confirmPassword = value;
                          return null;
                        },
                        hintText: Strings.confirmPassword,
                        obscureText: authState.confirmPasswordObscureTex,
                        inputType: TextInputType.visiblePassword,
                        suffixIcon: IconButton(
                          onPressed: () {
                            ref
                                .read(authStateProvider.notifier)
                                .toggleConfirmPasswordText();
                          },
                          icon: Icon(
                            authState.confirmPasswordObscureTex
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        ),
                        onChanged: (String? value) {},
                        onSaved: (String? value) {
                          authState.signUpRequest?.password = value;
                        },
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      AppConstants.getPrivacyPolicyAgree != null
                          ?  Container(
                            child: Row(
                              children: [
                                Transform.scale(
                                  scale: 1.2,
                                  child: Checkbox(
                                    value: isChecked,

                                    activeColor: Palette.primaryColor,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        isChecked = value!;
                                      });
                                    },
                                  ),
                                ),
                                GestureDetector(
                        onTap: (){
                                launchUrl(Uri.parse(AppConstants.getPrivacyPolicyAgree['link']));
                        },
                        child: Container(
                                decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.black, width: 1))
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 4),
                                  child: Text(
                                    AppConstants.getPrivacyPolicyAgree['condition'] ?? "",
                                    style: const TextStyle().copyWith(fontSize: 15.0, fontWeight: FontWeight.bold),
                                  ),
                                ),
                        ),
                      ),
                              ],
                            ),
                          ):SizedBox()
                    ],
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              context.pushReplacement(routeName: RouteNames.loginRoute);
            },
            child: Container(
              padding:
              const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(text: Strings.alreadyMember),
                            TextSpan(
                              text: ' ${Strings.login}',
                              style:
                              const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      context.hideKeyboard();
                      if (_validateAndSave() && isChecked) {
                        ref
                            .read(authStateProvider.notifier)
                            .register(authState.signUpRequest!.toJson());
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 16),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(4),
                        color: Palette.primaryColor,
                      ),
                      child: Text(
                        Strings.register,
                        style: const TextStyle().copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool _validateAndSave() {
    final FormState? form = _formKey.currentState;
    if (form!.validate()) {
      _formKey.currentState?.save();
      return true;
    } else {
      return false;
    }
  }
}
