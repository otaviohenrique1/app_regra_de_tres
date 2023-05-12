String formataNumero(double numero) {
  String texto = numero.toString();
  String resultado = texto.replaceAll(".", ",");
  return resultado;
}
