import 'package:flutter/material.dart';
import 'dart:io';

// Importaciones de las pantallas de destino
import 'login_screen.dart';
import 'mision_screen.dart';
import 'vision_screen.dart';
import 'contactos_screen.dart';
import 'info_screen.dart';

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
        // CAMBIO AQUÍ: Convertimos el Icon en IconButton para abrir el Drawer
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.home),
            onPressed: () => Scaffold.of(context).openDrawer(),
            tooltip: 'Abrir menú',
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => exit(0),
            icon: const Icon(Icons.logout),
            tooltip: 'Salir',
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Colors.deepPurple),
              child: Image.asset('images/logo.png'),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.login),
              title: const Text('Login'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.military_tech),
              title: const Text('Misión'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => const MisionScreen()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.visibility),
              title: const Text('Visión'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => const VisionScreen()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.contact_page),
              title: const Text('Contactos'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ContactosScreen()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('Info'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => const InfoScreen()));
              },
            ),
          ],
        ),
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
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('$counter', style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Colors.deepPurple)),
                  const SizedBox(height: 10),
                  Text('Click${counter == 1 ? '' : 's'}', style: const TextStyle(fontSize: 20)),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _CustomButton(icon: Icons.refresh, onPressed: _reset, tooltip: 'Reiniciar'),
          const SizedBox(height: 10),
          _CustomButton(icon: Icons.plus_one, onPressed: _increment, tooltip: 'Incrementar'),
          const SizedBox(height: 10),
          _CustomButton(icon: Icons.exposure_minus_1_rounded, onPressed: _decrement, tooltip: 'Decrementar'),
        ],
      ),
    );
  }
}

class _CustomButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final String tooltip;

  const _CustomButton({required this.icon, required this.onPressed, required this.tooltip});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      tooltip: tooltip,
      child: Icon(icon),
    );
  }
}
