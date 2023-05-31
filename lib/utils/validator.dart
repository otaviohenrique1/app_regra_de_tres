String? validaCampoVazio(String? value) {
  if (value == null || value.isEmpty) {
    return "Campo vazio";
  } else {
    return null;
  }
}
