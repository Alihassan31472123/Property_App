import 'package:apni_property_app/configs/res/resource/src/strings.dart';
import 'package:apni_property_app/configs/res/style/style.dart';
import 'package:apni_property_app/configs/routes/routes_name.dart';
import 'package:apni_property_app/features/core/providers/state_providers.dart';
import 'package:apni_property_app/features/core/states/auth_state/auth_state.dart';
import 'package:apni_property_app/features/presentation/components/app_text_field.dart';
import 'package:apni_property_app/features/presentation/components/base_screen.dart';
import 'package:apni_property_app/helper/dialogs/loading_dialog.dart';
import 'package:apni_property_app/helper/extenstions.dart';
import 'package:apni_property_app/helper/navigation_extentions.dart';
import 'package:apni_property_app/networking/api_response/api_response.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ForgetPasswordScreen extends ConsumerWidget {
  ForgetPasswordScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AuthState>(authStateProvider, (previous, next) {
      if (previous!.forgetPasswordResponse?.status !=
          next.forgetPasswordResponse?.status) {
        if (next.forgetPasswordResponse?.status == Status.LOADING) {
          Future(() => LoadingDialog.showLoadingIndicator(context));
        } else if (next.forgetPasswordResponse?.status == Status.SUCCESS) {
          var message = next.forgetPasswordResponse?.data?.message ??
              next.forgetPasswordResponse?.message ??
              "Email Sent Successfully";
          var isSuccessFull =
              next.forgetPasswordResponse?.data?.status == Status.SUCCESS.name;
          LoadingDialog.hideDialog(context);
          context.showSnackBar(message: message);
          if (isSuccessFull) {
            context.pushName(routeName: RouteNames.loginRoute);
          }
        } else if (next.forgetPasswordResponse?.status == Status.ERROR) {
          var message = next.forgetPasswordResponse?.data?.message ??
              next.forgetPasswordResponse?.message ??
              "Something went wrong";
          LoadingDialog.hideDialog(context);
          context.showSnackBar(message: message);
        }
      }
    });
    return ScreenBase(
        screenTitle: Text(Strings.forgetPassword),
        screenBody: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Don't worry, we've got you covered. To reset your password, please follow these steps:",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              const Text(
                '1. Enter your registered email address below.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 8),
              const Text(
                '2. Click the "Reset Password" button.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 8),
              const Text(
                '3. Check your email for a password reset link.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 8),
              const Text(
                '4. Click the link to create a new password.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 8),
              const Text(
                '5. You\'re all set! You can now log in with your new password.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 8),
              Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppTextField(
                      readOnly: false,
                      textEditingController: _emailController,
                      validator: (value) => EmailValidator.validate(value)
                          ? null
                          : Strings.enterYourEmail,
                      hintText: Strings.enterYourEmail,
                      onChanged: (String? value) {},
                      onSaved: (String? value) {},
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    TextButton(
                      onPressed: () {
                        context.hideKeyboard();
                        if (_validateAndSave()) {
                          var request = {"Email": _emailController.text};
                          ref
                              .read(authStateProvider.notifier)
                              .forgetPassword(request);
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 16),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(4),
                          color: Palette.primaryColor,
                        ),
                        child: Text(
                          'Reset Password',
                          style:
                              const TextStyle().copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
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
