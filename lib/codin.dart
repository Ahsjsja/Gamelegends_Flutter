import 'package:flutter/material.dart';

class PaginaCodin extends StatefulWidget {
  @override
  _PaginaCodinState createState() => _PaginaCodinState();
}

class _PaginaCodinState extends State<PaginaCodin> {
  bool menuAberto = false;

  void toggleMenu() {
    setState(() {
      menuAberto = !menuAberto;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Cabeçalho...
          _navItem(Icons.home, 'Início', '/inicio'),
          _navItem(Icons.info, 'Sobre', '/sobre'),
          // Adicione outros itens conforme necessário
        ],
      ),
    );
  }

  // Corrigido: _navItem com ícones válidos e navegação correta
  Widget _navItem(IconData icon, String label, String route) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          color: const Color(0xFF780069),
          borderRadius: BorderRadius.circular(5),
        ),
child: Row(
          children: [
            Icon(icon, color: Colors.white),
            const SizedBox(width: 8),
            Text( 
              label,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}