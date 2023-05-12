import 'package:flutter/material.dart';
import 'package:app_regra_de_tres/pages/homepage.dart';
import 'package:app_regra_de_tres/styles/colors.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: azul),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
