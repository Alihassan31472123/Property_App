import 'package:apni_property_app/configs/res/resource/src/images.dart';
import 'package:apni_property_app/configs/res/style/style.dart';
import 'package:apni_property_app/configs/shared_prefrence_keys.dart';
import 'package:apni_property_app/features/core/providers/providers.dart';
import 'package:apni_property_app/features/presentation/screens/get_started/get_started_screen.dart';
import 'package:apni_property_app/features/presentation/screens/home/home_screen.dart';
import 'package:apni_property_app/helper/navigation_extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../bottomNavigation.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String? token = ref.read(sharedUtilityProvider).getString(SharedPreferenceKeys.token);
    _navigateToMainScreen(context, token);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: Image.asset(AppImages.appLogoUpdate, width: 280, height: 280,)),
    );
  }
}

void _navigateToMainScreen(BuildContext context, String? token) async {
  await Future.delayed(const Duration(seconds: 2));
  var nextPage = (token != null && token.isNotEmpty) ? MyNavigationBarSection() : const GetStartedScreen();
  if (context.mounted) {
    context.pushAndModelRoute(nextPage: nextPage, routeName: '/');
  }
}
