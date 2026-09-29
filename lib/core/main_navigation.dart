import 'package:flutter/material.dart';
import '../features/treino/screens/exercicios_screen.dart';
import '../features/dieta/screens/alimentos_screen.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _indiceSelecionado = 0;

  final List<Widget> _telas = [
    ExerciciosScreen(),
    AlimentosScreen(),
  ];

  void _aoTocarItem(int index) {
    setState(() {
      _indiceSelecionado = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _telas[_indiceSelecionado],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceSelecionado,
        onTap: _aoTocarItem,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center),
            label: 'Treino',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant),
            label: 'Dieta',
          ),
        ],
      ),
    );
  }
}