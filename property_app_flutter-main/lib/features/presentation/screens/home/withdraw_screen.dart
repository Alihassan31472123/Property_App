import 'dart:convert';
import 'package:apni_property_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:dropdown_search/dropdown_search.dart';
import '../../../../configs/shared_prefrence_keys.dart';
import '../../../../models/currency_model.dart';
import '../../../../networking/api_response/api_response.dart';
import '../../../../utils/app_dialogs.dart';
import '../../../core/providers/providers.dart';
import '../../../core/providers/state_providers.dart';
import 'package:intl/intl.dart';

class Withdraw extends ConsumerStatefulWidget {
  const Withdraw({super.key});
  @override
  ConsumerState<Withdraw> createState() => _WithdrawState();
}

class _WithdrawState extends ConsumerState<Withdraw> {
  final _formKey = GlobalKey<FormState>();
  String userEmail = "user@example.com";
  final descriptionController = TextEditingController();
  final bankNameController = TextEditingController();
  final bankAddressController = TextEditingController();
  final bankIBANController = TextEditingController();
  final amountController = TextEditingController();
  final codeController = TextEditingController();
  late UserDataModel selectedCurrency;
  bool isAmountValid = true;
  double balance = 0.0;
  List<UserDataModel> currencies = [];

  // Function to fetch the balance for the selected currency
  Future<void> fetchCurrencyBalance() async {
    final state = ref.read(sharedUtilityProvider);
    final uid = state.getString(SharedPreferenceKeys.userId) ?? "";
    String apiToken = state.getString(SharedPreferenceKeys.token) ?? "";
    final currencyId = selectedCurrency.id;
    print("currencyID: $currencyId");
    String url = "http://110.39.4.69:50051/api/Product/getClientBalancebyCurrency?ClientId=$uid&CurrencyId=$currencyId";

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          "Authorization": "Bearer $apiToken",
          "Content-Type": "application/json",
        },
      );
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final dataList = data['data'] as List;
        setState(() {
          balance = dataList.isEmpty ? 0.0 : dataList[0]['balance'];
        });
      } else {
        throw Exception('Failed to load balance');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  // Function to handle withdrawal request
  Future<void> withdraw() async {
    final state = ref.read(sharedUtilityProvider);
    final email = state.getString(SharedPreferenceKeys.email) ?? "";
    final uid = state.getString(SharedPreferenceKeys.userId) ?? "";
    // Include your API token for authorization
    String apiToken = state.getString(SharedPreferenceKeys.token) ?? "";
    // Make a withdrawal request to your API with the selected currency, amount, and description
    String withdrawalUrl = "http://110.39.4.69:50051/api/Product/RequestForWithdraw";
    // Include the necessary data in the request body

    Map<String, dynamic> requestBody = {
      "userId": uid,
      "code": codeController.text,
      "email": email,
      "currencyId": selectedCurrency == "USD"
          ? 0
          : selectedCurrency == "EUR"
              ? 1
              : 2,
      "amount": amountController.text,
      "detail": descriptionController.text,
      "bankName": bankNameController.text,
      "bankaddress": bankAddressController.text,
      "bankIBAN": bankIBANController.text
    };
    try {
      final response = await http.post(
        Uri.parse(withdrawalUrl),
        headers: {
          "Authorization": "Bearer $apiToken",
          "Content-Type": "application/json",
        },
        body: jsonEncode(requestBody),
      );

      if (response.statusCode == 200) {
        print("respinse value: ${response.body}");
        AppDialogs().showResponseDialog(
          context,
          "Success",
          "Withdrawal successful",
        );
        descriptionController.clear();
        bankNameController.clear();
        bankIBANController.clear();
        bankAddressController.clear();
        amountController.clear();
        // showSnackBar("Withdrawal successful");
        resetData();
      } else {
        showSnackBar("Withdrawal failed");
      }
    } catch (e) {
      showSnackBar("Withdrawal failed");
    }
  }

  void showSnackBar(String message) {
    final snackBar = SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 3),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
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

  void resetData() {
    descriptionController.clear();
    amountController.clear();
    codeController.clear();
  }

  @override
  void dispose() {
    descriptionController.dispose();
    amountController.dispose();
    codeController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    userEmail = ref.read(sharedUtilityProvider).getString(SharedPreferenceKeys.email) ?? "";
    return Scaffold(
      appBar: AppBar(
        title: const Text("Withdraw Balance"),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
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
                    onChanged: (String value) {
                      userEmail = value;
                    },
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
                      readOnly: true,
                      decoration: const InputDecoration(
                        hintText: "Enter your code",
                      ),
                    );
                  }),
                 const SizedBox(height: 20.0),
     SizedBox(height: 20.0),
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
        fetchCurrencyBalance();
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



                   SizedBox(height: 20.0),
                  Text(
                    "Balance: ${NumberFormat('#,##,##0').format(balance)}",
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                  ),

                  const SizedBox(height: 20.0),
                  const Divider(color: Colors.black, height: 0),
                  const SizedBox(height: 20.0),
                  const Text("Amount:"),
              TextFormField(
                controller: amountController,
                keyboardType: TextInputType.number,
                // enabled: isAmountValid, // Use the state variable to enable/disable the TextField
                onChanged: (value) {
                  final amount = double.tryParse(value);
                  if (amount != null && amount > balance) {
                    Fluttertoast.showToast(msg: "Insufficient balance");
                    setState(() {
                      isAmountValid = false; // Disable the TextField
                    });
                  } else {
                    if (!isAmountValid) {
                      setState(() {
                        isAmountValid = true; // Re-enable the TextField if the amount is valid
                      });
                    }
                  }
                },
              ),
                  const SizedBox(height: 20.0),
                  const Text("Bank Name"),

                  TextField(
                    controller: bankNameController,
                  ),
                  const SizedBox(height: 20.0),
                  const Text("Bank Address"),

                  TextField(
                    controller: bankAddressController,
                  ),
                  const SizedBox(height: 20.0),
                  const Text("Bank IBAN"),

                  TextField(
                    controller: bankIBANController,
                  ),
                  // Display the balance
                  const SizedBox(height: 20.0),
                  const Text("Details"),
                  
                  TextField(
                    controller: descriptionController,
                  ),

                  const SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          final amount = double.tryParse(amountController.text);
                         if(amount!>balance){
                           Fluttertoast.showToast(msg: "Insufficient balance");
                         }else{
                           if (!_formKey.currentState!.validate()) return;
                           _formKey.currentState!.save();
                           withdraw(); // Call the withdraw function
                         }
                        },
                        child: const Text("Withdraw"),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
