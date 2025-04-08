import 'package:aula/models/produto.dart';
import 'package:flutter/material.dart';
import '../widgets/form_compras.dart';

class FormularioPage extends StatelessWidget {
  final Produto? produtoExistente;

  const FormularioPage({super.key, this.produtoExistente});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          produtoExistente == null ? "Adicionar Compras" : "Editar Produto",
          style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: FormCompras(produtoInicial: produtoExistente),
    );
  }
}
