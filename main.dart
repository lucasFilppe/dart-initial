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

   //orientação a objetos
  Carro porsche = Carro("panamera", 701116338636);
  print(porsche.modelo);
  print(porsche._cpfComprador);

  //herança, poliformismo e abstração
  PessoaLucas lucas = PessoaLucas();
  PessoaMaria maria = PessoaMaria();

  print(lucas.comunicar());
  print(maria.comunicar());

   Cachorro dog = Cachorro();
  dog.dormir(); // Herdado da classe Animal
  dog.latir();  // Método próprio
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

//progmação orientada a objetos = classes e objetos
//conceito fundamentais
class Carro{
  final String modelo;

  //ecapsulamento
  int _cpfComprador;

  Carro(this.modelo, this._cpfComprador);

   int get cpfComprador => _cpfComprador;

  set cpfComprador(int novoCpf) {
    _cpfComprador = novoCpf;
  }

}

//herança, poliformismo e abstração
//a abstração é o como um contarato que qaulquer pessoa deve seguir
//Uma classe abstrata define um contrato. Ela diz o que as classes devem fazer, mas não como.
abstract class Pessoa{
  String comunicar();// a pessoa deve se comunicar
}

//Qualquer classe que implemente Pessoa é obrigada a criar o método comunicar().
class PessoaLucas implements Pessoa {
  @override
  String comunicar() {
    return "Lucas gosta de comunicar falando de Deus.";
  }
}

class PessoaMaria implements Pessoa {
  @override
  String comunicar() {
    return "Maria gosta de comunicar cantando.";
  }
}

//Herança é quando uma classe herda características de outra.
class Animal {
  void dormir() {
    print("O animal está dormindo.");
  }
}

class Cachorro extends Animal {
  void latir() {
    print("Au Au!");
  }
}
/**
 * Resumo
Conceito	Palavra-chave	Exemplo
Abstração	abstract	Define um contrato que outras classes devem seguir.
Herança	extends	Uma classe herda atributos e métodos de outra.
Polimorfismo	@override	O mesmo método tem comportamentos diferentes em
 cada classe.
Interface	implements	A classe é obrigada a implementar todos os 
métodos da interface/classe abstrata.
Observação: no seu exemplo você usou implements. Em Dart, é mais comum usar
 extends quando a classe abstrata fornece comportamento compartilhado, e 
 implements quando você quer apenas obrigar a implementação de todos os
  métodos, como uma interface.
 */