import 'package:flutter/material.dart';
import '../widgets/form_compras.dart';

class FormularioPage extends StatelessWidget {
  const FormularioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Adicionar Compras"),
        backgroundColor: Colors.blue,
      ),
      body: const FormCompras(),
    );
  }
}
