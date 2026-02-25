abstract class Animal{}
abstract class Mamifero extends Animal{}
abstract class Ave extends Animal{}
abstract class Pez extends Animal{}

mixin Caminar{
  void caminar()=>print('estoy caminando');
}

mixin Nadar{
  void nadar()=>print('estoy nadando');
}

mixin Volar{
  void volar()=>print('estoy volando');
}

//Mamiferos
class Delfin extends Mamifero with Nadar{}
class Murcielago extends Mamifero with Caminar, Volar{}
class Gato extends Mamifero with Caminar, Volar{}
//Ave 
// Translate (Dove = Paloma)
class Paloma extends Ave with Caminar, Volar{}
class Pato extends Ave with Caminar, Nadar, Volar{}
//Pez
class Tiburon extends Pez with Nadar{}
class PezVolador extends Pez with Nadar, Volar{}

void main() {
  print('--- Delfin ---');
  final delfin = Delfin();
  delfin.nadar();

  print('\n--- Murcielago ---');
  final murcielago = Murcielago();
  murcielago.caminar();
  murcielago.volar();

  print('\n--- Gato ---');
  final gato = Gato();
  gato.caminar();

  print('\n--- Paloma ---');
  final paloma = Paloma();
  paloma.caminar();
  paloma.volar();

  print('\n--- Pato ---');
  final pato = Pato();
  pato.caminar();
  pato.volar();
  pato.nadar();

  print('\n--- Tiburon ---');
  final tiburon = Tiburon();
  tiburon.nadar();

  print('\n--- PezVolador ---');
  final pezvolador = PezVolador();
  pezvolador.nadar();
  pezvolador.volar();
}