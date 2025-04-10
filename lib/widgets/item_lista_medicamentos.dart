import 'package:flutter/material.dart';
import '../models/medicamento.dart';

class ItemListMedicamentos extends StatelessWidget {
  final Medicamento medicamento;
  final VoidCallback onEditar;
  final VoidCallback onExcluir;

  const ItemListMedicamentos({
    super.key,
    required this.medicamento,
    required this.onEditar,
    required this.onExcluir,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.medication),
        title: Text(medicamento.nome),
        subtitle: Text(
          'Horário: ${medicamento.horario} - Quantidade ${medicamento.quantidade}',
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(icon: const Icon(Icons.edit), onPressed: onEditar),
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
