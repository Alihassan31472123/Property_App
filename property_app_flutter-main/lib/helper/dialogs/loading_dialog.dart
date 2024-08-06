import 'package:apni_property_app/configs/res/style/style.dart';
import 'package:flutter/material.dart';

mixin LoadingDialog {
  static bool _isDialogShowing = false;

  static showLoadingIndicator(BuildContext context, [String? text]) {
    _isDialogShowing = true;
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0))),
              backgroundColor: Palette.primaryLightColor,
              content: LoadingIndicator(text: text ?? ""),
            ));
  }

  static hideDialog(BuildContext context) {
    if (_isDialogShowing) {
      _isDialogShowing = false;
      Navigator.of(context, rootNavigator: true).pop();
    }
  }
}

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    var displayedText = text;

    return Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              _getLoadingIndicator(),
              _getHeading(context),
              Visibility(
                  visible: displayedText.isNotEmpty,
                  child: _getText(displayedText))
            ]));
  }
}

Padding _getLoadingIndicator() {
  return const Padding(
      padding: EdgeInsets.only(bottom: 16),
      child: SizedBox(
          width: 32,
          height: 32,
          child: CircularProgressIndicator(
            strokeWidth: 3,
            color: Colors.white,
          )));
}

Widget _getHeading(context) {
  return const Padding(
      padding: EdgeInsets.only(bottom: 4),
      child: Text(
        'Please wait …',
        style: TextStyle(color: Colors.white, fontSize: 16),
        textAlign: TextAlign.center,
      ));
}

Text _getText(String displayedText) {
  return Text(
    displayedText,
    style: const TextStyle(color: Colors.white, fontSize: 14),
    textAlign: TextAlign.center,
  );
}
