import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:apni_property_app/configs/res/resource/src/images.dart';
import 'package:apni_property_app/configs/res/style/style.dart';
import 'package:apni_property_app/configs/routes/routes_name.dart';
import 'package:apni_property_app/configs/res/resource/src/strings.dart';

class GetStartedScreen extends ConsumerStatefulWidget {
  const GetStartedScreen({super.key});

  @override
  ConsumerState<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends ConsumerState<GetStartedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(
              top: 16.0, left: 16.0, right: 16.0, bottom: 74.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(child: Image.asset(AppImages.appLogoUpdate, width: 280, height: 280,)),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 48.0,
                child: Material(
                  elevation: 4.0,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(RouteNames.signUpRoute);
                    },
                    child: Text(
                      Strings.getStarted,
                      style: const TextStyle(fontSize: 16.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 48.0,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(width: 1,color: Palette.primaryColor),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed(RouteNames.loginRoute);
                  },
                  child: Text(
                    Strings.haveAnAccount,
                    style: const TextStyle(fontSize: 16.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
