import 'package:flutter/material.dart';

class VisionScreen extends StatelessWidget {
  const VisionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nuestra Visión')),
      body: const Center(child: Text('Contenido de la Visión', style: TextStyle(fontSize: 20))),
    );
  }
}
