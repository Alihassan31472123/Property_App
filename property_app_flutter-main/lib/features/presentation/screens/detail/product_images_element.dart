import 'package:apni_property_app/configs/res/resource/src/images.dart';
import 'package:apni_property_app/features/core/models/response/product/products_list_response.dart';
import 'package:apni_property_app/features/core/providers/state_providers.dart';
import 'package:apni_property_app/features/presentation/components/loading_shimmer_element.dart';
import 'package:apni_property_app/networking/api_endpoint.dart';
import 'package:apni_property_app/networking/api_response/api_response.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductImagesElement extends ConsumerStatefulWidget {
  final ProductData data;

  const ProductImagesElement({super.key, required this.data});

  @override
  ConsumerState<ProductImagesElement> createState() =>
      _ProductImagesElementState();
}
class _ProductImagesElementState extends ConsumerState<ProductImagesElement> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var productState = ref.watch(detailStateProvider(widget.data));
    return Consumer(builder: (context, ref, _) {
      if (productState.productDetailsResponse!.status == Status.LOADING) {
        return const Padding(
          padding: EdgeInsets.all(16.0),
          child: LoadingShimmerElement(),
        );
      } else if (productState.productDetailsResponse?.status ==
          Status.SUCCESS) {
        if (productState.productImagesResponse!.data != null) {
          return CarouselSlider(
              options: CarouselOptions(
                  height: 220.0, autoPlay: true, enlargeCenterPage: true),
              items:
                  productState.productImagesResponse!.data!.data!.map((data) {
                return Builder(
                  builder: (BuildContext context) {
                    print("ffsfsfssdfsdds: ${productState.productImagesResponse!.data!.foldername}");
                    return SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16.0),
                          child: Image.network(
                            '${ApiEndpoint.baseUrl}/${productState.productImagesResponse!.data!.foldername}/${data.docName}',
                            errorBuilder: (context, error, stackTrace) {
                              print(error);
                              return Image.asset(
                                AppImages.noPicPlaceHolder,
                                fit: BoxFit.cover,
                              ); //do something
                            },
                            fit: BoxFit.fill,
                          ),
                        ));
                  },
                );
              }).toList());
        } else {
          return const Padding(
            padding: EdgeInsets.all(16.0),
            child: LoadingShimmerElement(),
          );
        }
      } else {
        return Center(
          child: Text(productState.productImagesResponse?.message ??
              productState.productImagesResponse?.data?.message ??
              "Something went wrong"),
        );
      }
    });
  }
}