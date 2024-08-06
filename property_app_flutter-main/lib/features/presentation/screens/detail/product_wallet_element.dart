import 'dart:convert';

import 'package:apni_property_app/features/core/models/response/product/product_details.dart';
import 'package:apni_property_app/features/core/models/response/product/products_list_response.dart';
import 'package:apni_property_app/features/core/providers/state_providers.dart';
import 'package:apni_property_app/features/core/states/detail_state/product_detail_state.dart';
import 'package:apni_property_app/features/presentation/components/app_text_field.dart';
import 'package:apni_property_app/features/presentation/components/text_field_grey_element.dart';
import 'package:apni_property_app/networking/api_response/api_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import '../../../../configs/res/style/style.dart';
import '../../../../configs/shared_prefrence_keys.dart';
import '../../../../utils/constants.dart';
import '../../../core/providers/providers.dart';
import '../../../core/repositery/makeOrder_repository.dart';

class ProductWalletElement extends ConsumerStatefulWidget {
  final ProductDetails productData;
  final ProductData data;
  ProductWalletElement(
      {super.key, required this.data, required this.productData});

  @override
  ConsumerState<ProductWalletElement> createState() => _ProductWalletElementState();
}

class _ProductWalletElementState extends ConsumerState<ProductWalletElement> {
  final double progress = 0.5;
  double selectedAreaInSquareFeet = 0.0; // Initialize this variable with the value entered by the user
  double totalAreaOutOff = 100.0; // Initialize this variable with the total value "out off" field
  double selectedArea = 0;
  var remainArea;
  double totalPrice = 0;
  double finaltotalPrice = 0;
  double commisionPrice = 0;
  double remainingBalance = 0;
  double previous_unit_price = 0;
  double profit_amount = 0;
  double balance = 0.0;
  double remainBalance = 0.0;
  // String roundedCommission = '';
  String roundedTotalPrice = '';
  double perMonthRent = 0.0;
  bool isEnableBalance = false;
  TextEditingController controllerRangeCustom = TextEditingController();

  double calculatePercentage() {
    if (totalAreaOutOff == 0.0) return 0.0;
    return selectedAreaInSquareFeet / totalAreaOutOff;
  }


  final TextInputFormatter _inputFormatter =
      FilteringTextInputFormatter.digitsOnly;


