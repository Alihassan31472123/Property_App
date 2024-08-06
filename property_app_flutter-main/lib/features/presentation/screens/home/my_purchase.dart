import 'package:apni_property_app/configs/res/resource/src/images.dart';
import 'package:apni_property_app/configs/res/style/style.dart';
import 'package:apni_property_app/configs/routes/routes_name.dart';
import 'package:apni_property_app/features/core/models/response/product/products_list_response.dart';
// import 'package:apni_property_app/features/core/providers/providers.dart';
import 'package:apni_property_app/features/core/providers/state_providers.dart';
import 'package:apni_property_app/features/core/states/home_state/home_state.dart';
import 'package:apni_property_app/features/presentation/components/base_screen.dart';
import 'package:apni_property_app/features/presentation/screens/detail/product_detail_screen.dart';
import 'package:apni_property_app/features/presentation/screens/home/nav_drawer.dart';
import 'package:apni_property_app/helper/dialogs/loading_dialog.dart';
import 'package:apni_property_app/helper/extenstions.dart';
import 'package:apni_property_app/helper/navigation_extentions.dart';
import 'package:apni_property_app/networking/api_response/api_response.dart';
import 'package:apni_property_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../configs/shared_prefrence_keys.dart';
import '../../../core/providers/providers.dart' as provide;
import '../../../core/repositery/myPurchase_repo.dart';
import '../../../core/repositery/my_purchase_details.dart';
import '../detail/my_purchase_detail_screen.dart';

class Mypurchase extends ConsumerStatefulWidget {
  bool? isEnablePurchase;
  Mypurchase({super.key, this.isEnablePurchase});

  @override
  ConsumerState<Mypurchase> createState() => _MypurchaseFormState();
}

class _MypurchaseFormState extends ConsumerState<Mypurchase> {

  // List getMyPurchaseData = [];
  @override
  Widget build(BuildContext context) {

    // String? token = ref.read(provide.sharedUtilityProvider).getString(SharedPreferenceKeys.token);
    // String? userID = ref.read(provide.sharedUtilityProvider).getString(SharedPreferenceKeys.userId);
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
          appBar: widget.isEnablePurchase == true? AppBar(
            backgroundColor: Palette.primaryColor,
            leading: IconButton(
              onPressed: (){
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back, color: Colors.white,),
            ),
            centerTitle: true,
            title: Text("Assets", style: TextStyle(color: Colors.white),),
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
          final state = ref.watch(myPurchaseFutureProvider);
          var state1 = ref.watch(homeStateProvider);
          if (state.isLoading) {
            Future(() => LoadingDialog.showLoadingIndicator(context));
            return Container();
          } else if (state.hasValue) {
            LoadingDialog.hideDialog(context);
            // AppConstants.getPurchaseDetailsData = state1.response.data;
            ProductListResponse productsResponse = state1.response.data;
            return Container(
              padding: const EdgeInsets.only(bottom: 16.0, left: 8.0, right: 8.0),
              child: AppConstants.getMyPurchaseData.isNotEmpty
                  ? ListView.builder(
                itemCount: AppConstants.getMyPurchaseData.length,
                itemBuilder: (context, index) {
                  final state2 = ref.watch(myPurchaseDetailsProvider(AppConstants.getMyPurchaseData[index].porderID!));
                  String formattedRemainBalance2 = NumberFormat('#,##,##0').format(AppConstants.getMyPurchaseData[index].price);
                  return GestureDetector(
                    onTap: () {

                      // final token = ref.read(provide.sharedUtilityProvider).getString(SharedPreferenceKeys.token);
                      // final userID = ref.read(provide.sharedUtilityProvider).getString(SharedPreferenceKeys.userId);
                      //
                      // MyPurchaseDetailClass().myPurchaseDetailService(token, AppConstants.getMyPurchaseData[index]['porderID']);

                      print("fffsfffsdfsfsdfsdfsd: ${productsResponse.data!}");
                      Navigator.of(context).pushNamed(
                        RouteNames.myPurchaseDetail,
                        arguments: MyPurchaseDetailScreenArguments(data: productsResponse.data!.first, data1: AppConstants.getMyPurchaseData[index]),
                      );

                      // Navigator.of(context).pushNamed(
                      //   RouteNames.myPurchaseDetail,
                      //   arguments: MyPurchaseDetailScreenArguments(data: AppConstants.getMyPurchaseData[index]),
                      // );
                    },
                    child: Card(
                      elevation: 8.0,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16.0),
                              child: Image.asset(
                                AppImages.appLogoUpdate,
                                fit: BoxFit.cover,
                                width: 100,
                              ),
                            ),
                            const SizedBox(
                              height: 8.0,
                              width: 10,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    '${AppConstants.getMyPurchaseData[index].location}',
                                    // '${productsResponse.data?[index].location.toString()}',
                                    style: const TextStyle(
                                        fontSize: 16.0, fontWeight: FontWeight.bold, color: Palette.primaryColor),
                                  ),
                                  const SizedBox(
                                    height: 8.0,
                                  ),
                                  Text('Price: $formattedRemainBalance2 ${AppConstants.getMyPurchaseData[index].currency}'),
                                  // Text('Price: ${productsResponse.data?[index].price.toString()} PKR'),
                                  const SizedBox(
                                    height: 8.0,
                                  ),
                                  Text(
                                      'Size in Sq Feet: ${AppConstants.getMyPurchaseData[index].sizeinSqFeet != null? AppConstants.getMyPurchaseData[index].sizeinSqFeet: 0}'),
                                  // 'Size in Sq Feet: ${productsResponse.data?[index].sizeinSqFeet.toString()}'),
                                  const SizedBox(
                                    height: 8.0,
                                  ),
                                  Container(
                                    height: 25,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      color: Palette.primaryColor,
                                      borderRadius: BorderRadius.circular(10.0),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 1,
                                          blurRadius: 1,
                                          offset: const Offset(1, 1),
                                        ),
                                      ],
                                    ),
                                    child: Center(child: Text('${AppConstants.getMyPurchaseData[index].rentalStatus}',style: TextStyle(color: Colors.white),)),
                                  ),
                                  // Text(' ${productsResponse.data?[index].rentalStatus.toString()}'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              )
                  : const Center(child: Text('No data found')),
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
