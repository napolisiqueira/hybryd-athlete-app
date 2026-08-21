class Exercicio {
  final String nome;
  final String grupoMuscular;
  final String equipamento;

  Exercicio({
    required this.nome,
    required this.grupoMuscular,
    required this.equipamento,
  });

  factory fromJson(Map<String, dynamic> json) {
    return Exercicio(
      nome: json["nome"] as String,
      grupoMuscular: json["grupo_muscular"] as String,
      equipamento: json["equipamento"] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "nome": nome,
      "grupo_muscular": grupoMuscular,
      "equipamento": equipamento,
    };
  }
}

