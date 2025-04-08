import 'package:aula/formulario.dart';
import 'package:aula/produto.dart';
import 'package:flutter/material.dart';

class ListaComprasApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: ListaComprasScaffold());
  }
}

class ListaComprasScaffoldState extends State<ListaComprasScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Compras"),
        backgroundColor: Colors.blue,
      ),
      body: ListaCompras(widget.listaProdutos),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final Future future = Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return FormularioComprasScaffold();
              },
            ),
          );

          future.then((produtoRecebido) {
            setState(() {
              widget.listaProdutos.add(produtoRecebido);
            });
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class ListaComprasScaffold extends StatefulWidget {
  final List<Produto> listaProdutos = [];

  @override
  State<StatefulWidget> createState() {
    return ListaComprasScaffoldState();
  }
}

class ListaCompras extends StatelessWidget {
  final List<Produto> produtos;

  ListaCompras(this.produtos);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: produtos.length,
      itemBuilder: (BuildContext context, int index) {
        return ItemListCompras(produto: produtos[index]);
      },
    );
  }
}

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
