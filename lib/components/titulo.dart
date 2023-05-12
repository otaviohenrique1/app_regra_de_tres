import 'package:flutter/material.dart';
import 'package:app_regra_de_tres/styles/fonts.dart';

class Titulo extends StatelessWidget {
  const Titulo({
    super.key,
    required this.titulo,
    required this.color,
    required this.fontSize,
    required this.fontWeight,
  });

  final String titulo;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      titulo,
      softWrap: true,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontFamily: fontFamily,
        fontWeight: fontWeight,
      ),
    );
  }
}
