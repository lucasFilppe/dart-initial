import 'dart:developer';
import 'dart:io'; // Add this line at the top
import 'package:http/http.dart' as http;

import 'package:cli/cli.dart' as cli;

const version = '0.0.1';
/*void main(List<String> arguments) {
  //A propriedade isEmpty (que significa "está vazio" em inglês) 
  //serve para verificar rapidamente se uma coleção — como uma 
  //lista, um texto (String) ou um mapa — não contém nenhum item.
  //verifica se nenhum argumento de linha de comando foi fornecido.
  if(arguments.isEmpty)
    print('Hello dart');
  //retorna o primeiro elemento da lista de argumentos
  else if(arguments.first == 'version')
    print('Dartapedia Cli versao: $version');
  else if(arguments.first == 'search'){
    //print("Search comando reconhecido");
    //finalAs variáveis ​​só podem ser definidas uma vez e 
    //são usadas quando você não pretende alterá-las novamente no código
    /**arguments.sublist(1)cria uma nova lista contendo todos os elementos da 
     * argumentslista após o primeiro elemento (que era search).
arguments.length > 1 ? ... : null;é um operador condicional (ternário). 
Ele garante que, se nenhum argumento for fornecido após o search comando,
 inputArgsse torne null, correspondendo ao comportamento do
 código de exemplo para searchWikipediao argumentsparâmetro de List<String>? */
    final inputArgs = arguments.length > 1 ? arguments.sublist(1): null;
    searchWikepedia(inputArgs);
  }
  else{
    printUsuario();
  }
}*/

// ... (existing const version declaration and printUsage function)

void main(List<String> arguments) {
  if (arguments.isEmpty || arguments.first == 'help') {
    printUsage();
  } else if (arguments.first == 'version') {
    print('Dartpedia CLI version $version');
  } else if (arguments.first == 'wikipedia') { // Changed to 'wikipedia'
    // Pass all arguments *after* 'wikipedia' to searchWikipedia
    final inputArgs = arguments.length > 1 ? arguments.sublist(1) : null;
    searchWikipedia(inputArgs); // Call searchWikipedia (no 'await' needed here for main)
  } else {
    printUsage(); // Catch all for any unrecognized command.
  }
}


void printUsage(){
  print("Os seguintes comandos são válidos: 'help', 'version', 'search <ARTICLE-TITLE>");
}

Future<String> getWikipediaArticle(String articleTitle)async{
  final url = Uri.https(
    'en.wikipedia.org', // Wikipedia API domain
    '/api/rest_v1/page/summary/$articleTitle', // API path for article summary

  );
   final response = await http.get(url); // Make the HTTP request

  if (response.statusCode == 200) {
    return response.body; // Return the response body if successful
  }

  // Return an error message if the request failed
  return 'Error: Failed to fetch article "$articleTitle". Status code: ${response.statusCode}';
}

void searchWikipedia(List<String>? arguments) async {
  final String articleTitle;

  if (arguments == null || arguments.isEmpty) {
    print('Please provide an article title.');
    final inputFromStdin = stdin.readLineSync();
    if (inputFromStdin == null || inputFromStdin.isEmpty) {
      print('No article title provided. Exiting.');
      return;
    }
    articleTitle = inputFromStdin;
  } else {
    articleTitle = arguments.join(' ');
  }

  print('Looking up articles about "$articleTitle". Please wait.');

  // Call the API and await the result.
  var articleContent = await getWikipediaArticle(articleTitle);
  print(articleContent); // Print the full article response (raw JSON for now)
}
