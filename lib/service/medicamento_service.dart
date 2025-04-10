import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/medicamento.dart';

class MedicamentoService {
  static const String baseUrl = 'https://67f7324c42d6c71cca6450cc.mockapi.io/api/pdm/medicamentos';

  Future<List<Medicamento>> getMedicamentos() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      List lista = json.decode(response.body);
      return lista.map((json) => Medicamento.fromJson(json)).toList();
    } else {
      throw Exception('Erro ao buscar medicamentos');
    }
  }

  Future<Medicamento> criarMedicamento(Medicamento medicamento) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(medicamento.toJson()),
    );

    if (response.statusCode == 201) {
      return Medicamento.fromJson(json.decode(response.body));
    } else {
      throw Exception('Erro ao criar medicamento');
    }
  }

  Future<void> atualizarMedicamento(Medicamento medicamento) async {
    final response = await http.put(
      Uri.parse('$baseUrl/${medicamento.id}'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(medicamento.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception('Erro ao atualizar medicamento');
    }
  }

  Future<void> deletarMedicamento(String id) async {
    final response = await http.delete(Uri.parse('$baseUrl/$id'));

    if (response.statusCode != 200) {
      throw Exception('Erro ao deletar medicamento');
    }
  }
}