  @override
  Widget build(BuildContext context) {
    ref.listen<ProductDetailState>(
        detailStateProvider(widget.data), (previous, next) {});
    return Consumer(builder: (context, ref, _) {
      var productState = ref.watch(detailStateProvider(widget.data));
      var state2 = ref.watch(profileStateProvider);
      final stateProvide = state2.response.data;

      var progressState = ref.watch(progressStateProvider);
      final state = ref.watch(myWalletFutureProvider);
      fetchCurrencyBalance(widget.productData.data!.currencyID, ref);
      balance = ref.watch(balanceProvider);
      // String formattedBalance = NumberFormat('#,##0').format(balance);
      String formattedBalance = NumberFormat('#,##,##0').format(balance);
      remainBalance = ref.watch(remainBalanceProvider);
      String formattedRemainBalance = NumberFormat('#,##,##0').format(remainBalance);
      print("value of total area out off: ${widget.productData.data!.remSizeinSqFeet}: ${progressState}");
      selectedArea = progressState;
      print("ddfjkfjskjsd: $selectedArea");
      totalPrice = progressState * widget.productData.data!.unitPrice!;
      commisionPrice = ((widget.productData.data!.commissionRate!/100) * totalPrice);
      finaltotalPrice = totalPrice - commisionPrice;
      print("final total price: $finaltotalPrice");
      // remainingBalance = balance - finaltotalPrice;
      final changeValueOfUser = selectedArea * widget.productData.data!.unitPrice!.toInt();
      print(" remaining balance ha ye11: ${changeValueOfUser}");
      remainingBalance =(balance > 0)? remainBalance - changeValueOfUser: 0;
      String formattedRemainBalance2 = NumberFormat('#,##,##0').format(remainingBalance);
      print(" remaining balance ha ye: ${widget.productData.data!.unitPrice!.toInt()}");
      // remainingBalance =(balance > 0)? balance - finaltotalPrice: 0;
      remainArea = widget.productData.data!.remSizeinSqFeet;

      // double commissionDouble = double.parse(productState.calculateCommission);
      // int commission = commissionDouble.round(); // Handle potential parsing errors
      // roundedCommission = commission.toString();

      double totalPriceDouble = double.parse(productState.totalPrice);
      int totalPriceV = totalPriceDouble.round();
      roundedTotalPrice = totalPriceV.toString();
      String formattedTotalPrice = NumberFormat('#,##,##0').format(totalPriceV);

      if(widget.productData.data!.rentalStatus != "Non Rental"){
        perMonthRent = (widget.productData.data!.monthlyRent / widget.productData.data!.remSizeinSqFeet) * selectedArea;
      }



      if (productState.walletDetailResponse!.status == Status.LOADING) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (productState.walletDetailResponse!.status == Status.SUCCESS) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Progress:"),
            SizedBox(height: 8,),
            Column(
              children: [
                LinearProgressIndicator(
                  value: selectedArea / remainArea,
                  backgroundColor: Colors.red,
                  color: selectedArea <= remainArea ? Colors.green : Colors.red,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("${((selectedArea / remainArea)*100).toStringAsFixed(2)}%"),
                    Text("${(100)}%")
                  ],
                )
              ],
            ),
            SizedBox(height: 10,),
            Text(
              'Wallet Name',
              style: const TextStyle().copyWith(fontSize: 12.0),
            ),
            const SizedBox(
              height: 8.0,
            ),
            TextFieldElement(
              text: productState.walletDetailResponse!.data!.walletName
                  .toString(),
              addCurrency: false,
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text(
              'Balance',
              style: const TextStyle().copyWith(fontSize: 12.0),
            ),
            const SizedBox(
              height: 8.0,
            ),
            TextFieldElement(
              text: formattedBalance.toString(),
              addCurrency: true,
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text(
              "Remaining Balance",
              style: const TextStyle().copyWith(fontSize: 12.0),
            ),

            const SizedBox(
              height: 8.0,
            ),
            TextFieldElement(
              text: formattedRemainBalance2,
              addCurrency: true,
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text(
              'Selected Area in Square Feet',
              style:  TextStyle().copyWith(fontSize: 12.0),
            ),
            const SizedBox(
              height: 8.0,
            ),
            AppTextField(
              inputFormatters: <TextInputFormatter>[
                _inputFormatter,
                RangeTextInputFormatter(
                    minValue: 1,
                    maxValue: double.tryParse(
                        widget.productData.data!.sizeinSqFeet.toString()) ??
                        1000)
              ],
              hintText: 'Selected Area in Square Feet',
              readOnly: false,
              onChanged: (String? value) {
                double changedValue = double.tryParse(value ?? '0') ?? 0.0;
                print("change sq ft: $changedValue");
                final totalChangeValue = changedValue * widget.productData.data!.unitPrice!;

                if(totalChangeValue < remainingBalance){
                  setState((){
                    isEnableBalance = false;
                  });

                  if (changedValue < widget.productData.data!.sizeinSqFeet!) {
                    double calculateBalance = widget.productData.data!.price! -
                        widget.productData.data!.unitPrice! * changedValue;
                    print("value of total balance calcualte: $calculateBalance");
                    if (calculateBalance >= 0.0) {
                      ref
                          .read(detailStateProvider(widget.data).notifier)
                          .calculateValues(widget.productData, changedValue);
                      ref.read(progressStateProvider.notifier).updateProgress(changedValue);
                    }
                  }
                }else{
                  setState((){
                    isEnableBalance = true;
                  });
                  Fluttertoast.showToast(msg: "Insufficient Balance.");
                }
              },
              onSaved: (String? value) {},
            ),

            const SizedBox(
              height: 4.0,
            ),
            Row(
              children: [
                Expanded(
                  child: TextFieldElement(
                    text: widget.productData.data!.remSizeinSqFeet.toString() ==
                        'Out Of: 0'
                        ? 'Out Off: ${widget.productData.data!.sizeinSqFeet!.toStringAsFixed(0).toString()} ft\u00b2'
                        : 'Out Off: ${widget.productData.data!.remSizeinSqFeet!.toStringAsFixed(0).toString()} ft\u00b2',
                    addCurrency: false,
                  ),
                ),
                const SizedBox(
                  width: 4.0,
                ),
                Expanded(
                  child: TextFieldElement(
                    text:
                    'Total Area: ${widget.productData.data!.sizeinSqFeet!.toStringAsFixed(0).toString()} ft\u00b2',
                    addCurrency: false,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text(
              'Per Square Feet Price',
              style: const TextStyle().copyWith(fontSize: 12.0),
            ),
            const SizedBox(
              height: 8.0,
            ),
            TextFieldElement(
              text: widget.productData.data!.unitPrice!.toString(),
              addCurrency: false,
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text(
              'Commission (${widget.productData.data!.commissionRate.toString()}%)',
              style: const TextStyle().copyWith(fontSize: 12.0),
            ),
            const SizedBox(
              height: 8.0,
            ),
            TextFieldElement(
              text: productState.calculateCommission,
              addCurrency: false,
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text(
              'Total Price',
              style: const TextStyle().copyWith(fontSize: 12.0),
            ),

            const SizedBox(
              height: 8.0,
            ),
            TextFieldElement(
              text: formattedTotalPrice.toString(),
              addCurrency: false,
            ),
            const SizedBox(
              height: 8.0,
            ),


            Visibility(
                visible: widget.productData.data!.rentalStatus != "Non Rental",
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Per month price',
                      style: const TextStyle().copyWith(fontSize: 12.0),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),


                    TextFieldElement(
                      text: formattedTotalPrice != "0"? perMonthRent.toStringAsFixed(2).toString(): "0.0",
                      addCurrency: false,
                    ),


                  ],
                )),
            const Divider(
              thickness: 2,
            ),
            Row(
              children: [
                SizedBox(
                  width: 15,
                ),
                ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (BuildContext context) {
                        return  Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.0), // Top-left corner
                                topRight: Radius.circular(20.0),
                              )
                          ),
                          padding: EdgeInsets.all(20),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Preview Order",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 20),
                              Row(mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Code:  ${stateProvide!.data!.code}",style: TextStyle(fontWeight: FontWeight.bold),),
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Client Name: ${productState.walletDetailResponse!.data!.walletName} ",style: TextStyle(fontWeight: FontWeight.bold),),
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Selected area in Square Feet: ${selectedArea} ",style: TextStyle(fontWeight: FontWeight.bold),),
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Quantity in Square Feet: ${widget.productData.data!.sizeinSqFeet.toString()} ",style: TextStyle(fontWeight: FontWeight.bold),),
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Product Name:  ${widget.productData.data!.fileName.toString()}",style: TextStyle(fontWeight: FontWeight.bold),),
                                ],
                              ),
                              SizedBox(height: 5), // Note: Hidden element in HTML is not applicable in Flutter.
                              Row(mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Commission:  ${widget.productData.data!.commissionRate.toString()}",style: TextStyle(fontWeight: FontWeight.bold),),
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Price:  ${roundedTotalPrice}",style: TextStyle(fontWeight: FontWeight.bold),),
                                ],
                              ),
                              SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      // Handle Make Final Order button click.
                                      if(balance > 0 || remainingBalance > 0){
                                        String? token = ref.read(sharedUtilityProvider).getString(SharedPreferenceKeys.token);
                                        String? userID = ref.read(sharedUtilityProvider).getString(SharedPreferenceKeys.userId);
                                        print("user id: ${productState}");
                                        MakeOrderRepository().makeOrder(context, "${stateProvide.data!.code}", selectedArea, token, int.parse(userID.toString()), widget.productData.data!.typeID,
                                            widget.productData.data!.sizeinSqFeet,
                                            widget.productData.data!.tax1,
                                            widget.productData.data!.commissionRate,
                                            roundedTotalPrice,
                                            widget.productData.data!.currencyID,
                                            widget.productData.data!.countryId,
                                            widget.productData.data!.stateId,
                                            widget.productData.data!.cityId,
                                            widget.productData.data!.primaryID
                                        );
                                      }else{

                                        Fluttertoast.showToast(msg: "Insufficient Balance.");
                                      }
                                    },
                                    child: Text("Make Final Order"),
                                  ),
                                  SizedBox(width: 10),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text("Close"),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: Text('Preview Order'),
                ),
              ],
            ),
          ],
        );
      } else {
        return Center(
          child: Text(productState.walletDetailResponse!.message ??
              productState.walletDetailResponse!.data?.message ??
              "Something went wrong"),
        );
      }
    });
  }

  Future<void> fetchCurrencyBalance(currencyID, ref) async {
    String? apiToken = ref.read(sharedUtilityProvider).getString(SharedPreferenceKeys.token);
    String? uid = ref.read(sharedUtilityProvider).getString(SharedPreferenceKeys.userId);

    final currencyId = currencyID;
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
        print("ffffggggghhhh: $data");
        final dataList = data['data'] as List;
        double newBalance = dataList.isEmpty ? 0.0 : dataList[0]['balance'];
        double newRemainBalance = dataList.isEmpty ? 0.0 : dataList[0]['remBalance'];
        ref.read(balanceProvider.notifier).updateBalance(newBalance); // Update the balance using the provider
        ref.read(remainBalanceProvider.notifier).updateRemainBalance(newRemainBalance); // Update the balance using the provider
        print("value of balance in this property: $newBalance");
      } else {
        throw Exception('Failed to load balance');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}

