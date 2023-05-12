import 'package:flutter/material.dart';
import 'package:app_regra_de_tres/styles/colors.dart';

class Linha extends StatelessWidget {
  const Linha({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: preto,
      margin: const EdgeInsets.symmetric(horizontal: 16),
    );
  }
}
