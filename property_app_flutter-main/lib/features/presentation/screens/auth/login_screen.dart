import 'package:apni_property_app/configs/res/resource/src/images.dart';
import 'package:apni_property_app/configs/res/resource/src/strings.dart';
import 'package:apni_property_app/configs/res/style/style.dart';
import 'package:apni_property_app/configs/routes/routes_name.dart';
import 'package:apni_property_app/configs/shared_prefrence_keys.dart';
import 'package:apni_property_app/features/core/providers/providers.dart';
import 'package:apni_property_app/features/core/providers/state_providers.dart';
import 'package:apni_property_app/features/core/states/auth_state/auth_state.dart';
import 'package:apni_property_app/features/presentation/components/app_text_field.dart';
import 'package:apni_property_app/features/presentation/screens/home/home_screen.dart';
import 'package:apni_property_app/helper/dialogs/loading_dialog.dart';
import 'package:apni_property_app/helper/extenstions.dart';
import 'package:apni_property_app/helper/navigation_extentions.dart';
import 'package:apni_property_app/networking/api_response/api_response.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../bottomNavigation.dart';

class LoginScreen extends ConsumerWidget {
  LoginScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);
    ref.listen<AuthState>(authStateProvider, (previous, next) async {
      if (previous!.response?.status != next.response?.status) {
        switch (next.response!.status) {
          case Status.LOADING:
            LoadingDialog.showLoadingIndicator(context);
            break;
          case Status.SUCCESS:
            if (next.response?.data != null) {
              ref
                  .read(sharedUtilityProvider)
                  .setString(SharedPreferenceKeys.token, next.response!.data!.token.toString());
              ref
                  .read(sharedUtilityProvider)
                  .setString(SharedPreferenceKeys.email, next.response!.data!.email.toString());
              ref
                  .read(sharedUtilityProvider)
                  .setString(SharedPreferenceKeys.userId, next.response!.data!.userID.toString());
            }
            LoadingDialog.hideDialog(context);
            context.pushAndModelRoute(nextPage: MyNavigationBarSection(), routeName: RouteNames.loginRoute);
            break;
          case Status.ERROR:
            LoadingDialog.hideDialog(context);
            context.showSnackBar(message: next.response?.message ?? 'Something went wrong');
            break;
          case Status.SUPPORT:
          case Status.IDLE:
          case Status.NOT_FOUND:
        }
      }
    });
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 124.0),
              child: Text(
                Strings.appName,
                style: const TextStyle()
                    .copyWith(color: Palette.primaryColor, fontSize: 32.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 48.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Strings.enterYourDetails,
                  style: const TextStyle().copyWith(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Strings.email,
                        style: const TextStyle().copyWith(fontSize: 12.0),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      AppTextField(
                        validator: (value) => EmailValidator.validate(value) ? null : Strings.enterYourEmail,
                        readOnly: false,
                        hintText: Strings.enterYourEmail,
                        onChanged: (String? value) {},
                        onSaved: (String? value) {
                          authState.loginRequest?.email = value;
                        },
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        Strings.password,
                        style: const TextStyle().copyWith(fontSize: 12.0),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      AppTextField(
                        validator: (value) => value.isEmpty ? Strings.passwordBlankError : null,
                        readOnly: false,
                        hintText: Strings.enterYourPassword,
                        obscureText: authState.obscureText,
                        inputType: TextInputType.visiblePassword,
                        suffixIcon: IconButton(
                          onPressed: () {
                            ref.read(authStateProvider.notifier).togglePasswordText();
                          },
                          icon: Icon(
                            authState.obscureText ? Icons.visibility_off : Icons.visibility,
                          ),
                        ),
                        onChanged: (String? value) {},
                        onSaved: (String? value) {
                          authState.loginRequest?.pass = value;
                        },
                      ),
                      const SizedBox(
                        height: 4.0,
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: GestureDetector(
                          onTap: () {
                            context.pushName(routeName: RouteNames.forgetPassword);
                          },
                          child: Text(
                            Strings.forgetPassword,
                            style: const TextStyle().copyWith(fontSize: 12.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Row(
                        children: [
                          Image.asset(AppImages.googleLogo),
                          const SizedBox(
                            width: 16.0,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                context.pushName(routeName: RouteNames.signUpRoute);
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(text: Strings.newHere),
                                      TextSpan(
                                        text: ' ${Strings.register}',
                                        style: const TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              context.hideKeyboard();
                              if (_validateAndSave()) {
                                ref.read(authStateProvider.notifier).login(context, authState.loginRequest!.toJson());
                              }
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(4),
                                color: Palette.primaryColor,
                              ),
                              child: Text(
                                Strings.login,
                                style: const TextStyle().copyWith(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  bool _validateAndSave() {
    final FormState? form = _formKey.currentState;
    if (form!.validate()) {
      _formKey.currentState?.save();
      return true;
    } else {
      return false;
    }
  }
}
