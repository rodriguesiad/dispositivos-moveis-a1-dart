import 'package:aula/pages/lista_compras_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ListaComprasApp());
}

class ListaComprasApp extends StatelessWidget {
  const ListaComprasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Compras',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: const ListaComprasPage(),
    );
  }
}
