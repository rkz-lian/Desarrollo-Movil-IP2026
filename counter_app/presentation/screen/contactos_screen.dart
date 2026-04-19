import 'package:flutter/material.dart';

class ContactosScreen extends StatelessWidget {
  const ContactosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nuestros Contactos')),
      body: const Center(child: Text('Contenido de Contactos', style: TextStyle(fontSize: 20))),
    );
  }
}