class RangeTextInputFormatter extends TextInputFormatter {
  final double minValue;
  final double maxValue;

  RangeTextInputFormatter({required this.minValue, required this.maxValue});

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    if (newValue.text.isEmpty) {
      return newValue;
    }

    final double enteredValue = double.tryParse(newValue.text) ?? 0.0;

    if (enteredValue >= minValue && enteredValue <= maxValue) {
      return newValue;
    } else {
      // Value is outside the allowed range, so revert to the old value.
      return oldValue;
    }
  }

}

final balanceProvider = StateNotifierProvider<BalanceController, double>((ref) {
  return BalanceController();
});

class BalanceController extends StateNotifier<double> {
  BalanceController() : super(0.0);

  void updateBalance(double newBalance) {
    state = newBalance;
  }
}

final remainBalanceProvider = StateNotifierProvider<ReminBalanceController, double>((ref) {
  return ReminBalanceController();
});

class ReminBalanceController extends StateNotifier<double> {
  ReminBalanceController() : super(0.0);

  void updateRemainBalance(double newRemainBalance) {
    state = newRemainBalance;
  }
}


class ProgressStateNotifier extends StateNotifier<double> {
  ProgressStateNotifier() : super(0.0);

  void updateProgress(double newValue) {
    state = newValue;
  }
}
final progressStateProvider = StateNotifierProvider<ProgressStateNotifier, double>((ref) {
  return ProgressStateNotifier();
});
