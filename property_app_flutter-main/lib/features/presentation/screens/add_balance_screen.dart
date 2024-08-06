import 'dart:convert'; // Import the dart:convert library
import 'dart:io';

import 'package:apni_property_app/features/core/repositery/getCountryCode_repository.dart';
import 'package:apni_property_app/utils/app_dialogs.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:dropdown_search/dropdown_search.dart';
import '../../../configs/shared_prefrence_keys.dart';
import '../../../models/currency_model.dart';
import '../../../networking/api_response/api_response.dart';
import '../../../utils/constants.dart';
import '../../core/providers/providers.dart';
import '../../core/providers/state_providers.dart';

class AddBalanceScreen extends ConsumerStatefulWidget {
  const AddBalanceScreen({super.key});

  @override
  ConsumerState<AddBalanceScreen> createState() => _BankInfoScreenState();
}

class _BankInfoScreenState extends ConsumerState<AddBalanceScreen> {
  String userEmail = "user@example.com";
  final descriptionController = TextEditingController();
  final accountIDController = TextEditingController();
  double amount = 0.0;
  int idAccount = 0;
  final amountController = TextEditingController();
  final codeController = TextEditingController();
  PlatformFile? selectedFile;
  String? selectedCountry = "Pakistan";
  int selectedCountryID = 1;
  late UserDataModel selectedCurrency;
  double balance = 0.0;
  List<UserDataModel> currencies = [];

