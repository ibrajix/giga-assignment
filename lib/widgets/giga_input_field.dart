import 'package:flutter/material.dart';
import 'package:flutterassignment/constants/colors.dart';

class GigaInputField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final Icon? suffixIcon;
  final String? Function(String? input)? validator;
  final Function()? onClickTextField;
  final Function(String)? onTextChanged;
  final AutovalidateMode? autoValidateMode;
  final bool readOnly;


  const GigaInputField({
    Key? key,
    required this.hintText,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.readOnly = false,
    this.suffixIcon,
    this.onClickTextField,
    this.validator,
    this.onTextChanged,
    this.autoValidateMode
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: autoValidateMode,
      controller: controller,
      keyboardType: keyboardType,
      readOnly: readOnly,
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