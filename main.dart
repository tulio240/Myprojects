void main() {
  int ValorVariavel = 10;
  print(ValorVariavel);

  bool ehVerdadeiro = true;
  print(ehVerdadeiro);

  String? nome;
  nome = 'ABC';
  print(nome);
  nome = null;

  late String sobrenome;
  sobrenome = 'Silva';
  print(sobrenome);

  bool seguiEmFrente = true;

  if (seguiEmFrente) {
    print('Andar');
  } 
  else{
    print('Parar');
  }

  if (10 > 5){
    print("Dex é maior que cinco");
  }

  int ValorInt = 5;
    switch(ValorInt){
      case 0:
        print("zero");
        break;
      case 1:
        print('Um');
        break;
      case 2:
        print('Dois');
        break;
      default:
        print('Padrão');
    }
    
    Celular celularteste = Celular('Azul', 5, 0.800, 5.7);
    Celular celularprova = Celular('Preto', 10, 0.100, 5.7);

    print(celularteste.cor);
}

class Celular{

  final String cor;
  final int qtdPros;
  final double tamanho;
  final double peso;

  Celular(this.cor, this.qtdPros, this.peso, this.tamanho);
}