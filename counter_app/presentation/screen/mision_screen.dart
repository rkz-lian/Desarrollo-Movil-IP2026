import 'package:flutter/material.dart';

class MisionScreen extends StatelessWidget {
  const MisionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nuestra Misión')),
      body: const Center(child: Text('Contenido de la Misión', style: TextStyle(fontSize: 20))),
    );
  }
}