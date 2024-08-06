import 'dart:convert';

import 'package:apni_property_app/features/presentation/screens/home/withdraw_screen.dart';
import 'package:apni_property_app/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../configs/res/style/style.dart';
import '../../../../configs/shared_prefrence_keys.dart';
import '../../../../helper/dialogs/loading_dialog.dart';
import '../../../core/providers/providers.dart';
import '../../../core/providers/state_providers.dart';
import '../../components/base_screen.dart';
import '../add_balance_screen.dart';


class BalanceDetailsScreen extends ConsumerStatefulWidget {
  bool? isEnableWallet;
  BalanceDetailsScreen({super.key, this.isEnableWallet});

  @override
  ConsumerState<BalanceDetailsScreen> createState() => _BalanceDetailsScreenFormState();
}

class _BalanceDetailsScreenFormState extends ConsumerState<BalanceDetailsScreen> {

  @override
  Widget build(BuildContext context) {
    //
    // MyPurchaseClass().myPurchaseService(token, userID);


    // ref.listen<HomeState>(homeStateProvider, (previous, next) async {
    //   if (previous!.response.status != next.response.status) {
    //     if (next.response.status == Status.SUCCESS) {
    //       context.showSnackBar(message: next.response.data.message ?? "Data Fetched");
    //     } else if (next.response.status == Status.ERROR) {
    //       context.showSnackBar(message: next.response.message ?? 'Something went wrong');
    //     }
    //   }
    // });

    return

      Scaffold(
          appBar: widget.isEnableWallet == true? AppBar(
            backgroundColor: Palette.primaryColor,
            leading: IconButton(
              onPressed: (){
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back, color: Colors.white,),
            ),
            centerTitle: true,
            title: Text("My Wallet", style: TextStyle(color: Colors.white),),
          ):null,
         body:

          // isLoadingData? Center(child: CircularProgressIndicator(),): Container(
          //    padding: const EdgeInsets.only(bottom: 16.0, left: 8.0, right: 8.0),
          //    child: AppConstants.getMyPurchaseData.isNotEmpty
          //        ? ListView.builder(
          //      itemCount: AppConstants.getMyPurchaseData.length ?? 0,
          //      itemBuilder: (context, index) {
          //        return GestureDetector(
          //          onTap: () {
          //            context.pushName(
          //                routeName: RouteNames.productDetail,
          //                screenArgs: ProductDetailScreenArguments(data: AppConstants.getMyPurchaseData[index]));
          //          },
          //          child: Card(
          //            elevation: 8.0,
          //            child: Padding(
          //              padding: const EdgeInsets.all(16.0),
          //              child: Row(
          //                children: [
          //                  ClipRRect(
          //                    borderRadius: BorderRadius.circular(16.0),
          //                    child: Image.asset(
          //                      AppImages.appLogo,
          //                      fit: BoxFit.cover,
          //                      width: 100,
          //                    ),
          //                  ),
          //                  const SizedBox(
          //                    height: 8.0,
          //                  ),
          //                  Expanded(
          //                    child: Column(
          //                      crossAxisAlignment: CrossAxisAlignment.start,
          //                      mainAxisSize: MainAxisSize.min,
          //                      children: [
          //                        Text(
          //                          '${AppConstants.getMyPurchaseData[index]['location']}',
          //                          // '${productsResponse.data?[index].location.toString()}',
          //                          style: const TextStyle(
          //                              fontSize: 16.0, fontWeight: FontWeight.bold, color: Palette.primaryColor),
          //                        ),
          //                        const SizedBox(
          //                          height: 8.0,
          //                        ),
          //                        Text('Price: ${AppConstants.getMyPurchaseData[index]['price']} ${AppConstants.getMyPurchaseData[index]['currency']}'),
          //                        // Text('Price: ${productsResponse.data?[index].price.toString()} PKR'),
          //                        const SizedBox(
          //                          height: 8.0,
          //                        ),
          //                        Text(
          //                            'Size in Sq Feet: ${AppConstants.getMyPurchaseData[index]['sizeinSqFeet'] != null? AppConstants.getMyPurchaseData[index]['sizeinSqFeet']: ""}'),
          //                        // 'Size in Sq Feet: ${productsResponse.data?[index].sizeinSqFeet.toString()}'),
          //                        const SizedBox(
          //                          height: 8.0,
          //                        ),
          //                        Text(' ${AppConstants.getMyPurchaseData[index]['rental_Status']}'),
          //                        // Text(' ${productsResponse.data?[index].rentalStatus.toString()}'),
          //                      ],
          //                    ),
          //                  ),
          //                ],
          //              ),
          //            ),
          //          ),
          //        );
          //      },
          //    )
          //        : const Center(child: Text('No data found')),
          //  ),


          Consumer(builder: (context, ref, _) {
            final state = ref.watch(myWalletFutureProvider);
            var state1 = ref.watch(homeStateProvider);
            if (state.isLoading) {
              Future(() => LoadingDialog.showLoadingIndicator(context));
              return Container();
            } else if (state.hasValue) {
              LoadingDialog.hideDialog(context);
              // AppConstants.getPurchaseDetailsData = state1.response.data;
              return SingleChildScrollView(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Wallet Name:',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                            '${AppConstants.getMyWalletData.isNotEmpty ? AppConstants.getMyWalletData[0]['walletName'] : "dfff"}'
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const AddBalanceScreen()),
                            );
                          },
                          child: Container(
                            color: Colors.blue,
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 2),
                              child: Text("Deposit", style: TextStyle(color: Colors.white),),
                            ),
                          ),
                        ),
                        SizedBox(width: 10,),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const Withdraw()),
                            );
                          },
                          child: Container(
                            color: Colors.blue,
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 2),
                              child: Text("Withdraw", style: TextStyle(color: Colors.white),),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text(
                          'Code: ',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text('${AppConstants.getMyWalletData.isNotEmpty ? AppConstants.getMyWalletData[0]['code'] : "dfff"}',style: TextStyle( fontSize: 16) )
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('Currency',
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                            Text('Total Balance',
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                            ],
                        ),
                        Divider(
                          thickness: 2,
                        ),
                        ListView.builder(
                            itemCount: AppConstants.getMyWalletData.length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index){
                              var code = AppConstants.getMyWalletData[index]['code'];
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text('${AppConstants.getMyWalletData.isNotEmpty ? AppConstants.getMyWalletData[0]['currency'] : "dfff"}'),
                                  Text('${AppConstants.getMyWalletData.isNotEmpty ? AppConstants.getMyWalletData[0]['walletBalance'] : "dfff"}'),
                                   ],
                              ),
                              Divider(
                                thickness: 2,
                              ),
                            ],
                          );
                        }),
                        // SizedBox(height: 20),
                        // Card(
                        //   elevation: 4,
                        //   child: Column(
                        //     children: [
                        //       SizedBox(
                        //         height: 20,
                        //       ),
                        //       Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                        //         children: [
                        //           Text('Date',style: TextStyle(fontWeight: FontWeight.bold),),
                        //           Text('Product Name',style: TextStyle(fontWeight: FontWeight.bold),),
                        //         ],
                        //       ),
                        //       Divider(
                        //         thickness: 2,
                        //
                        //       ),
                        //       ListView.builder(
                        //           itemCount: AppConstants.getMyWalletData.length,
                        //           shrinkWrap: true,
                        //           physics: NeverScrollableScrollPhysics(),
                        //           itemBuilder: (context, index){
                        //         return Column(
                        //           children: [
                        //             Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                        //               children: [
                        //                 Text('${AppConstants.getMyWalletData[index]['walletBalance']}',),
                        //                 Text('Direct Addition in Wallet',),
                        //               ],
                        //             ),
                        //             Divider(
                        //               thickness: 2,
                        //
                        //             ),
                        //           ],
                        //         );
                        //
                        //       })
                        //     ],
                        //   ),
                        // ),


                        SizedBox(height: 20),
                        Card(
                          elevation: 4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text('Purchase Area',style: TextStyle(fontWeight: FontWeight.bold),),
                                  Text('Price',style: TextStyle(fontWeight: FontWeight.bold),),
                                  Text('No.Sales',style: TextStyle(fontWeight: FontWeight.bold),),
                                ],
                              ),
                              Divider(
                                thickness: 2,

                              ),
                              ListView.builder(
                                  itemCount: AppConstants.getMyWalletData.length,
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index){
                                    return Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                           Text('${AppConstants.getMyWalletData[index]['purchasedArea'] ?? "dfff"}',),
                                            Text('${AppConstants.getMyWalletData[index]['purchasedAreaPrice'] ?? "dfff"}',),
                                            Text('${AppConstants.getMyWalletData[index]['noOfSales'] ?? "dfff"}',),
                                          ],
                                        ),
                                        Divider(
                                          thickness: 2,

                                        ),
                                      ],
                                    );

                                  })
                            ],
                          ),
                        ),
                        // SizedBox(height: 20),
                        // Card(
                        //   elevation: 4,
                        //   child: Column(
                        //     children: [
                        //       SizedBox(
                        //         height: 20,
                        //       ),
                        //       Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                        //         children: [
                        //           Text('DR',style: TextStyle(fontWeight: FontWeight.bold),),
                        //           Text('CR',style: TextStyle(fontWeight: FontWeight.bold),),
                        //           Text('Currency',style: TextStyle(fontWeight: FontWeight.bold),),
                        //         ],
                        //       ),
                        //       Divider(
                        //         thickness: 2,
                        //       ),
                        //       Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                        //         children: [
                        //           Text('33',),
                        //           Text('00',),
                        //           Text('Rupee',),
                        //         ],
                        //       ),
                        //       SizedBox(
                        //         height: 20,
                        //       )
                        //
                        //
                        //
                        //     ],
                        //   ),
                        // ),

                      ],
                    ),
                    // ListView.builder(
                    //   itemCount: AppConstants.getMyWalletData.length,
                    //     shrinkWrap: true,
                    //     physics: NeverScrollableScrollPhysics(),
                    //     itemBuilder: (context,index){
                    //   return ;
                    // }),
                  ],
                ),
              );
            } else if (state.hasError) {
              LoadingDialog.hideDialog(context);
              return Container();
            } else {
              LoadingDialog.hideDialog(context);
              return Container();
            }
          })
      );
  }



}
