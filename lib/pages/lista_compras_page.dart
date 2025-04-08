import 'package:flutter/material.dart';
import '../models/produto.dart';
import 'formulario_page.dart';
import '../widgets/lista_compras.dart';
import '../widgets/campo_busca.dart';

class ListaComprasPage extends StatefulWidget {
  const ListaComprasPage({super.key});

  @override
  State<ListaComprasPage> createState() => _ListaComprasPageState();
}

class _ListaComprasPageState extends State<ListaComprasPage> {
  final List<Produto> listaProdutos = [];
  String termoBusca = '';

  List<Produto> get produtosFiltrados {
    if (termoBusca.isEmpty) return listaProdutos;
    return listaProdutos
        .where((p) => p.nome.toLowerCase().contains(termoBusca.toLowerCase()))
        .toList();
  }

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
      body:
          listaProdutos.isEmpty
              ? const Center(
                child: Text(
                  'Nenhum produto cadastrado.\nClique no botão "+" para adicionar.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                ),
              )
              : Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CampoBusca(
                      textoAtual: termoBusca,
                      aoDigitar: (valor) {
                        setState(() {
                          termoBusca = valor;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: ListaCompras(
                      produtos: produtosFiltrados,
                      onEditar: (index) async {
                        final Produto? produtoEditado = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => FormularioPage(
                                  produtoExistente: produtosFiltrados[index],
                                ),
                          ),
                        );

                        if (produtoEditado != null) {
                          final int originalIndex = listaProdutos.indexOf(
                            produtosFiltrados[index],
                          );
                          setState(() {
                            listaProdutos[originalIndex] = produtoEditado;
                          });
                        }
                      },
                      onExcluir: (index) {
                        final int originalIndex = listaProdutos.indexOf(
                          produtosFiltrados[index],
                        );
                        setState(() {
                          listaProdutos.removeAt(originalIndex);
                        });
                      },
                    ),
                  ),
                ],
              ),
      floatingActionButton: FloatingActionButton(
        onPressed: _adicionarProduto,
        child: const Icon(Icons.add),
      ),
    );
  }
}
