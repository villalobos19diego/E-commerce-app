
library text_form;

import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  final String labelText;
  final Color colorsLabel;
  final double fontSize;
  final String hint;
  final Color colorsHint;
  final BuildContext context;
  final Icon? icon;
  final FontStyle fontStyle;
  final BorderSide borderSide;
  final BorderRadius borderRadius;
  final bool filled;
  final Color colorsFill;
  final bool isPassword;
  final TextInputType textInputType;
  final String? Function(String?)? validator;
  final void Function(String)? onfieldSubmitted;
  final TextInputAction? textAction;
  final InkWell? suffixInkwell;
  final FocusNode? focusNode;
  final TextEditingController? textEditingController;

  const TextFormFieldWidget({
    Key? key,
    required this.labelText,
    required this.colorsLabel,
    required this.fontSize,
    required this.hint,
    required this.colorsHint,
    required this.context,
    this.icon,
    this.fontStyle = FontStyle.normal,
    this.borderSide = const BorderSide(color: Colors.black),
    this.borderRadius = BorderRadius.zero,
    this.filled = false,
    this.colorsFill = Colors.white,
    this.isPassword = false,
    this.textInputType = TextInputType.text,
    this.validator,
    this.onfieldSubmitted,
    this.textAction,
    this.suffixInkwell,
    this.focusNode,
    this.textEditingController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isPassword,
      validator: validator,
      keyboardType: textInputType,
      focusNode: focusNode,
      controller: textEditingController,
      textInputAction: textAction,
      onFieldSubmitted: onfieldSubmitted,
      decoration: InputDecoration(
        suffix: suffixInkwell,
        prefixIcon: icon,
        labelText: labelText,
        labelStyle: TextStyle(
          color: colorsLabel,
          fontSize: fontSize,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: borderSide,
          borderRadius: borderRadius,
        ),
        filled: filled,
        fillColor: colorsFill,
      ),
    );
  }
}
