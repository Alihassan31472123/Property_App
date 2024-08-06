import 'dart:convert';
import 'dart:io';

import 'package:apni_property_app/configs/res/style/style.dart';
import 'package:apni_property_app/helper/extenstions.dart';
import 'package:apni_property_app/utils/constants.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../../../configs/res/resource/src/images.dart';
import '../../../../helper/dialogs/loading_dialog.dart';
import '../../../../models/currency_model.dart';
import '../../../../networking/api_endpoint.dart';
import '../../../../networking/api_response/api_response.dart';
import '../../../core/providers/state_providers.dart';
import '../../../core/repositery/getCountryCode_repository.dart';
import '../../../core/states/profile_state.dart';
import '../../components/base_screen.dart';

class AddClientProfileForm extends ConsumerStatefulWidget {
  bool? isEnable;
  AddClientProfileForm({super.key, this.isEnable});

  @override
  ConsumerState<AddClientProfileForm> createState() => _AddClientProfileFormState();
}

class _AddClientProfileFormState extends ConsumerState<AddClientProfileForm> {
  String? selectedState = "Punjab";
  String? selectedCountry = "Pakistan";
  String? selectedCity = "Lahore";
  int selectedStateID = 1;
  int selectedCountryID = 1;
  int selectedCityID = 1;
  PlatformFile? selectedFile;
  ImagePicker picker = ImagePicker();
  DateTime selectedDate = DateTime.now();
  File? imageProfile;
  // String? base64Image;
  // String? selectedCode = "+92";
  getImageFromCamera6(notify) async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    // final List<XFile>? pickedFile = await picker.pickMultiImage();
    if (pickedFile != null) {
      final imageBytes = await pickedFile.readAsBytes();
      final base64String = base64Encode(imageBytes);
      setState(() {
        notify = base64String;
        print("picked file: ${pickedFile.name} ${imageProfile!.path}");
        imageProfile = File(pickedFile.path);
        //_image.add(File());
        // _imagefileList.addAll(pickedFile);
        // _image.add(File(pickedFile.path));
      });
    } else {
      print('No image selected');
    }
  }

  getImageFromGallery6(notify) async {
    // // final List<XFile>? pickedFile = await picker.pickMultiImage();
    // final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    // if (pickedFile != null) {
    //   final imageBytes = await pickedFile.readAsBytes();
    //   final base64String = base64Encode(imageBytes);
    //   setState(() {
    //     // _imagefileList.addAll(pickedFile);
    //     notify = base64String;
    //     print("base 64: $notify");
    //     imageProfile = File(pickedFile.path);
    //     print("picked file: ${imageProfile!.path}");
    //   });
    // } else {
    //   print('No image selected');
    // }

  }

  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.image);

    if (result != null) {
      setState(() {
        selectedFile = result.files.first;
      });
    }
  }

  final String placeholderValue = "select";

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



    ref.listen<ProfileState>(profileStateProvider, (previous, next) async {
      if (previous!.response.status != next.response.status) {
        if (next.response.status == Status.SUCCESS) {
          context.showSnackBar(message: next.response.data?.message ?? "Data Fetched");
        } else if (next.response.status == Status.ERROR) {
          context.showSnackBar(message: next.response.message ?? 'Something went wrong');
        }
      }
    });

    return Scaffold(
      appBar: widget.isEnable == true? AppBar(
        backgroundColor: Palette.primaryColor,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.white,),
        ),
        centerTitle: true,
        title: Text("Profile", style: TextStyle(color: Colors.white),),
      ):null,
        body: Consumer(builder: (context, ref, _) {
          var state = ref.watch(profileStateProvider);
          var authState = ref.watch(authStateProvider);
          var stateCountry = ref.watch(myCountryCode);
          final authStateCountryCode1 = ref.watch(myStateCode(selectedCountryID));
          final authStateCountryCode2 = ref.watch(myCountryList);
          final authStateCountryCode3 = ref.watch(myCityList(selectedStateID));
          final notifier = ref.read(profileStateProvider.notifier);
          final userData = state.response.data;
          String? initialValue;
          if (notifier.countryCodeId == 0) {
            initialValue = placeholderValue;
          } else {
            initialValue = AppConstants.getCountryCodeValue.firstWhere(
                    (item) => item['id'] == notifier.countryCodeId,
                orElse: () => {'code': placeholderValue}
            )['code'];
          }
          // if(selectedFile != null)notifier.clientImage = selectedFile!.path!.split('/').last;
          if (state.response.status == Status.LOADING) {
            Future(() => LoadingDialog.showLoadingIndicator(context));
            return Container();
          } else if (state.response.status == Status.SUCCESS) {
            LoadingDialog.hideDialog(context);
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                 // Stack(
                 //   children: [
                  userData?.data?.profilePath != null ? Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.transparent,
                    ),
                    child: ClipOval(
                      child: Image.network(
                        // 'http://110.39.4.69:50051/APP_Client_Images/837fe015-cf09-49fb-b290-961fdcc317bc.png',
                        '${ApiEndpoint.baseUrl}/${userData?.data?.folderName}/${userData?.data?.profileName}',
                        errorBuilder: (context, error, stackTrace) {
                          print(error);
                          return Image.asset(
                            'images/profile.jpg',
                            fit: BoxFit.fill,
                          );
                        },
                        fit: BoxFit.cover,
                      ),
                    ),
                  ) : Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.transparent,
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        'images/profile.jpg',
                        fit: BoxFit.fill,
                      )
                    ),
                  ),

                  //     :Container(
                 //         height: 120,
                 //         width: 120,
                 //         decoration: const BoxDecoration(
                 //             shape: BoxShape.circle,
                 //             color: Colors.transparent
                 //         ),
                 //         child: Image.asset('images/profile.jpg')
                 //     ),
                 //     Positioned(
                 //         bottom: 0,
                 //         right: 0,
                 //         child: Container(
                 //       decoration: BoxDecoration(
                 //         shape: BoxShape.circle,
                 //         color: Colors.blue,
                 //       ),
                 //       child: IconButton(
                 //         onPressed: (){
                 //           showDialog(
                 //             context: context,
                 //             builder: (BuildContext context) {
                 //               // dialogContext = context;
                 //               return Dialog(
                 //                 child: Padding(
                 //                   padding: const EdgeInsets.symmetric(vertical: 20),
                 //                   child: Wrap(
                 //                     children: [
                 //                       Row(
                 //                         children: [
                 //
                 //                           Expanded(
                 //                             child: Column(
                 //                               children: [
                 //                                 IconButton(onPressed: (){}, icon: Icon(Icons.camera_alt, size: 28,)),
                 //                                 Text("Camera")
                 //                               ],
                 //                             ),
                 //                           ),
                 //
                 //                           Expanded(
                 //                             child: Column(
                 //                               children: [
                 //                                 IconButton(onPressed: (){}, icon: Icon(Icons.image_rounded, size: 28,)),
                 //                                 Text("Gallery")
                 //                               ],
                 //                             ),
                 //                           )
                 //                         ],
                 //                       ),
                 //                     ],
                 //                   ),
                 //                 ),
                 //               );
                 //             },
                 //           );
                 //         },
                 //         color: Colors.white,
                 //         icon: Icon(Icons.camera_alt),
                 //       ),
                 //     ))
                 //   ],
                 // ),
                  TextFormField(
                    readOnly: true,
                    decoration: const InputDecoration(
                      labelText: 'Code',
                    ),
                    initialValue: userData?.data?.code.toString(),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'First Name',
                    ),
                    controller: notifier.firstNameController,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Middle Name',
                    ),
                    controller: notifier.midNameController,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Last Name',
                    ),
                    controller: notifier.lastNameController,
                  ),
                  TextFormField(
                    readOnly: true,
                    onTap: () async{
                       DateTime? picked = await showDatePicker(
                        context: context,
                        initialDate: selectedDate,
                        firstDate: DateTime(1900), // Change this to your desired start date
                        lastDate: DateTime.now(), // Change this to your desired end date
                      );

                      if (picked != null && picked != selectedDate)
                        setState(() {

                          selectedDate = picked;

                          // Display format (e.g., 10-12-1999)
                          String formattedDisplayDate = DateFormat("dd-MM-yyyy").format(selectedDate);
                          notifier.dateofBirthController.text = formattedDisplayDate;

                          // selectedDate = picked;
                          // notifier.dateofBirthController.text =
                          //     DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").format(selectedDate);
                          notifier.apiFormattedDate = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").format(selectedDate);
                        });
                    },
                    decoration: const InputDecoration(
                      labelText: 'Date of Birth',
                    ),
                    controller: notifier.dateofBirthController,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Occupation',
                    ),
                    controller: notifier.occupationController,
                  ),
                  TextFormField(
                    initialValue: userData?.data?.email.toString(),
                    readOnly: true,
                    decoration: const InputDecoration(
                      labelText: "Email",
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 1),
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 14),
                          child:

                          // DropdownButton<String>(
                          //   value: selectedCode,
                          //   // isExpanded: true,
                          //   underline: SizedBox(),
                          //   icon: SizedBox(),
                          //   items: AppConstants.getCountryCodeValue.map((item) {
                          //     notifier.countryCodeId = item['id'];
                          //     return DropdownMenuItem<String>(
                          //       value: item['code'],
                          //       child: Text(item['code']),
                          //     );
                          //   }).toList(),
                          //   onChanged: (String? newValue) {
                          //     setState(() {
                          //       selectedCode = newValue;
                          //       if(notifier.countryCodeId != 0){
                          //         notifier.countryCodeVal = newValue!;
                          //       }else{
                          //         notifier.countryCodeVal = "+92";
                          //       }
                          //       print("value cvhange ID: ${notifier.countryCodeId}");
                          //       // Handle the case where the list might be empty
                          //     });
                          //   },
                          // ),

                          DropdownButton<String>(
                            value: initialValue, // Use the determined initial value
                            underline: SizedBox(),
                            icon: SizedBox(),
                            items: [
                              DropdownMenuItem<String>(
                                value: placeholderValue,
                                child: Text(placeholderValue),
                              ),
                              ...AppConstants.getCountryCodeValue.map((item) {
                                return DropdownMenuItem<String>(
                                  value: item['code'],
                                  child: Text(item['code']),
                                );
                              }).toList(),
                            ],
                            onChanged: (String? newValue) {
                              setState(() {
                                if (newValue != placeholderValue) {
                                  initialValue = newValue;
                                  notifier.countryCodeVal = newValue!;
                                  var selectedItem = AppConstants.getCountryCodeValue.firstWhere(
                                          (item) => item['code'] == newValue,
                                      orElse: () => null
                                  );
                                  notifier.countryCodeId = selectedItem != null ? selectedItem['id'] : 0;
                                } else {
                                  initialValue = placeholderValue;
                                  notifier.countryCodeVal = "+92";
                                  notifier.countryCodeId = 0;
                                }
                                print("value change ID: ${notifier.countryCodeId}");
                              });
                            },
                          ),

                        ),
                      ),
                      // CountryCodePicker(
                      //   onChanged: (countryCode) {
                      //     setState(() {
                      //       notifier.countryCodeVal = countryCode.dialCode!;
                      //       print("ffffsfsf: ${notifier.countryCodeVal}");// Store the selected country code
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
                          controller: notifier.contactController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: 'Contact Number',
                          ),
                        ),
                      ),
                    ],
                  ),
                  // DropdownButtonFormField<String>(
                  //   items: ["Male", "Female"]
                  //       .map((e) => DropdownMenuItem(
                  //             value: e,
                  //             child: Text(e),
                  //           ))
                  //       .toList(),
                  //   decoration: const InputDecoration(
                  //     labelText: 'Gender',
                  //   ),
                  //   onChanged: (String? value) {
                  //     notifier.gender = value!;
                  //   },
                  //   value: notifier.gender,
                  // ),
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

                  TextFormField(

                    controller: notifier.postalCodeController,
                    decoration:  InputDecoration(
                      labelText: "Postal Code",
                    ),
                  ),
                  TextFormField(

                    controller: notifier.addressController,
                    decoration:  InputDecoration(
                      labelText: "Address",
                    ),
                  ),
                  TextFormField(
                    controller: notifier.nidController,
                    decoration: const InputDecoration(
                      labelText: 'NID',
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text("Next of kin (Your closest relatives)")),
                  SizedBox(
                    height: 10,
                  ),
                  DottedBorder(
                    borderType: BorderType.RRect, // Choose the type of border shape
                    radius: Radius.circular(12), // Border radius, applicable if borderType is RRect
                    padding: EdgeInsets.all(6),
                    strokeWidth: 1,
                    dashPattern: [8, 4], // Dash pattern for the dotted border: [dashWidth, gapWidth]
                    color: Colors.black, // Color of the dotted border
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'NID',
                            ),
                            controller: notifier.nominee1NIDController,
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Name',
                            ),
                            controller: notifier.nominee1NameController,
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Phone',
                            ),
                            controller: notifier.nominee1PhoneController,
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Address',
                            ),
                            controller: notifier.nominee1AddressController,
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Relation',
                            ),
                            controller: notifier.nominee1RelationController,
                          ),
                        ],
                      ),
                    )
                  ),


                  // DropdownButtonFormField(
                  //   items: ["Male", "Female"]
                  //       .map((e) => DropdownMenuItem(
                  //             value: e,
                  //             child: Text(e),
                  //           ))
                  //       .toList(),
                  //   decoration: const InputDecoration(
                  //     labelText: 'nexttokin Gender',
                  //   ),
                  //   onChanged: (String? value) {
                  //     notifier.nominee1Gender = value!;
                  //   },
                  //   value: notifier.nominee1Gender,
                  // ),
                  SizedBox(
                    height: 16,
                  ),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text("Next of kin (Your closest relatives)")),
                  SizedBox(
                    height: 10,
                  ),
                  DottedBorder(
                      borderType: BorderType.RRect, // Choose the type of border shape
                      radius: Radius.circular(12), // Border radius, applicable if borderType is RRect
                      padding: EdgeInsets.all(6),
                      strokeWidth: 1,
                      dashPattern: [8, 4], // Dash pattern for the dotted border: [dashWidth, gapWidth]
                      color: Colors.black, // Color of the dotted border
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            TextFormField(
                              controller: notifier.nominee2NIDController,
                              decoration: const InputDecoration(
                                labelText: 'NID',
                              ),
                            ),
                            TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Name',
                              ),
                              controller: notifier.nominee2NameController,
                            ),
                            TextFormField(
                              controller: notifier.nominee2PhoneController,
                              decoration: const InputDecoration(
                                labelText: 'Phone',
                              ),
                            ),
                            TextFormField(
                              controller: notifier.nominee2AddressController,
                              decoration: const InputDecoration(
                                labelText: 'Address',
                              ),
                            ),
                            TextFormField(
                              controller: notifier.nominee2RelationController,
                              decoration: const InputDecoration(
                                labelText: ' Relation',
                              ),
                            ),
                          ],
                        ),
                      )
                  ),


                  // DropdownButtonFormField(
                  //   items: ["Male", "Female"]
                  //       .map((e) => DropdownMenuItem(
                  //             value: e,
                  //             child: Text(e),
                  //           ))
                  //       .toList(),
                  //   decoration: const InputDecoration(
                  //     labelText: 'nexttokin Gender',
                  //   ),
                  //   onChanged: (String? value) {
                  //     notifier.nominee2Gender = value!;
                  //   },
                  //   value: notifier.nominee2Gender,
                  // ),


                  // DropdownButtonFormField<UserDataModel>(
                  //   value: AppConstants.countries.firstWhere((element) => element.id == notifier.stateId),
                  //   onChanged: (UserDataModel? newValue) {
                  //     if (newValue != null) {
                  //       notifier.countryId = newValue.id;
                  //     }
                  //   },
                  //   items: AppConstants.countries.map<DropdownMenuItem<UserDataModel>>((UserDataModel value) {
                  //     return DropdownMenuItem(
                  //       value: value,
                  //       child: Text(value.name),
                  //     );
                  //   }).toList(),
                  //   decoration: const InputDecoration(
                  //     labelText: 'Country',
                  //   ),
                  // ),
                  // DropdownButtonFormField<UserDataModel>(
                  //   value: AppConstants.states.firstWhere((element) => element.id == notifier.stateId),
                  //   onChanged: (UserDataModel? newValue) {
                  //     if (newValue != null) {
                  //       notifier.stateId = newValue.id;
                  //     }
                  //   },
                  //   items: AppConstants.states.map<DropdownMenuItem<UserDataModel>>((UserDataModel value) {
                  //     return DropdownMenuItem(
                  //       value: value,
                  //       child: Text(value.name),
                  //     );
                  //   }).toList(),
                  //   decoration: const InputDecoration(
                  //     labelText: 'State',
                  //   ),
                  // ),
                  // DropdownButtonFormField<UserDataModel>(
                  //   value: AppConstants.cities.firstWhere((element) => element.id == notifier.stateId),
                  //   onChanged: (UserDataModel? newValue) {
                  //     if (newValue != null) {
                  //       notifier.cityId = newValue.id;
                  //     }
                  //   },
                  //   items: AppConstants.cities.map<DropdownMenuItem<UserDataModel>>((UserDataModel value) {
                  //     return DropdownMenuItem(
                  //       value: value,
                  //       child: Text(value.name),
                  //     );
                  //   }).toList(),
                  //   decoration: const InputDecoration(
                  //     labelText: 'City',
                  //   ),
                  // ),


                  // Rest of your form fields
                  // ...

                  const SizedBox(height: 16.0),
                  Text(
                    userData?.data?.currencyID ?? "",
                    style: const TextStyle(
                      color: Colors.green,
                      fontSize: 20.0,
                    ),
                  ),
                 

