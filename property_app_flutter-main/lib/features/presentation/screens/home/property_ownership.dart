import 'package:apni_property_app/configs/res/resource/src/images.dart';
import 'package:apni_property_app/configs/res/style/style.dart';
import 'package:apni_property_app/configs/routes/routes_name.dart';
import 'package:apni_property_app/features/core/models/response/product/products_list_response.dart';
import 'package:apni_property_app/features/core/providers/state_providers.dart';
import 'package:apni_property_app/features/core/states/home_state/home_state.dart';
import 'package:apni_property_app/features/presentation/components/base_screen.dart';
import 'package:apni_property_app/features/presentation/screens/detail/product_detail_screen.dart';
import 'package:apni_property_app/features/presentation/screens/home/nav_drawer.dart';
import 'package:apni_property_app/helper/dialogs/loading_dialog.dart';
import 'package:apni_property_app/helper/extenstions.dart';
import 'package:apni_property_app/helper/navigation_extentions.dart';
import 'package:apni_property_app/networking/api_response/api_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class property extends ConsumerWidget {
  const property({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<HomeState>(homeStateProvider, (previous, next) async {
      if (previous!.response.status != next.response.status) {
        if (next.response.status == Status.SUCCESS) {
          context.showSnackBar(message: next.response.data.message ?? "Data Fetched");
        } else if (next.response.status == Status.ERROR) {
          context.showSnackBar(message: next.response.message ?? 'Something went wrong');
        }
      }
    });

    return ScreenBase(
        screenTitle: const Text("Property Ownership"),
        screenBody: Consumer(builder: (context, ref, _) {
          var state = ref.watch(homeStateProvider);
          if (state.response.status == Status.LOADING) {
            Future(() => LoadingDialog.showLoadingIndicator(context));
            return Container();
          } else if (state.response.status == Status.SUCCESS) {
            LoadingDialog.hideDialog(context);
            ProductListResponse productsResponse = state.response.data;
            return Container(
              padding: const EdgeInsets.only(bottom: 16.0, left: 8.0, right: 8.0),
              child: productsResponse.data!.isNotEmpty
                  ? ListView.builder(
                      itemCount: productsResponse.data?.length ?? 0,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            context.pushName(
                                routeName: RouteNames.productDetail,
                                screenArgs: ProductDetailScreenArguments(data: productsResponse.data![index]));
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
                                          '${productsResponse.data?[index].location.toString()}',
                                          style: const TextStyle(
                                              fontSize: 16.0, fontWeight: FontWeight.bold, color: Palette.primaryColor),
                                        ),
                                        const SizedBox(
                                          height: 8.0,
                                        ),
                                        Text('Price: ${productsResponse.data?[index].price.toString()} PKR'),
                                        const SizedBox(
                                          height: 8.0,
                                        ),
                                        Text(
                                            'Size in Sq Feet: ${productsResponse.data?[index].sizeinSqFeet.toString()}'),
                                        const SizedBox(
                                          height: 8.0,
                                        ),
                                        Text(' ${productsResponse.data?[index].rentalStatus.toString()}'),
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
