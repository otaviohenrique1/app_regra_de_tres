import 'package:flutter/material.dart';
import 'package:app_regra_de_tres/components/linha.dart';
import 'package:app_regra_de_tres/components/titulo.dart';
import 'package:app_regra_de_tres/components/botao.dart';
import 'package:app_regra_de_tres/components/campo_texto.dart';
import 'package:app_regra_de_tres/styles/fonts.dart';
import 'package:app_regra_de_tres/styles/colors.dart';
import 'package:app_regra_de_tres/utils/helpers.dart';
import 'package:app_regra_de_tres/utils/validator.dart';

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
  final TextEditingController _campoXController = TextEditingController();

  @override
  void dispose() {
    _campoAController.dispose();
    _campoBController.dispose();
    _campoCController.dispose();
    _campoXController.dispose();
    super.dispose();
  }

  double a = 0;
  double b = 0;
  double c = 0;
  String x = "";

  String valorLabelA = "A";
  String valorLabelB = "B";
  String valorLabelC = "C";
  String valorLabelX = "X";
  String valorLabelResultado = "??";

  void onSubmitForm() {
    if (formKey.currentState!.validate()) {
      setState(() {
        try {
          a = double.parse(_campoAController.text);
          b = double.parse(_campoBController.text);
          c = double.parse(_campoCController.text);
          x = _campoXController.text;

          valorLabelA = formataNumero(a);
          valorLabelB = formataNumero(b);
          valorLabelC = formataNumero(c);
          valorLabelX = x;

          double resultado = (b * c) / a;
          valorLabelResultado = formataNumero(resultado);
        } catch (e) {
          showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text('Aviso!'),
              content: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Os campos numericos aceitam apenas valores numericos.'),
                ],
              ),
              icon: const Icon(
                Icons.warning_amber_rounded,
                size: 64,
              ),
              iconColor: Colors.red,
              actions: <Widget>[
                TextButton(
                  // onPressed: () => Navigator.pop(context),
                  onPressed: () => Navigator.pop(context, 'Cancel'),
                  child: const Text('Fechar'),
                ),
              ],
            ),
          );
        }
      });
    }
  }

  void onResetForm() {
    setState(() {
      formKey.currentState!.reset();
      a = 0;
      b = 0;
      c = 0;
      x = "";
      valorLabelA = "A";
      valorLabelB = "B";
      valorLabelC = "C";
      valorLabelX = "X";
      valorLabelResultado = "??";
      _campoAController.clear();
      _campoBController.clear();
      _campoCController.clear();
      _campoXController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: azul,
        title: const Titulo(
          titulo: "Regra de Três",
          fontSize: 22,
          color: branco,
          fontWeight: fontWeightRegular,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Form(
                key: formKey,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: CampoTexto(
                            hintText: "A",
                            controller: _campoAController,
                            keyboardType: TextInputType.number,
                            validator: validaCampoVazio,
                          ),
                        ),
                        const Linha(width: 48, height: 8),
                        Expanded(
                          child: CampoTexto(
                            hintText: "B",
                            controller: _campoBController,
                            keyboardType: TextInputType.number,
                            validator: validaCampoVazio,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: CampoTexto(
                            hintText: "C",
                            controller: _campoCController,
                            keyboardType: TextInputType.number,
                            validator: validaCampoVazio,
                          ),
                        ),
                        const Linha(width: 48, height: 8),
                        Expanded(
                          child: CampoTexto(
                            hintText: "X",
                            controller: _campoXController,
                            keyboardType: TextInputType.text,
                            validator: validaCampoVazio,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Botao(
                            onPressed: onSubmitForm,
                            label: "Calcular",
                            backgroundColor: azul,
                            fontColor: branco,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Botao(
                            onPressed: onResetForm,
                            label: "Limpar",
                            backgroundColor: cinza,
                            fontColor: branco,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Divider(color: preto),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Titulo(
                    titulo: valorLabelA,
                    fontSize: 20,
                    color: preto,
                    fontWeight: fontWeightRegular,
                  ),
                  const Linha(width: 50, height: 2),
                  Titulo(
                    titulo: valorLabelB,
                    fontSize: 20,
                    color: preto,
                    fontWeight: fontWeightRegular,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Titulo(
                    titulo: valorLabelC,
                    fontSize: 20,
                    color: preto,
                    fontWeight: fontWeightRegular,
                  ),
                  const Linha(width: 50, height: 2),
                  Titulo(
                    titulo: valorLabelX,
                    fontSize: 20,
                    color: preto,
                    fontWeight: fontWeightRegular,
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Titulo(
                      titulo: "X = ",
                      fontSize: 20,
                      color: preto,
                      fontWeight: fontWeightRegular,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(color: preto, width: 2),
                            ),
                          ),
                          child: Titulo(
                            titulo: "($valorLabelB * $valorLabelC)",
                            fontSize: 20,
                            color: preto,
                            fontWeight: fontWeightRegular,
                          ),
                        ),
                        Titulo(
                          titulo: valorLabelA,
                          fontSize: 20,
                          color: preto,
                          fontWeight: fontWeightRegular,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Titulo(
                titulo: "$valorLabelX = $valorLabelResultado",
                fontSize: 20,
                color: preto,
                fontWeight: fontWeightRegular,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
