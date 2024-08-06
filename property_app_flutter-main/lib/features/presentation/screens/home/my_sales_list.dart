import 'package:apni_property_app/features/core/providers/state_providers.dart';
import 'package:apni_property_app/features/presentation/components/base_screen.dart';
import 'package:apni_property_app/helper/dialogs/loading_dialog.dart';
import 'package:apni_property_app/helper/extenstions.dart';
import 'package:apni_property_app/networking/api_response/api_response.dart';
import 'package:apni_property_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/models/response/userprofile/Getsaleresponse.dart';
import '../../../core/states/home_state/sale_state.dart';





class SalePage extends ConsumerWidget {
  const SalePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ref.listen<SaleState>(saleStateProvider, (previous, next) async {
    //   if (previous!.response.status != next.response.status) {
    //     if (next.response.status == Status.SUCCESS) {
    //       context.showSnackBar(message: next.response.data!.message ?? 'Data found');
    //     } else if (next.response.status == Status.ERROR) {
    //       context.showSnackBar(message: next.response.message ?? 'Something went wrong');
    //     }
    //   }
    // });

    return ScreenBase(
      screenTitle: const Text("My Sales List"),
      screenBody: Consumer(builder: (context, ref, _) {
        var state = ref.watch(mySaleFutureProvider);
        if (state.isLoading == ConnectionState.waiting) {
          Future(() => LoadingDialog.showLoadingIndicator(context));
          return const SizedBox();
        } else if (state.hasValue) {
          LoadingDialog.hideDialog(context);
          if (AppConstants.getMySaleData.isNotEmpty) {
            return ListView.builder(
              itemCount: AppConstants.getMySaleData.length,
              itemBuilder: (context, index) {
                final item = AppConstants.getMySaleData[index];
                return  SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  // First Card with first set of columns
                  Card(
                    elevation: 4,
                    child: Container(
                      child: DataTable(

                        columns: [
                          DataColumn(label: Text('Sr #')),
                          DataColumn(label: Text('Sale Number')),
                          DataColumn(label: Text('Client Name')),
                        ],
                        rows: [
                          DataRow(
                            cells: [
                              DataCell(
                                Text('${item['porderID']}'),
                                // Center the contents of this cell
                                placeholder: false, // Set placeholder to false for center alignment
                              ),
                              DataCell(
                                Text('${item['saleID']}'),
                                // Center the contents of this cell
                                placeholder: false, // Set placeholder to false for center alignment
                              ),
                              DataCell(
                                Text('${item['clientName']}', style: TextStyle(fontSize: 12)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Second Card with second set of columns
                  Card(
                    elevation: 4,
                    child: Container(
                      child: DataTable(
                        columns: [
                          DataColumn(label: Text('Product Name')),
                          DataColumn(label: Text('Wallet Name')),
                        ],
                        rows: [
                          DataRow(
                            cells: [
                              DataCell(Text('${item['productName']}')),
                              DataCell(Text('${item['walletName']}')),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Third Card with third set of columns
                  Card(
                    elevation: 4,
                    child: Container(
                      child: DataTable(
                        columns: [
                          DataColumn(label: Text('Sale Area (sf)')),
                          DataColumn(label: Text('Price')),
                        ],
                        rows: [
                          DataRow(
                            cells: [
                              DataCell(Text('${item['saledArea']}')),
                              DataCell(Text('${item['totalPrice']}')),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    
              },
            );
          } else {
            return const Center(child: Text('Data not found'));
          }
        } else if (state.hasError) {
          return const Text('Error loading data');
        } else {
          return const SizedBox();
        }
      }),
    );
  }
}
