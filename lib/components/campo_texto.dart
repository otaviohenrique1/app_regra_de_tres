import 'package:flutter/material.dart';
import 'package:app_regra_de_tres/styles/colors.dart';
import 'package:app_regra_de_tres/styles/fonts.dart';

class CampoTexto extends StatelessWidget {
  const CampoTexto({
    super.key,
    required this.controller,
    required this.hintText,
    required this.keyboardType,
    this.validator,
  });

  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    BorderStyle solid = BorderStyle.solid;
    const BorderRadius borderRadiusCircular =
        BorderRadius.all(Radius.circular(8));
    double fontSize = 16;
    double borderWidth = 2;

    return TextFormField(
      keyboardType: keyboardType,
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: fontSize,
          fontFamily: fontFamily,
          fontWeight: fontWeightRegular,
        ),
        errorStyle: TextStyle(
          fontSize: fontSize,
          fontFamily: fontFamily,
          fontWeight: fontWeightRegular,
        ),
        border: OutlineInputBorder(
          borderRadius: borderRadiusCircular,
          borderSide: BorderSide(
            color: preto,
            width: borderWidth,
            style: solid,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: borderRadiusCircular,
          borderSide: BorderSide(
            color: azul,
            width: borderWidth,
            style: solid,
          ),
        ),
      ),
    );
  }
}
