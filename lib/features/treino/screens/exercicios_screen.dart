import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/exercicio.dart';
import 'dart:convert';


class ExerciciosScreen extends StatelessWidget {
  ExerciciosScreen({super.key});

  final List<Exercicio> exerciciosMock = [
    Exercicio(nome: 'Supino Reto', grupoMuscular: 'Peito', equipamento: 'Barra'),
    Exercicio(nome: 'Agachamento', grupoMuscular: 'Pernas', equipamento: 'Barra'),
    Exercicio(nome: 'Puxada Alta', grupoMuscular: 'Costas', equipamento: 'Cabo'),
    Exercicio(nome: 'Rosca Direta', grupoMuscular: 'Bíceps', equipamento: 'Halteres'),
  ];

  @override
  Widget build(BuildContext context) {

  Future<List> buscarExercicios() async {
    final response = await http.get(
      Uri.parse('http://10.0.2.2:8000/exercicios/'),
      headers: {'Accept': 'application/json'},
    );

    if (response.statusCode == 200) {
      final exerciciosConvertidos = jsonDecode(response.body) as List;
      final List<Exercicio> exercicios = exerciciosConvertidos.map((item) => Exercicio.fromJson(item)).toList();
      return exercicios;
    } else {
      throw Exception("Erro ao buscar o dado");
    }
  }


    return Scaffold(
      appBar: AppBar(title: const Text('Exercícios')),
      body: FutureBuilder<List<Exercicio>>(
        future: buscarExercicios(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("Erro: ${snapshot.error}");
          } else if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final exercicio = snapshot.data![index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  child: ListTile(
                    leading: const Icon(Icons.fitness_center),
                    title: Text(exercicio.nome),
                    subtitle: Text('${exercicio.grupoMuscular} • ${exercicio.equipamento}'),
                  ),
                );
              },
            );
          }
            return const CircularProgressIndicator();
        },
      ),
    );
  }
}