// =====================================================
// ACTIVIDAD: CLASES ABSTRACTAS Y MIXINS EN DART
// =====================================================

// ===============================
// SECCIÓN 1: ANIMALES + MIXINS
// ===============================

// Clase abstracta base
abstract class Animal {}

// Subclases abstractas
abstract class Mamifero extends Animal {}
abstract class Ave extends Animal {}
abstract class Pez extends Animal {}

// Mixins
mixin Caminar {
  void caminar() => print('Estoy caminando');
}

mixin Nadar {
  void nadar() => print('Estoy nadando');
}

mixin Volar {
  void volar() => print('Estoy volando');
}

// Clases concretas
class Delfin extends Mamifero with Nadar {}

class Murcielago extends Mamifero with Caminar, Volar {}

class Gato extends Mamifero with Caminar {}

class Paloma extends Ave with Caminar, Volar {}

class Pato extends Ave with Caminar, Volar, Nadar {}

class Tiburon extends Pez with Nadar {}

class PezVolador extends Pez with Nadar, Volar {}


// ===============================
// SECCIÓN 2: PLANTAS DE ENERGÍA
// ===============================

enum PlantType { nuclear, wind, water }

abstract class EnergyPlant {
  double energyLeft;
  final PlantType type;

  EnergyPlant({
    required this.energyLeft,
    required this.type,
  });

  void consumeEnergy(double amount);
}

// Usando extends
class WindPlant extends EnergyPlant {

  WindPlant({required double initialEnergy})
      : super(energyLeft: initialEnergy, type: PlantType.wind);

  @override
  void consumeEnergy(double amount) {
    energyLeft -= amount;
  }
}

// Usando implements
class NuclearPlant implements EnergyPlant {

  @override
  double energyLeft;

  @override
  final PlantType type = PlantType.nuclear;

  NuclearPlant({required this.energyLeft});

  @override
  void consumeEnergy(double amount) {
    // Consume menos energía (más eficiente)
    energyLeft -= (amount * 0.5);
  }
}

double chargePhone(EnergyPlant plant) {
  plant.consumeEnergy(10);

  if (plant.energyLeft < 0) {
    throw Exception('Not enough energy');
  }

  return plant.energyLeft;
}


// ===============================
// SECCIÓN 3: PRIORIDAD DE MIXINS
// ===============================

mixin A {
  String getMessage() => 'A';
}

mixin B {
  String getMessage() => 'B';
}

class P {
  String getMessage() => 'P';
}

class AB extends P with A, B {}
class BA extends P with B, A {}


// ===============================
// FUNCIÓN PRINCIPAL
// ===============================

void main() {

  print('==============================');
  print('ANIMALES');
  print('==============================');

  final delfin = Delfin();
  delfin.nadar();

  final murcielago = Murcielago();
  murcielago.caminar();
  murcielago.volar();

  final pato = Pato();
  pato.caminar();
  pato.volar();
  pato.nadar();


  print('\n==============================');
  print('PLANTAS DE ENERGÍA');
  print('==============================');

  final windPlant = WindPlant(initialEnergy: 100);
  final nuclearPlant = NuclearPlant(energyLeft: 1000);

  print('Wind remaining energy: ${chargePhone(windPlant)}');
  print('Nuclear remaining energy: ${chargePhone(nuclearPlant)}');


  print('\n==============================');
  print('PRIORIDAD DE MIXINS');
  print('==============================');

  final ab = AB();
  final ba = BA();

  print('AB -> ${ab.getMessage()}'); // B
  print('BA -> ${ba.getMessage()}'); // A
}