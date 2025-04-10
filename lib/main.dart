import 'package:aula/pages/lista_medicamentos_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ListaMedicamentosApp());
}

class ListaMedicamentosApp extends StatelessWidget {
  const ListaMedicamentosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Medicamentos a Tomar',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: const ListaMedicamentosPage(),
    );
  }
}
