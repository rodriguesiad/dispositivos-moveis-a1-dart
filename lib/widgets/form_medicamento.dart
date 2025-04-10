import 'package:flutter/material.dart';
import '../models/medicamento.dart';

class FormCompras extends StatefulWidget {
  final Medicamento? medicamentoInicial;

  const FormCompras({super.key, this.medicamentoInicial});

  @override
  State<FormCompras> createState() => _FormComprasState();
}

class _FormComprasState extends State<FormCompras> {
  late TextEditingController campoNome;
  late TextEditingController campoHorario;
  late TextEditingController campoQuantidade;

  @override
  void initState() {
    super.initState();
    campoNome = TextEditingController(
      text:
          widget.medicamentoInicial != null
              ? widget.medicamentoInicial!.nome
              : '',
    );
    campoHorario = TextEditingController(
      text:
          widget.medicamentoInicial != null
              ? widget.medicamentoInicial!.horario
              : '',
    );
    campoQuantidade = TextEditingController(
      text:
          widget.medicamentoInicial != null
              ? widget.medicamentoInicial!.quantidade
              : '',
    );
  }

  @override
  void dispose() {
    campoNome.dispose();
    campoHorario.dispose();
    campoQuantidade.dispose();
    super.dispose();
  }

  void _salvarMedicamento() {
    final String nome = campoNome.text;
    final String horario = campoHorario.text;
    final String quantidade = campoQuantidade.text;

    if (nome.isNotEmpty && horario.isNotEmpty && quantidade.isNotEmpty) {
      final String id = widget.medicamentoInicial?.id ?? '';
      final medicamento = Medicamento(id, nome, horario, quantidade);

      Navigator.pop(context, medicamento);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Preencha todos os campos corretamente")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: campoNome,
            decoration: const InputDecoration(
              labelText: 'Nome do Medicamento',
              hintText: "Escreva o nome do medicamento...",
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: campoHorario,
            decoration: const InputDecoration(
              labelText: 'Horário do Medicamento',
              hintText: "Escreva o horário do medicamento...",
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: campoQuantidade,
            decoration: const InputDecoration(
              labelText: 'Quantidade de Medicamento',
              hintText: "Escreva a quantidade de medicamento...",
            ),
            keyboardType: TextInputType.numberWithOptions(decimal: true),
          ),
        ),
        ElevatedButton(
          onPressed: _salvarMedicamento,
          child: const Text('SALVAR'),
        ),
      ],
    );
  }
}
