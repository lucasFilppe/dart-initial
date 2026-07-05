void main() {
  // 1- introdução a variaveis
  String nome = "Lucas";
  print(nome);
  int idade = 27;
  print(idade);
  // ignore: non_constant_identifier_names
  bool DeusEhFiel = true;
  print(DeusEhFiel);

  List<String> tecnologias = ["flutter", "next", "react"];
  print(tecnologias);
  print('tecnologia que estou aprendendo no momento ${tecnologias[0]}');

  // 2 - null-safety
  String? time; //quando colocams uma interrogação apos o tipo,
  //estamos indicando que o valor pode ser null
  print(time);

  //metodos e classes
  //criando classe passando os valores por construtor
  Celular celular1 = Celular("Redmi note 11s", 1549, "Xaomi");

  //chamando metodo
  celular1.caracteristicasCelular();
}

//quando criarmos classes lembre de uma analogia, ela é um objeto do mundo real
class Celular {
  //atributos da classe
  final String nomeDispositivo;
  final double preco;
  final String marca;

  //construtor da classe
  Celular(this.nomeDispositivo, this.preco, this.marca);

  //criando metodo da classe  que mostra as carcteristicas do celular
  void caracteristicasCelular() {
    print('Nome: $nomeDispositivo , RS = $preco, Marca: $marca');
  }
}