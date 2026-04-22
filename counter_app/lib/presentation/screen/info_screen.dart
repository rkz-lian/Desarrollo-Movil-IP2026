import 'package:flutter/material.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sobre Nosotros')),
      body: const Center(child: Text('Contenido sobre nosotros', style: TextStyle(fontSize: 20))),
    );
  }
}
