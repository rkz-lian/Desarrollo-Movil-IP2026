// 1. Clase Persona
class Persona {
  String nombre;
  int edad;
  String ciudad;

  // 2. Constructor principal
  Persona(this.nombre, this.edad, this.ciudad);

  // 3. Constructor nombrado desde JSON
  Persona.fromJson(Map<String, dynamic> json)
      : nombre = json['nombre'],
        edad = json['edad'],
        ciudad = json['ciudad'];

  // 4. Método para imprimir datos usando interpolación
  void imprimirDatos() {
    print('Nombre: $nombre, Edad: $edad, Ciudad: $ciudad');
  }
}

// 5. Función tradicional sin parámetros
void mensajeSaludo() {
  print("Hola, hice una función tradicional sin parámetros.");
}

// Función tradicional con parámetros
void imprimirValor(dynamic valor) {
  print("El valor recibido es: $valor");
}

// 6. Función flecha sin parámetros
String obtenerMensaje() => "Hola, aprendí a hacer una función flecha sin parámetros.";

// Función flecha con parámetros
dynamic retornarValor(dynamic valor) => valor;

// 7. Función main para ejecutar el programa
void main() {
  // Instancia usando constructor normal
  Persona persona1 = Persona("Yulian", 21, "Cartagena");

  // JSON de ejemplo
  Map<String, dynamic> json = {
    "nombre": "Catalina",
    "edad": 20,
    "ciudad": "Alto Hospicio"
  };

  // Instancia usando constructor fromJson
  Persona persona2 = Persona.fromJson(json);

  // Imprimir datos
  persona1.imprimirDatos();
  persona2.imprimirDatos();

  print("");

  // Ejecutar funciones tradicionales
  mensajeSaludo();
  imprimirValor(100);

  print("");

  // Ejecutar funciones flecha
  print(obtenerMensaje());
  print("Valor retornado: ${retornarValor("Primera actividad con Dart, es genial")}");
}
