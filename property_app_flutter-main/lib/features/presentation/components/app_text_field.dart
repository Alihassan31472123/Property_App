import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController? textEditingController;
  final String? hintText;
  final bool? readOnly;
  final String? Function(dynamic)? validator;
  final TextInputType? inputType;
  final IconButton? suffixIcon;
  final bool? obscureText;
  final Function? onSaved;
  final Function? onChanged;
  final VoidCallback? onTap;
  final List<TextInputFormatter>? inputFormatters;

  const AppTextField({
    super.key,
    this.textEditingController,
    this.hintText,
    this.readOnly,
    this.inputType,
    this.inputFormatters,
    this.validator,
    this.suffixIcon,
    this.obscureText,
    this.onSaved,
    this.onChanged,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      validator: validator,
      readOnly: readOnly!,
      keyboardType: inputType,
      inputFormatters: inputFormatters,
      obscureText: obscureText ?? false,
      onTap: onTap,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(width: 2.0)),
        hintText: hintText,
        hintStyle: const TextStyle().copyWith(fontSize: 12.0),
        suffixIcon: suffixIcon,
      ),
      style: const TextStyle().copyWith(fontSize: 12.0),
      onChanged: (String? value) {
        onChanged!(value);
      },
      onSaved: (String? value) {
        onSaved!(value);
      },
    );
  }
}
