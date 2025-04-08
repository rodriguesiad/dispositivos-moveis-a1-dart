import 'package:flutter/material.dart';

class CampoBusca extends StatelessWidget {
  final String textoAtual;
  final ValueChanged<String> aoDigitar;

  const CampoBusca({
    super.key,
    required this.textoAtual,
    required this.aoDigitar,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: const InputDecoration(
          labelText: 'Buscar produto',
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(),
        ),
        onChanged: aoDigitar,
      ),
    );
  }
}
