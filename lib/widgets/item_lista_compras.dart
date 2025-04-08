import 'package:flutter/material.dart';
import '../models/produto.dart';

class ItemListCompras extends StatelessWidget {
  final Produto produto;
  final VoidCallback onEditar;
  final VoidCallback onExcluir;

  const ItemListCompras({
    super.key,
    required this.produto,
    required this.onEditar,
    required this.onExcluir,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.shopping_cart),
        title: Text(produto.nome),
        subtitle: Text('R\$ ${produto.valor.toStringAsFixed(2)}'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: onEditar,
            ),
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: onExcluir,
            ),
          ],
        ),
      ),
    );
  }
}