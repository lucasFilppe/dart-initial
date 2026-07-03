class CommandRunner {
  /// Executa a lógica do aplicativo de linha de comando com os argumentos fornecidos.
  Future<void> run(List<String> input) async {
    print('CommandRunner received arguments: $input');
  }
}
