import 'package:app_regra_de_tres/components/titulo.dart';
import 'package:app_regra_de_tres/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:app_regra_de_tres/styles/fonts.dart';

class Botao extends StatelessWidget {
  const Botao({
    super.key,
    required this.onPressed,
    required this.fontColor,
    required this.label,
    required this.backgroundColor,
  });

  final void Function() onPressed;
  final Color fontColor;
  final Color backgroundColor;
  final String label;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        padding: const EdgeInsets.all(8),
        minimumSize: const Size.fromHeight(48),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
      onPressed: onPressed,
      child: Titulo(
        titulo: label,
        fontSize: 16,
        color: branco,
        fontWeight: fontWeightBold,
      ),
    );
  }
}
