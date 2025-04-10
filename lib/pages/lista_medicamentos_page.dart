import 'package:aula/service/medicamento_service.dart';
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
  late Future<List<Medicamento>> _medicamentosFuture;
  final MedicamentoService _service = MedicamentoService();
  String termoBusca = '';

  @override
  void initState() {
    super.initState();
    _carregarMedicamentos();
  }

  void _carregarMedicamentos() {
    _medicamentosFuture = _service.getMedicamentos();
  }

  void _adicionarMedicamento() async {
    final Medicamento? novoMedicamento = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const FormularioPage()),
    );

    if (novoMedicamento != null) {
      await _service.criarMedicamento(novoMedicamento);
      _carregarMedicamentos();
      setState(() {});
    }
  }

  Widget _construirCorpo() {
    return FutureBuilder<List<Medicamento>>(
      future: _medicamentosFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          print('Erro ao carregar medicamentos: ${snapshot.error}');
          return Center(
            child: Text('Erro ao carregar medicamentos.'),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(
            child: Text(
              'Nenhum medicamento cadastrado.\nClique no botão "+" para adicionar.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
          );
        }

        final lista = snapshot.data!;
        final medicamentosFiltrados =
            termoBusca.isEmpty
                ? lista
                : lista
                    .where(
                      (p) => p.nome.toLowerCase().contains(
                        termoBusca.toLowerCase(),
                      ),
                    )
                    .toList();

        return _construirLista(medicamentosFiltrados);
      },
    );
  }

  Widget _construirLista(List<Medicamento> medicamentosFiltrados) {
    return Column(
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
              final Medicamento? medicamentoEditado = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => FormularioPage(
                        medicamentoExistente: medicamentosFiltrados[index],
                      ),
                ),
              );

              if (medicamentoEditado != null) {
                await _service.atualizarMedicamento(medicamentoEditado);
                _carregarMedicamentos();
                setState(() {});
              }
            },
            onExcluir: (index) async {
              await _service.deletarMedicamento(
                medicamentosFiltrados[index].id,
              );
              _carregarMedicamentos();
              setState(() {});
            },
          ),
        ),
      ],
    );
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
      body: _construirCorpo(),
      floatingActionButton: FloatingActionButton(
        onPressed: _adicionarMedicamento,
        child: const Icon(Icons.add),
      ),
    );
  }
}
