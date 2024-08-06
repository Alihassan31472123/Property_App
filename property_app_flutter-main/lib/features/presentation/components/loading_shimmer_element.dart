import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';

class LoadingShimmerElement extends ConsumerWidget {
  const LoadingShimmerElement({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      period: const Duration(seconds: 2),
      child: Container(
        width: double.infinity,
        height: 200,
        decoration: BoxDecoration(
            color: Colors.grey.shade400,
            borderRadius: const BorderRadius.all(
              Radius.circular(16.0),
            )),
      ),
    );
  }
}
