import 'package:apni_property_app/configs/res/resource/src/images.dart';
import 'package:apni_property_app/configs/res/style/style.dart';
import 'package:apni_property_app/configs/routes/routes_name.dart';
import 'package:apni_property_app/features/core/models/response/product/products_list_response.dart';
import 'package:apni_property_app/features/core/providers/state_providers.dart';
import 'package:apni_property_app/features/core/states/home_state/home_state.dart';
import 'package:apni_property_app/features/presentation/components/app_text_field.dart';
import 'package:apni_property_app/features/presentation/components/base_screen.dart';
import 'package:apni_property_app/features/presentation/screens/detail/product_detail_screen.dart';
import 'package:apni_property_app/features/presentation/screens/home/nav_drawer.dart';
import 'package:apni_property_app/helper/dialogs/loading_dialog.dart';
import 'package:apni_property_app/helper/extenstions.dart';
import 'package:apni_property_app/helper/navigation_extentions.dart';
import 'package:apni_property_app/networking/api_response/api_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

import '../notification_screen.dart';


class HomePage extends ConsumerStatefulWidget {
  HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {

  List<ProductData> filterList = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    ref.listen<HomeState>(homeStateProvider, (previous, next) async {
      if (previous!.response.status != next.response.status) {
        if (next.response.status == Status.SUCCESS) {
          context.showSnackBar(message: next.response.data.message ?? "Data Fetched");
        } else if (next.response.status == Status.ERROR) {
          context.showSnackBar(message: next.response.message ?? 'Something went wrong');
        }
      }
    });



    return Scaffold(
       body: Consumer(builder: (context, ref, _) {
          var state = ref.watch(homeStateProvider);
          if (state.response.status == Status.LOADING) {
            Future(() => LoadingDialog.showLoadingIndicator(context));
            return Container();
          } else if (state.response.status == Status.SUCCESS) {
            LoadingDialog.hideDialog(context);
            ProductListResponse productsResponse = state.response.data;
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.black, width: 1)
                    ),
                    child: TextFormField(
                      readOnly: false,
                      controller: _searchController,
                      keyboardType: TextInputType.text,
                      // inputFormatters: [LengthLimitingTextInputFormatter(11)],
                      onChanged: (String? value) {
                        List<ProductData> results = [];
                        if (value!.isEmpty) {
                          // If no search text, display all products
                          results = productsResponse.data!;
                        } else {
                          results = productsResponse.data!
                              .where((product) =>
                              product.location!.toLowerCase().contains(value.toLowerCase()))
                              .toList();
                        }

                        // Update the state to display filtered products
                        setState(() {
                          filterList = results;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: "Search",
                        border: InputBorder.none,
                      ),

                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(bottom: 16.0, left: 8.0, right: 8.0),
                    child: filterList.isNotEmpty
                        ? ListView.builder(
                            itemCount: filterList.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                               onTap: () {
  var currentItem = filterList[index];
  if (currentItem.purchaseStatus.toString().toLowerCase() == "disabled") {
    // Show a toast message or perform any other action
    Fluttertoast.showToast(msg: "This property is not available for purchase.");
  } else if (currentItem.purchaseStatus.toString().toLowerCase() == "enabled") {
    // Navigate to the detail screen
    context.pushName(
      routeName: RouteNames.productDetail,
      screenArgs: ProductDetailScreenArguments(data: currentItem),
    );
  }
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
                                                '${filterList[index].location.toString()}',
                                                style: const TextStyle(
                                                    fontSize: 16.0, fontWeight: FontWeight.bold, color: Palette.primaryColor),
                                              ),
                                              const SizedBox(
                                                height: 8.0,
                                              ),
                                              Text('Price: ${NumberFormat('#,##,##0').format(filterList[index].price)} PKR'),
                                              const SizedBox(
                                                height: 8.0,
                                              ),
                                              Text(
                                                  'Size in Sq Feet: ${filterList[index].sizeinSqFeet.toString()}'),
                                              const SizedBox(
                                                height: 8.0,
                                              ),
                                              Row(
                                                children: [
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
                                                    child: Center(child: Text('${filterList[index].rentalStatus.toString()}',style: TextStyle(color: Colors.white),)),
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),

                                                ],
                                              ),
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
                        : ListView.builder(
                      itemCount: productsResponse.data!.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            var currentItem = productsResponse.data![index];
                            if (currentItem.purchaseStatus.toString().toLowerCase() == "disabled") {
                              // Show a toast message or perform any other action
                              Fluttertoast.showToast(msg: "This property is not available for purchase.");
                            } else if (currentItem.purchaseStatus.toString().toLowerCase() == "enabled") {
                              // Navigate to the detail screen
                              context.pushName(
                                routeName: RouteNames.productDetail,
                                screenArgs: ProductDetailScreenArguments(data: currentItem),
                              );
                            }
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
                                          '${productsResponse.data![index].location.toString()}',
                                          style: const TextStyle(
                                              fontSize: 16.0, fontWeight: FontWeight.bold, color: Palette.primaryColor),
                                        ),
                                        const SizedBox(
                                          height: 8.0,
                                        ),
                                        Text('Price: ${NumberFormat('#,##,##0').format(productsResponse.data![index].price)} PKR'),
                                        const SizedBox(
                                          height: 8.0,
                                        ),
                                        Text(
                                            'Size in Sq Feet: ${productsResponse.data![index].sizeinSqFeet.toString()}'),
                                        const SizedBox(
                                          height: 8.0,
                                        ),
                                        Row(
                                          children: [
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
                                              child: Center(child: Text('${productsResponse.data![index].rentalStatus.toString()}',style: TextStyle(color: Colors.white),)),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),

                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
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
}
