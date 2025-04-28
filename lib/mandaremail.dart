import 'package:flutter/material.dart';

class PaginaMandarEmail extends StatefulWidget {
  @override
  _PaginaMandarEmailState createState() => _PaginaMandarEmailState();
}

class _PaginaMandarEmailState extends State<PaginaMandarEmail> {
  bool menuAberto = false;

  void toggleMenu() {
    setState(() {
      menuAberto = !menuAberto;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF90017F),
        title: Image.asset('assets/logo.site.tcc.png', width: 120),
        actions: [
          IconButton(
            icon: Icon(menuAberto ? Icons.close : Icons.menu),
            onPressed: toggleMenu,
          ),
        ],
      ),
      drawer: menuAberto
          ? Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(
                    decoration: BoxDecoration(color: const Color(0xFF90017F)),
                    child: Text(
                      'Menu',
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.home),
                    title: Text('Início'),
                    onTap: () {
                      Navigator.pushNamed(context, '/Index');
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.videogame_asset),
                    title: Text('Games'),
                    onTap: () {
                      Navigator.pushNamed(context, '/');
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.question_mark),
                    title: Text('Sobre'),
                    onTap: () {
                      Navigator.pushNamed(context, '/Que');
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.headset),
                    title: Text('Suporte'),
                    onTap: () {
                      Navigator.pushNamed(context, '/Suporte');
                    },
                  ),
                ],
              ),
            )
          : null,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Text(
                    'Redefinir Senha',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Para redefinir sua senha, coloque seu Email:',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset('assets/viva.png', width: 150),
                      Expanded(
                        child: Column(
                          children: [
                            TextField(
                              decoration: InputDecoration(
                                labelText: 'Email',
                                border: OutlineInputBorder(),
                              ),
                              keyboardType: TextInputType.emailAddress,
                            ),
                            SizedBox(height: 10),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/MandarCodin');
                              },
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 10,
                                ),
                                backgroundColor: Colors.purple,
                              ),
                              child: Text(
                                'MANDE EMAIL',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/Login');
                              },
                              child: Text('Lembrou a senha? Faça login'),
                            ),
                          ],
                        ),
                      ),
                      Image.asset('assets/viva.png', width: 150),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: const Color(0xFF90017F),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Game Legends é uma plataforma dedicada a jogos indie, fornecendo uma maneira fácil para desenvolvedores distribuírem seus jogos e para jogadores descobrirem novas experiências.',
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              'Contato: (99) 99999-9999 | info@gamelegends.com',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.facebook, color: Colors.white),
                SizedBox(width: 10),
                Icon(Icons.twitter, color: Colors.white),
                SizedBox(width: 10),
                Icon(Icons.instagram, color: Colors.white),
                SizedBox(width: 10),
                Icon(Icons.linkedin, color: Colors.white),
              ],
            ),
          ],
        ),
      ),
    );
  }
}