  // Function to open the file picker
  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.image);

    if (result != null) {
      setState(() {
        selectedFile = result.files.first;
        print("selected file: ${selectedFile!.name}");
      });
    }
  }

  // Function to clear the selected file
  void clearFile() {
    setState(() {
      selectedFile = null;
    });
  }

  // Function to handle the submit button
  void handleSubmit() async {
    // Ensure a file is selected
    if (selectedFile == null) {
      AppDialogs().showResponseDialog(context, "Error", "Please pick an image.");

      return;
    }
    // Encode the file content to Base64
    File file = File(selectedFile!.path!);
    List<int> fileBytes = file.readAsBytesSync();
    String base64File = base64Encode(fileBytes);

    // Now, you can use base64File for your logic, for example, send it to a server.
    // Implement your submission logic here, including sending base64File.
    // You can also use other form data like 'selectedCurrency', 'description', 'amount', and 'code'.
    // For example, you can send them to your API.
    final state = ref.read(sharedUtilityProvider);
    final email = state.getString(SharedPreferenceKeys.email) ?? "";
    final uid = state.getString(SharedPreferenceKeys.userId) ?? "";
    // Include your API token for authorization
    String apiToken = state.getString(SharedPreferenceKeys.token) ?? "";
    // Make a withdrawal request to your API with the selected currency, amount, and description
    String depositUrl = "http://110.39.4.69:50051/api/Product/AddPaymentInAccount";
    print("ffffffffff: $amount === $uid ==== ${codeController.text} === ${selectedCurrency.id} ==== ${descriptionController.text} === ${selectedFile?.name} ==== ${int.parse(accountIDController.text)}");
    Map<String, dynamic> requestBody = {
      "userId": uid,
      "code": codeController.text,
      "email": email,
      "currencyId": selectedCurrency.id,
      "amount": amount,
      "detail": descriptionController.text,
      "image": base64File,
      "imageName": selectedFile?.name ?? "",
      "accountNumberId": idAccount
    };
    final response = await http.post(
      Uri.parse(depositUrl),
      headers: {
        "Authorization": "Bearer $apiToken",
        "Content-Type": "application/json",
      },
      body: jsonEncode(requestBody),
    );

    if (response.statusCode == 200) {
      print("data response of add balance: ${response.body}");
      reset();

      if (mounted) {
        AppDialogs().showResponseDialog(
          context,
          "Success",
          "Your payment will be added within 48 hours.",
        );
      }
    } else {
      if (mounted) {
        print("data response of add balance: ${response.statusCode}");
        AppDialogs().showResponseDialog(
          context,
          "Failed",
          "Something went wrong. Please try again.",
        );
      }
      print("Withdrawal failed");
    }
    // try {
    //
    // } catch (e) {
    //   if (mounted) {
    //     AppDialogs().showResponseDialog(
    //       context,
    //       "Error",
    //       "An error occurred while processing your request.",
    //     );
    //   }
    //   print('Error: $e');
    // }
  }

  GetAccountNo(cuurencyID,countryID) async{
    // var headers = {
    //   'Authorization': 'Bearer $token'
    // };
    try{
      var dio = Dio();
      var response = await dio.request(
        'http://110.39.4.69:50051/api/Setting/GetAccountbyCurrencyId?CurrencyId=$cuurencyID&countryId=$countryID',
        options: Options(
          method: 'GET',
          // headers: headers,
        ),
      );

      if (response.statusCode == 200) {
        print("acha bhai country code: ${json.encode(response.data)}");
        if(response.data['data'].isNotEmpty){
          setState(() {
            idAccount = response.data['data'][0]['id'];
            accountIDController.text = response.data['data'][0]['accountNumber'];
          });
        }else{
          setState(() {
            accountIDController.text = "";
          });
        }
      }
      else {
        print(response.statusMessage);
      }
    }catch(e){
      print("error in account no: $e");
    }
  }

  void reset() {
    setState(() {
      amount = 0.0;
      selectedFile = null;
    });
    descriptionController.clear();
    amountController.clear();
    codeController.clear();
  }

  @override
  void initState() {
    currencies = AppConstants.currencies;
    if (currencies.isNotEmpty) {
      selectedCurrency = currencies[0];
      return;
    }

    selectedCurrency = const UserDataModel(id: 0, name: "USD");

    super.initState();
  }

  @override
  void dispose() {
    codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    userEmail = ref.read(sharedUtilityProvider).getString(SharedPreferenceKeys.email) ?? "";
    ref.watch(myCountryList);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Balance"),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20.0),
                const Text("Email:"),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  initialValue: userEmail,
                  readOnly: true,
                ),
                const SizedBox(height: 20.0),
                const Text("Code:"),
                Consumer(builder: (context, ref, _) {
                  var state = ref.watch(profileStateProvider);
                  final userData = state.response.data;
                  if (state.response.status == Status.SUCCESS) {
                    codeController.text = userData!.data!.code ?? "";
                  }
                  return TextFormField(
                    controller: codeController,
                    decoration: const InputDecoration(
                      hintText: "Enter your code",
                    ),
                    readOnly: true,
                  );
                }),
               const SizedBox(height: 20.0),
                const Text("Select Currency:"),
                const SizedBox(height: 20.0),
                 DropdownSearch<UserDataModel>(
                   popupProps: PopupProps.menu(
                     showSearchBox: true,
                     itemBuilder: (context, item, isSelected) {
                       return ListTile(
                         title: Text(item.name),
                       );
                     },
                     searchFieldProps: TextFieldProps(
                       decoration: InputDecoration(
                         hintText: 'Search a currency',
                         contentPadding: EdgeInsets.fromLTRB(12, 12, 8, 0),
                       ),
                     ),
                   ),
                   items: currencies,
                   itemAsString: (UserDataModel? item) => item?.name ?? "",
                   onChanged: (UserDataModel? newValue) {
                     if (newValue != null) {
                       setState(() {
                         selectedCurrency = newValue;
                         GetAccountNo(selectedCurrency.id, selectedCountryID);
                         print("select currecny: $selectedCurrency");
                         // Fetch balance for the selected currency when it changes
                       });
                     }
                   },
                   dropdownBuilder: (context, selectedItem) {
                     return Container(
                       padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                       decoration: BoxDecoration(
                       
                       ),
                       child: Text(selectedItem?.name ?? "Select a currency"),
                     );
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
  
const SizedBox(height: 20.0),
const Text("Amount:"),

                TextField(
                  controller: amountController,
                  decoration: InputDecoration(
                    hintText: "Add Balance"
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (String value) {
                    double enteredAmount = double.tryParse(value) ?? 0.0;
                    // if (enteredAmount <= 1000.0) {
                      setState(() {
                        amount = enteredAmount;
                      });
                    // }
                  },
                ),
                const SizedBox(height: 20.0),
                const Text("IBAN NO:"),
                TextField(controller: accountIDController, readOnly: true,),
                const SizedBox(height: 20.0),
                const Text("Description:"),
                TextField(controller: descriptionController),
                const SizedBox(height: 20.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: pickFile,
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.indigoAccent.shade100,
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          child: const Text("Choose File"),
                        ),
                      ],
                    ),
                    if (selectedFile != null)
                      Column(
                        children: [
                          Text("Selected File: ${selectedFile!.name}"),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: clearFile,
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: Colors.red,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                                child: const Text("Remove File"),
                              ),
                            ],
                          ),
                        ],
                      ),
                  ],
                ),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: handleSubmit,
                      child: const Text("Submit"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