//                   InputDecorator(
//   decoration: InputDecoration(
//     labelText: userData?.data!.walletName.toString(),
//   ),
//   child: Text(
//     userData?.data!.walletName.toString() ?? '',
//     style: TextStyle(
//       fontSize: 16,
//       color: Colors.black,
//     ),
//   ),
// ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      ElevatedButton(
                        onPressed: (){
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              // dialogContext = context;
                              return Dialog(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 20),
                                  child: Wrap(
                                    children: [
                                      Row(
                                        children: [

                                          Expanded(
                                            child: GestureDetector(
                                              onTap: () async{
                                                Navigator.of(context).pop();
                                                final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
                                                if (pickedFile != null) {
                                                  File imageFile = File(pickedFile.path);
                                                  final imageBytes = imageFile.readAsBytesSync();
                                                  String base64String = base64Encode(imageBytes);
                                                  setState(() {
                                                    notifier.base64ImageCode = base64String;
                                                    print("base value: ${notifier.base64ImageCode}");
                                                    imageProfile = File(pickedFile.path);
                                                  });
                                                  // Now you can use _base64Image to pass it in your API
                                                }
                                              },
                                              child: Column(
                                                children: [
                                                  Icon(Icons.camera_alt, size: 28,),
                                                  Text("Camera")
                                                ],
                                              ),
                                            ),
                                          ),

                                          Expanded(
                                            child: GestureDetector(
                                              onTap: () async{
                                                Navigator.of(context).pop();
                                                final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
                                                if (pickedFile != null) {
                                                  File imageFile = File(pickedFile.path);
                                                  final imageBytes = imageFile.readAsBytesSync();
                                                  String base64String = base64Encode(imageBytes);
                                                  setState(() {
                                                    notifier.base64ImageCode = base64String;
                                                    print("base value: ${notifier.base64ImageCode}");
                                                    imageProfile = File(pickedFile.path);
                                                  });
                                                  // Now you can use _base64Image to pass it in your API
                                                }
                                              },
                                              child: Column(
                                                children: [
                                                  Icon(Icons.image_rounded, size: 28,),
                                                  Text("Gallery")
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.indigoAccent.shade100,
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: const Text("Choose Image"),
                      ),
                      imageProfile != null ? Text("Selected Image: ${imageProfile!.path.split('/').last}"):SizedBox(),
                    ],
                  ),

                  const SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          notifier.updateUserProfile(context).then((value) {
                            if (value) {
                              _showsSnackBar(context, "Profile Updated");
                            } else {
                              // _showsSnackBar(context, "Something went wrong");
                            }
                          });
                        },
                        child: const Text('Update profile'),
                      ),

                    ],
                  ),
                ],
              ),
            );
          } else if (state.response.status == Status.ERROR) {
            LoadingDialog.hideDialog(context);
            return Container();
          } else {
            LoadingDialog.hideDialog(context);
            return Container();
          }
        }));
  }

  void _showsSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
