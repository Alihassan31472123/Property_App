import 'package:apni_property_app/configs/res/style/style.dart';
import 'package:apni_property_app/features/core/models/response/product/product_details.dart';
import 'package:apni_property_app/features/core/models/response/product/products_list_response.dart';
import 'package:apni_property_app/features/core/providers/state_providers.dart';
import 'package:apni_property_app/features/core/repositery/makeOrder_repository.dart';
import 'package:apni_property_app/features/core/states/detail_state/product_detail_state.dart';
import 'package:apni_property_app/features/presentation/components/base_screen.dart';
import 'package:apni_property_app/features/presentation/screens/detail/product_images_element.dart';
import 'package:apni_property_app/features/presentation/screens/detail/product_wallet_element.dart';
import 'package:apni_property_app/helper/dialogs/loading_dialog.dart';
import 'package:apni_property_app/helper/extenstions.dart';
import 'package:apni_property_app/networking/api_response/api_response.dart';
import 'package:apni_property_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../configs/shared_prefrence_keys.dart';
import '../../../core/providers/providers.dart';
class ProductDetailScreenArguments {
  final ProductData data;
  

  ProductDetailScreenArguments({required this.data, String? docName});
}

class ProductDetailScreen extends ConsumerWidget {

  
  
  final ProductData data;

  const ProductDetailScreen({super.key, required this.data});
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<ProductDetailState>(detailStateProvider(data), (previous, next) {
      if (previous!.productDetailsResponse!.status !=
          next.productDetailsResponse!.status) {
        if (next.productDetailsResponse?.status == Status.SUCCESS) {
          var isSuccessFull =
              next.productDetailsResponse?.data?.status == Status.SUCCESS.name;
          var noMessageException =
              isSuccessFull ? "Data fetched" : "Some thing went wrong";
          var message = next.productDetailsResponse?.data?.message ??
              next.productDetailsResponse?.message ??
              noMessageException;
          context.showSnackBar(message: message);
        } else {
          var message = next.productDetailsResponse?.data?.message ??
              next.productDetailsResponse?.message ??
              "Some thing went wrong";
          context.showSnackBar(message: message);
        }
      }
    });


    return ScreenBase(
      screenTitle: const Text("Detail Screen"),
      centerTitle: false,
      screenBody: Consumer(
        builder: (context, ref, _) {
          var productState = ref.watch(detailStateProvider(data));
          if (productState.productDetailsResponse?.status == Status.LOADING) {
            Future(() => LoadingDialog.showLoadingIndicator(context));

            return Container();
          } else if (productState.productDetailsResponse?.status ==
              Status.SUCCESS) {
            ProductDetails? productData =
                productState.productDetailsResponse!.data;
            double commissionDouble = double.parse(productState.calculateCommission);
            int commission = commissionDouble.round(); // Handle potential parsing errors
            String roundedCommission = commission.toString();

            double totalPriceDouble = double.parse(productState.totalPrice);
            int totalPriceV = totalPriceDouble.round();
            String roundedTotalPrice = totalPriceV.toString();
            LoadingDialog.hideDialog(context);
            return SingleChildScrollView(
              child: Container(
                padding:  const EdgeInsets.only(top: 16.0, bottom: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProductImagesElement(
                      data: data,
                    ), 
                    Container(
                      padding:  const EdgeInsets.all(16.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              productData!.data?.fileName.toString() ?? "",
                              style:  const TextStyle().copyWith(
                                  fontSize: 18.0, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 4.0,
                            ),
                            Text(
                              'Price: ${NumberFormat('#,##,##0').format(productData.data!.price)} ${productData.data!.currency.toString()} ',
                              style: const TextStyle().copyWith(
                                fontSize: 14.0,
                              ),
                            ),
                            Text(
                              'Original Price: ${NumberFormat('#,##,##0').format(productData.data!.originalPrice)} ${productData.data!.currency.toString()} ',
                              style: const TextStyle().copyWith(
                                fontSize: 14.0,
                              ),
                            ),
                            Text(
                              'Taxes: ${productData.data!.tax1.toString()}, ${productData.data!.tax2.toString()}, ${productData.data!.tax3.toString()}, ${productData.data!.tax4.toString()}, ${productData.data!.tax5.toString()}, ${productData.data!.tax6.toString()}',
                              style: const TextStyle().copyWith(
                                fontSize: 14.0,
                              ),
                            ),
                          ]),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: ProductWalletElement(
                          data: data, productData: productData),
                    ),


           
    //                   Padding(
    //   padding: const EdgeInsets.all(8.0),
    //   child: TextButton(
    //     onPressed: () {
    //       _showPreviewOrderDialog(context);
    //     },
    //     child: Container(
    //       padding: const EdgeInsets.symmetric(
    //         horizontal: 16.0,
    //         vertical: 16,
    //       ),
    //       decoration: BoxDecoration(
    //         shape: BoxShape.rectangle,
    //         borderRadius: BorderRadius.circular(4),
    //         color: Palette.primaryColor // Change the color to your desired color.
    //       ),
    //       child: Text(
    //         'Preview Order',
    //         style: const TextStyle().copyWith(color: Colors.white),
    //       ),
    //     ),
    //   ),
    // ), 
    
    
     ],
                ),
              ),
            );
          } else {
            LoadingDialog.hideDialog(context);
            return Center(
              child: Text(productState.productImagesResponse?.data?.message ??
                  productState.productImagesResponse?.message ??
                  "Something Went Wrong"),
            );
          }
        },
      ),
    );
  }
}
