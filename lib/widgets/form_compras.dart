import 'package:flutter/material.dart';
import '../models/produto.dart';

class FormCompras extends StatefulWidget {
  const FormCompras({super.key});

  @override
  State<FormCompras> createState() => _FormComprasState();
}

class _FormComprasState extends State<FormCompras> {
  final TextEditingController campoNome = TextEditingController();
  final TextEditingController campoValor = TextEditingController();

  @override
  void dispose() {
    campoNome.dispose();
    campoValor.dispose();
    super.dispose();
  }

  void _salvarProduto() {
    final String nome = campoNome.text;
    final double? valor = double.tryParse(campoValor.text);

    if (nome.isNotEmpty && valor != null) {
      final produto = Produto(nome, valor);
      Navigator.pop(context, produto);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Preencha todos os campos corretamente")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: campoNome,
            decoration: const InputDecoration(
              labelText: 'Nome do Produto',
              hintText: "Escreva o nome do produto...",
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: campoValor,
            decoration: const InputDecoration(
              labelText: 'Valor do Produto',
              hintText: "Escreva o valor do produto...",
            ),
            keyboardType: TextInputType.numberWithOptions(decimal: true),
          ),
        ),
        ElevatedButton(onPressed: _salvarProduto, child: const Text('SALVAR')),
      ],
    );
  }
}
