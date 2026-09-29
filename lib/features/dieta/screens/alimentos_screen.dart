import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/alimento.dart';
import 'dart:convert';


class AlimentosScreen extends StatelessWidget {
  AlimentosScreen({super.key});

  @override
  Widget build(BuildContext context) {

    Future<List<Alimento>> buscarAlimentos() async {
      final response = await http.get(
        Uri.parse('http://10.0.2.2:8000/alimentos/'),
        headers: {'Accept': 'application/json'},
      );

      if (response.statusCode == 200) {
        final alimentosConvertidos = jsonDecode(response.body) as List;
        final List<Alimento> alimentos = alimentosConvertidos.map((item) => Alimento.fromJson(item)).toList();
        return alimentos;
      } else {
        throw Exception("Erro ao buscar o dado");
      }
    }


    return Scaffold(
      appBar: AppBar(title: const Text('Alimentos')),
      body: FutureBuilder<List<Alimento>>(
        future: buscarAlimentos(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("Erro: ${snapshot.error}");
          } else if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final alimento = snapshot.data![index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  child: ListTile(
                    leading: const Icon(Icons.fitness_center),
                    title: Text(alimento.nome),
                    subtitle: Text('${alimento.calorias} • ${alimento.carboidrato} • ${alimento.gordura} • ${alimento.proteina}'),
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