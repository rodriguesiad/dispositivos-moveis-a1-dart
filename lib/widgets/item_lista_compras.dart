import 'package:aula/models/produto.dart';
import 'package:flutter/material.dart';

class ItemListCompras extends StatelessWidget {
  final Produto produto;
  final VoidCallback onEditar;

  const ItemListCompras({
    super.key,
    required this.produto,
    required this.onEditar,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.shopping_cart),
        title: Text(produto.nome),
        subtitle: Text('R\$ ${produto.valor.toStringAsFixed(2)}'),
        trailing: IconButton(
          icon: const Icon(Icons.edit),
          onPressed: onEditar,
        ),
      ),
    );
  }
}
