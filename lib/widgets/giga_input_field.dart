import 'package:flutter/material.dart';
import 'package:flutterassignment/constants/colors.dart';

class GigaInputField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final Icon? suffixIcon;
  final String? Function(String? input)? validator;
  final Function()? onClickTextField;
  final Function(String)? onTextChanged;
  final AutovalidateMode? autovalidateMode;

  const GigaInputField({
    Key? key,
    required this.hintText,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.suffixIcon,
    this.onClickTextField,
    this.validator,
    this.onTextChanged,
    this.autovalidateMode
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: autovalidateMode,
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: validator,
      onTap: onClickTextField,
      onChanged: onTextChanged,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: AppColors.gigaHintColor),
        suffixIcon: suffixIcon
      ),
    );
  }
}