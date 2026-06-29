import 'dart:developer';
import 'dart:io'; // Add this line at the top

import 'package:cli/cli.dart' as cli;

const version = '0.0.1';
void main(List<String> arguments) {
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
}

void printUsuario(){
  print("Os seguintes comandos são válidos: 'help', 'version', 'search <ARTICLE-TITLE>");
}

void searchWikepedia(List<String>? arguments){
  print('searchWikipedia recebeu os seguintes argumentos: $arguments');
}