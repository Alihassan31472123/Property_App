import 'package:flutter/material.dart';

class TextFieldElement extends StatelessWidget {
  final String text;
  final Color? color;
  final bool? addCurrency;

  const TextFieldElement({super.key, required this.text, this.addCurrency, this.color});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(4),
          child: Container(
              color: color ?? Colors.grey.shade300,
              width: double.infinity,
              child: Row(
                children: [
                  Expanded(
                      flex: 9,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 16.0),
                        child: Text(text),
                      )),
                  Visibility(
                      visible: addCurrency ?? true,
                      child: Container(
                          color: Colors.white70,
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 16.0),
                            child: Text('PKR'),
                          )))
                ],
              )),
        );
  }
}
