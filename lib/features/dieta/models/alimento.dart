class Alimento {
  final String nome;
  final double calorias;
  final double carboidrato;
  final double gordura;
  final double proteina;

  Alimento({
    required this.nome,
    required this.calorias,
    required this.carboidrato,
    required this.gordura,
    required this.proteina,
  });

  factory Alimento.fromJson(Map<String, dynamic> json) {
    return Alimento(
      nome: json["nome"] as String,
      calorias: (json["calorias"] as num?)?.toDouble() ?? 0.0,
      carboidrato: (json["carboidrato"] as num?)?.toDouble() ?? 0.0,
      gordura: (json["gordura"] as num?)?.toDouble() ?? 0.0,
      proteina: (json["proteina"] as num?)?.toDouble() ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "nome": nome,
      "calorias": calorias,
      "carboidratos": carboidrato,
      "gorduras": gordura,
      "proteinas": proteina,
    };
  }
}

