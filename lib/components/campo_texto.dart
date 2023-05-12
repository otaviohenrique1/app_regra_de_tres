import 'package:flutter/material.dart';
import 'package:app_regra_de_tres/styles/colors.dart';
import 'package:app_regra_de_tres/styles/fonts.dart';

class CampoTexto extends StatelessWidget {
  const CampoTexto({
    super.key,
    required this.controller,
    required this.hintText,
    required this.label,
    required this.keyboardType,
    this.validator,
  });

  final String label;
  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 8),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: fontWeightBold,
              ),
            ),
          ),
        ),
        TextFormField(
          controller: controller,
          validator: validator,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(
              fontSize: 16,
              fontFamily: fontFamily,
              fontWeight: fontWeightRegular,
            ),
            errorStyle: const TextStyle(
              fontSize: 16,
              fontFamily: fontFamily,
              fontWeight: fontWeightRegular,
            ),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(
                color: preto,
                width: 2,
                style: BorderStyle.solid,
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(
                color: azul1,
                width: 2,
                style: BorderStyle.solid,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
