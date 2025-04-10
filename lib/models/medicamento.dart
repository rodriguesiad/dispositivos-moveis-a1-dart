class Medicamento {
  final String id;
  final String nome;
  final String horario;
  final String quantidade;

  const Medicamento(this.id, this.nome, this.horario, this.quantidade);

  factory Medicamento.fromJson(Map<String, dynamic> json) {
    return Medicamento(
      json['id'],
      json['nome'],
      json['horario'],
      json['quantidade']
    );
  }

  Map<String, dynamic> toJson() {
    return {'nome': nome, 'horario': horario, 'quantidade': quantidade};
  }
}
