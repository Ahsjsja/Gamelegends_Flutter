import 'package:flutter/material.dart';

class PaginaSobre extends StatelessWidget {
  const PaginaSobre({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sobre')),
      body: const Center(child: Text('Página Sobre')),
    );
  }
}