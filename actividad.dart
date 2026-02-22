void main() {
  // ===============================
  // PRUEBAS EN MAIN
  // ===============================

  // Constructor normal
  Persona p1 = Persona(
    nombre: 'Isaac',
    apellido: 'Carmona',
    edad: 20,
    isAlive: true,
  );

  // Constructor desde JSON
  Persona p2 = Persona.fromJson({
    'nombre': 'Juan',
    'apellido': 'Perez',
    'edad': 25,
    'isAlive': false,
  });

  // Imprimir objetos
  print(p1);
  print(p2);

  // Funciones tradicionales
  print(saludar());
  print(sumar(10, 5));

  // Funciones flecha
  print(saludarV2());
  print(sumarV2(20));
}

// ===================================
// CLASE PERSONA
// ===================================
class Persona {
  String nombre;
  String apellido;
  int edad;
  bool isAlive;

  // Constructor normal
  Persona({
    required this.nombre,
    required this.apellido,
    required this.edad,
    required this.isAlive,
  });

  // Constructor personalizado desde JSON
  Persona.fromJson(Map<String, dynamic> json)
    : nombre = json['nombre'] ?? 'Sin nombre',
      apellido = json['apellido'] ?? 'Sin apellido',
      edad = json['edad'] ?? 0,
      isAlive = json['isAlive'] ?? false;

  // Interpolación de String
  @override
  String toString() {
    return 'Persona: $nombre $apellido, Edad: $edad, Vivo: $isAlive';
  }
}

// ===================================
// FUNCIONES TRADICIONALES
// ===================================

// Sin parámetros
String saludar() {
  return 'Hola mundo';
}

// Con parámetros
int sumar(int a, int b) {
  return a + b;
}

// ===================================
// FUNCIONES FLECHA
// ===================================

// Sin parámetros
String saludarV2() => 'Hola a todos';

// Con parámetros
int sumarV2(int a, [int b = 0]) => a + b;
