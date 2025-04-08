import 'package:aula/produto.dart';
import 'package:flutter/material.dart';

class FormularioComprasScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Adicionar Compras"),
        backgroundColor: Colors.blue,
      ),
      body: FormCompras(),
    );
  }
}

class FormCompras extends StatelessWidget {
  final TextEditingController campoNome = TextEditingController();
  final TextEditingController campoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: campoNome,
            decoration: InputDecoration(
              labelText: 'Nome do Produto',
              hintText: "Escreva o nome do produto...",
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: campoValor,
            decoration: InputDecoration(
              labelText: 'Valor do Produto',
              hintText: "Escreva o valor do produto...",
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            String nome = campoNome.text;
            double valor = double.parse(campoValor.text);
            Produto produto = Produto(nome, valor);

            Navigator.pop(context, produto);
          },
          child: Text('SALVAR'),
        ),
      ],
    );
  }
}
