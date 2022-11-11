import 'package:chat_app_with_firebase/core/core/app_colors.dart';
import 'package:flutter/material.dart';

Padding buildTextFormField(
    {var onsubmited,
    required TextEditingController? controller,
    required String? label,
    IconData? prefix,
    Color borderColor = Colors.white,
    IconData? suffix,
    VoidCallback? suffixAction,
    String? hintText,
    bool security = false
   , Color suffixIconColor=Colors.grey}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5),
    child: TextFormField(
      obscureText: security,
      onFieldSubmitted: onsubmited,
      style: TextStyle(color: Colors.grey),
      controller: controller,
      validator: (value) {
        if (value!.isEmpty) {
          return "field can't be null";
        }
      },
      decoration: InputDecoration(
          hintText: hintText != null ? hintText : null,
          hintStyle: TextStyle(color: AppColors.primaryColor),
          label: Text("$label"),
          suffixIcon: suffix != null
              ? IconButton(
                  onPressed: suffixAction,
                  icon: Icon(
                    suffix,
                    color: suffixIconColor,
                  ),
                )
              : null,
          labelStyle: TextStyle(color: Colors.white),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor),
            borderRadius: BorderRadius.circular(
              17,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              17,
            ),
          ),
          prefixIcon: prefix != null
              ? Icon(
                  prefix,
                  color: Colors.grey,
                )
              : null),
    ),
  );
}
