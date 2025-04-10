import 'package:flutter/material.dart';
import '../models/medicamento.dart';
import 'item_lista_medicamentos.dart';

class ListaCompras extends StatelessWidget {
  final List<Medicamento> medicamentos;
  final void Function(int index) onEditar;
  final void Function(int index) onExcluir;

  const ListaCompras({
    super.key,
    required this.medicamentos,
    required this.onEditar,
    required this.onExcluir,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: medicamentos.length,
      itemBuilder: (BuildContext context, int index) {
        return ItemListMedicamentos(
          medicamento: medicamentos[index],
          onEditar: () => onEditar(index),
          onExcluir: () => onExcluir(index),
        );
      },
    );
  }
}
