import 'package:flutter/material.dart';
import '../models/produto.dart';
import 'item_lista_compras.dart';

class ListaCompras extends StatelessWidget {
  final List<Produto> produtos;
  final void Function(int index) onEditar;
  final void Function(int index) onExcluir;

  const ListaCompras({
    super.key,
    required this.produtos,
    required this.onEditar,
    required this.onExcluir,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: produtos.length,
      itemBuilder: (BuildContext context, int index) {
        return ItemListCompras(
          produto: produtos[index],
          onEditar: () => onEditar(index),
          onExcluir: () => onExcluir(index),
        );
      },
    );
  }
}