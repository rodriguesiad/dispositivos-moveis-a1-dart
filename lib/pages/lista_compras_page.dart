import 'package:flutter/material.dart';
import '../models/produto.dart';
import 'formulario_page.dart';
import '../widgets/lista_compras.dart';

class ListaComprasPage extends StatefulWidget {
  const ListaComprasPage({super.key});

  @override
  State<ListaComprasPage> createState() => _ListaComprasPageState();
}

class _ListaComprasPageState extends State<ListaComprasPage> {
  final List<Produto> listaProdutos = [];

  void _adicionarProduto() async {
    final Produto? produtoRecebido = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const FormularioPage()),
    );

    if (produtoRecebido != null) {
      setState(() {
        listaProdutos.add(produtoRecebido);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de Compras"),
        backgroundColor: Colors.blue,
      ),
      body: ListaCompras(
        produtos: listaProdutos,
        onEditar: (index) async {
          final Produto? produtoEditado = await Navigator.push(
            context,
            MaterialPageRoute(
              builder:
                  (context) =>
                      FormularioPage(produtoExistente: listaProdutos[index]),
            ),
          );

          if (produtoEditado != null) {
            setState(() {
              listaProdutos[index] = produtoEditado;
            });
          }
        },
        onExcluir: (index) {
          setState(() {
            listaProdutos.removeAt(index);
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _adicionarProduto,
        child: const Icon(Icons.add),
      ),
    );
  }
}
