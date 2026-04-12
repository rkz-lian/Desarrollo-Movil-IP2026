import 'package:flutter/material.dart';
import 'dart:io';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int counter = 0;
  
  void _reset() => setState(() => counter = 0);
  void _increment() => setState(() => counter++);
  void _decrement() {
    if (counter > 0) setState(() => counter--);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('CounterApp'),
          leading: const Icon(Icons.home),
          actions: [
            IconButton(
              onPressed: () => exit(0),
              icon: const Icon(Icons.logout),
              tooltip: 'Salir',
            ),
          ],
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurple, Colors.amber],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Center(
            child: Card(
              elevation: 8,
              margin: const EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '$counter',
                      style: const TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Click${counter == 1 ? '' : 's'}',
                      style: const TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _CustomButton(
              icon: Icons.refresh,
              onPressed: _reset,
              tooltip: 'Reiniciar',
            ),
            const SizedBox(height: 10),
            _CustomButton(
              icon: Icons.plus_one,
              onPressed: _increment,
              tooltip: 'Incrementar',
            ),
            const SizedBox(height: 10),
            _CustomButton(
              icon: Icons.exposure_minus_1_rounded,
              onPressed: _decrement,
              tooltip: 'Decrementar',
            ),
          ],
        ),
      );
  }
}

class _CustomButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final String tooltip;

  const _CustomButton({
    required this.icon,
    required this.onPressed,
    required this.tooltip,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      tooltip: tooltip,
      child: Icon(icon),
    );
  }
}
