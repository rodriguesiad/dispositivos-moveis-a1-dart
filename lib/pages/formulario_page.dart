import 'package:aula/models/medicamento.dart';
import 'package:flutter/material.dart';
import '../widgets/form_medicamento.dart';

class FormularioPage extends StatelessWidget {
  final Medicamento? medicamentoExistente;

  const FormularioPage({super.key, this.medicamentoExistente});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          medicamentoExistente == null
              ? "Adicionar Medicamento"
              : "Editar Medicamento",
          style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: FormCompras(medicamentoInicial: medicamentoExistente),
    );
  }
}
