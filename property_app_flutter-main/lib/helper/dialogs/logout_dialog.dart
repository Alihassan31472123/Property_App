import 'package:apni_property_app/configs/routes/routes_name.dart';
import 'package:apni_property_app/configs/shared_prefrence_keys.dart';
import 'package:apni_property_app/features/core/providers/providers.dart';
import 'package:apni_property_app/features/presentation/screens/get_started/get_started_screen.dart';
import 'package:apni_property_app/helper/navigation_extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogoutDialog extends ConsumerWidget {
  const LogoutDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      title: const Text('Logout Confirmation'),
      content: const Text('Are you sure you want to log out?'),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () async{
            // ref.read(sharedUtilityProvider).setString(SharedPreferenceKeys.token,'');
            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.remove(SharedPreferenceKeys.token);
            prefs.remove(SharedPreferenceKeys.userId);
            prefs.remove(SharedPreferenceKeys.email);
            prefs.remove(SharedPreferenceKeys.currency);
            Navigator.of(context).pop();
            context.pushAndModelRoute(
                routeName: RouteNames.getStartedRoute,
                nextPage: const GetStartedScreen());
          },
          child: const Text(
            'Logout',
            style: TextStyle(
              color: Colors.red, // Customize the text color
            ),
          ),
        ),
      ],
    );
  }
}
