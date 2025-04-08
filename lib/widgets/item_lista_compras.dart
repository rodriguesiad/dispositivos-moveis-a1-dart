import 'package:aula/models/produto.dart';
import 'package:flutter/material.dart';

class ItemListCompras extends StatelessWidget {
  final Produto produto;

  const ItemListCompras({super.key, required this.produto});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.crisis_alert),
        title: Text(produto.nome),
        subtitle: Text('R\$ ${produto.valor.toStringAsFixed(2)}'),
      ),
    );
  }
}
