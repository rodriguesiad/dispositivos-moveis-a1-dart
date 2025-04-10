import 'package:flutter/material.dart';
import '../models/medicamento.dart';
import 'formulario_page.dart';
import '../widgets/lista_medicamentos.dart';
import '../widgets/campo_busca.dart';

class ListaMedicamentosPage extends StatefulWidget {
  const ListaMedicamentosPage({super.key});

  @override
  State<ListaMedicamentosPage> createState() => _ListaMedicamentosPageState();
}

class _ListaMedicamentosPageState extends State<ListaMedicamentosPage> {
  final List<Medicamento> listaMedicamentos = [];
  String termoBusca = '';

  List<Medicamento> get medicamentosFiltrados {
    if (termoBusca.isEmpty) return listaMedicamentos;
    return listaMedicamentos
        .where((p) => p.nome.toLowerCase().contains(termoBusca.toLowerCase()))
        .toList();
  }

  void _adicionarMedicamento() async {
    final Medicamento? medicamentoRecebido = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const FormularioPage()),
    );

    if (medicamentoRecebido != null) {
      setState(() {
        listaMedicamentos.add(medicamentoRecebido);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        title: const Text(
          "Lista de Medicamentos a Tomar",
          style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
        ),
      ),
      body:
          listaMedicamentos.isEmpty
              ? const Center(
                child: Text(
                  'Nenhum medicamento cadastrado.\nClique no botão "+" para adicionar.',
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
                      medicamentos: medicamentosFiltrados,
                      onEditar: (index) async {
                        final Medicamento? medicamentoEditado =
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) => FormularioPage(
                                      medicamentoExistente:
                                          medicamentosFiltrados[index],
                                    ),
                              ),
                            );

                        if (medicamentoEditado != null) {
                          final int originalIndex = listaMedicamentos.indexOf(
                            medicamentosFiltrados[index],
                          );
                          setState(() {
                            listaMedicamentos[originalIndex] =
                                medicamentoEditado;
                          });
                        }
                      },
                      onExcluir: (index) {
                        final int originalIndex = listaMedicamentos.indexOf(
                          medicamentosFiltrados[index],
                        );
                        setState(() {
                          listaMedicamentos.removeAt(originalIndex);
                        });
                      },
                    ),
                  ),
                ],
              ),
      floatingActionButton: FloatingActionButton(
        onPressed: _adicionarMedicamento,
        child: const Icon(Icons.add),
      ),
    );
  }
}
