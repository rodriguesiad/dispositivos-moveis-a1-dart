import 'package:aula/models/produto.dart';
import 'package:aula/widgets/item_lista_compras.dart';
import 'package:flutter/material.dart';

class ListaCompras extends StatelessWidget {
  final List<Produto> produtos;
  final void Function(int index) onEditar;

  const ListaCompras({
    super.key,
    required this.produtos,
    required this.onEditar,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: produtos.length,
      itemBuilder: (BuildContext context, int index) {
        return ItemListCompras(
          produto: produtos[index],
          onEditar: () => onEditar(index),
        );
      },
    );
  }
}
