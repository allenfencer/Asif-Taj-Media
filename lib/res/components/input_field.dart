// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../color.dart';

class InputField extends StatelessWidget {
  final bool obscureText;
  final TextEditingController editingController;
  final String hintText;
  final TextInputType textInputType;
  final IconData hintIcon;
  final FormFieldValidator formValidator;
  final FormFieldSetter onFieldSubmitted;
  const InputField({
    Key? key,
    this.obscureText = false,
    required this.editingController,
    required this.hintText,
    required this.textInputType,
    required this.hintIcon,
    required this.formValidator,
    required this.onFieldSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        obscureText: obscureText,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        textAlignVertical: TextAlignVertical.center,
        cursorColor: AppColors.secondaryColor,
        style: Theme.of(context)
            .textTheme
            .bodySmall!
            .copyWith(color: AppColors.dividedColor),
        controller: editingController,
        keyboardType: textInputType,
        decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: Icon(
              hintIcon,
              color: AppColors.primaryIconColor,
            ),
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.grey)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.grey)),
            filled: true,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: AppColors.secondaryColor)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.grey))),
        validator: formValidator);
  }
}
