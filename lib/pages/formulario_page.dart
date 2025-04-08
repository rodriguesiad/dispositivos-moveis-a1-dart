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
        title: Text(produtoExistente == null ? "Adicionar Compras" : "Editar Produto"),
        backgroundColor: Colors.blue,
      ),
      body: FormCompras(produtoInicial: produtoExistente),
    );
  }
}
