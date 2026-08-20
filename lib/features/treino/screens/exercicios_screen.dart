import 'package:flutter/material.dart';
import '../models/exercicio.dart';

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
    return Scaffold(
      appBar: AppBar(title: const Text('Exercícios')),
      body: ListView.builder(
        itemCount: exerciciosMock.length,
        itemBuilder: (context, index) {
          final exercicio = exerciciosMock[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              leading: const Icon(Icons.fitness_center),
              title: Text(exercicio.nome),
              subtitle: Text('${exercicio.grupoMuscular} • ${exercicio.equipamento}'),
            ),
          );
        },
      ),
    );
  }
}