import 'package:app_regra_de_tres/components/botao.dart';
import 'package:app_regra_de_tres/components/campo_texto.dart';
import 'package:app_regra_de_tres/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:app_regra_de_tres/components/titulo.dart';
import 'package:app_regra_de_tres/styles/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController _campoAController = TextEditingController();
  final TextEditingController _campoBController = TextEditingController();
  final TextEditingController _campoCController = TextEditingController();
  final TextEditingController _campoDController = TextEditingController();

  @override
  void dispose() {
    _campoAController.dispose();
    _campoBController.dispose();
    _campoCController.dispose();
    _campoDController.dispose();
    super.dispose();
  }

  void _calcularRegraDeTres() {
    setState(() {
      //
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: azul1,
        title: const Text("Regra de Três", style: TextStyle(color: branco)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: CampoTexto(
                        label: "Campo A",
                        hintText: "Campo A",
                        controller: _campoAController,
                        keyboardType: TextInputType.number,
                        validator: validaCampoVazio,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      children: [
                        const SizedBox(height: 32),
                        Container(
                          width: 32,
                          height: 8,
                          color: preto,
                        ),
                      ],
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: CampoTexto(
                        label: "Campo B",
                        hintText: "Campo B",
                        controller: _campoBController,
                        keyboardType: TextInputType.number,
                        validator: validaCampoVazio,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                Row(
                  children: [
                    Expanded(
                      child: CampoTexto(
                        label: "Campo C",
                        hintText: "Campo C",
                        controller: _campoCController,
                        keyboardType: TextInputType.number,
                        validator: validaCampoVazio,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      children: [
                        const SizedBox(height: 32),
                        Container(
                          width: 32,
                          height: 8,
                          color: preto,
                        ),
                      ],
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: CampoTexto(
                        label: "Variavel",
                        hintText: "Variavel",
                        controller: _campoDController,
                        keyboardType: TextInputType.text,
                        validator: validaCampoVazio,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                Row(
                  children: [
                    Expanded(
                      child: Botao(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {}
                        },
                        label: "Calcular",
                        backgroundColor: azul1,
                        fontColor: branco,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Botao(
                        onPressed: () {
                          formKey.currentState!.reset();
                        },
                        label: "Limpar",
                        backgroundColor: cinza1,
                        fontColor: branco,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
