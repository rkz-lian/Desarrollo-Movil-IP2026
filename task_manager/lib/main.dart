import 'package:flutter/material.dart';

void main() => runApp(const TaskManagerApp());

class TaskManagerApp extends StatelessWidget {
  const TaskManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task Manager',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blueGrey,
          primary: Colors.blueGrey.shade800,
        ),
        scaffoldBackgroundColor: const Color(0xFFF8F9FA),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Color(0xFF263238),
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: const TaskScreen(),
    );
  }
}

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  // Estructura de datos avanzada
  final Map<int, Map<String, dynamic>> _tareas = {};
  final _formKey = GlobalKey<FormState>();
  final _taskController = TextEditingController();
  
  int _nextId = 1;
  String _prioritySelected = 'Media';

  final Map<String, Color> _priorityColors = {
    'Baja': Colors.green.shade400,
    'Media': Colors.amber.shade600,
    'Alta': Colors.red.shade600,
  };

  void _agregarTarea() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _tareas[_nextId] = {
          'name': _taskController.text.trim(),
          'isDone': false,
          'priority': _prioritySelected,
        };
        _nextId++;
      });
      _taskController.clear();
      _mostrarSnackbar("Tarea añadida", isError: false);
    }
  }

  void _toggleTarea(int id) {
    setState(() {
      _tareas[id]!['isDone'] = !_tareas[id]!['isDone'];
    });
  }

  void _eliminarTarea(int id) {
    setState(() => _tareas.remove(id));
    _mostrarSnackbar("Tarea eliminada", isError: true);
  }

  void _mostrarSnackbar(String msg, {required bool isError}) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        backgroundColor: isError ? Colors.redAccent : Colors.blueGrey.shade800,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.all(12),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Task Manager')),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10)],
            ),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: _taskController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xFFF1F3F4),
                      hintText: "¿Qué planeas hacer hoy?",
                      prefixIcon: const Icon(Icons.add_task_rounded),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    validator: (v) => v!.isEmpty ? "Escribe algo primero" : null,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      const Text("Prioridad:", style: TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(width: 8),
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: _priorityColors.keys.map((p) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: ChoiceChip(
                                  label: Text(p),
                                  selected: _prioritySelected == p,
                                  onSelected: (val) => setState(() => _prioritySelected = p),
                                  selectedColor: _priorityColors[p]!.withValues(alpha: 0.2),
                                  labelStyle: TextStyle(
                                    color: _prioritySelected == p ? _priorityColors[p] : Colors.grey,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      FloatingActionButton(
                        onPressed: _agregarTarea,
                        elevation: 0,
                        backgroundColor: Colors.blueGrey.shade800,
                        foregroundColor: Colors.white,
                        child: const Icon(Icons.send_rounded),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          
          // LISTA DE TAREAS
          Expanded(
            child: _tareas.isEmpty
                ? _buildEmptyState()
                : ListView.separated(
                    padding: const EdgeInsets.all(20),
                    itemCount: _tareas.length,
                    separatorBuilder: (_, _) => const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      final id = _tareas.keys.elementAt(index);
                      final tarea = _tareas[id]!;
                      final isDone = tarea['isDone'];

                      return AnimatedOpacity(
                        duration: const Duration(milliseconds: 200),
                        opacity: isDone ? 0.6 : 1.0,
                        child: Card(
                          elevation: 0,
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                            side: BorderSide(
                              color: isDone ? Colors.transparent : _priorityColors[tarea['priority']]!.withValues(alpha: 0.5),
                              width: 1.5,
                            ),
                          ),
                          child: ListTile(
                            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            leading: Checkbox(
                              value: isDone,
                              activeColor: Colors.blueGrey,
                              onChanged: (_) => _toggleTarea(id),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                            ),
                            title: Text(
                              tarea['name'],
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                decoration: isDone ? TextDecoration.lineThrough : null,
                                color: isDone ? Colors.grey : Colors.blueGrey.shade900,
                              ),
                            ),
                            subtitle: Row(
                              children: [
                                Container(
                                  width: 8,
                                  height: 8,
                                  decoration: BoxDecoration(
                                    color: _priorityColors[tarea['priority']],
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                const SizedBox(width: 6),
                                Text(tarea['priority'], style: const TextStyle(fontSize: 12)),
                              ],
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete_outline_rounded, color: Colors.redAccent),
                              onPressed: () => _eliminarTarea(id),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.auto_awesome_motion_rounded, size: 80, color: Colors.blueGrey.withValues(alpha: 0.2)),
          const SizedBox(height: 16),
          const Text("Tu lista está impecable", style: TextStyle(fontSize: 18, color: Colors.grey)),
        ],
      ),
    );
  }
}
