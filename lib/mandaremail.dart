import 'package:flutter/material.dart';

class PaginaMandarEmail extends StatefulWidget {
<<<<<<< HEAD
  const PaginaMandarEmail({Key? key}) : super(key: key);

  @override
  State<PaginaMandarEmail> createState() => _PaginaMandarEmailState();
=======
  @override
  _PaginaMandarEmailState createState() => _PaginaMandarEmailState();
>>>>>>> e3e204cbcac2ca936196421256113456072b7c8c
}

class _PaginaMandarEmailState extends State<PaginaMandarEmail> {
  bool menuAberto = false;
<<<<<<< HEAD
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
=======
>>>>>>> e3e204cbcac2ca936196421256113456072b7c8c

  void toggleMenu() {
    setState(() {
      menuAberto = !menuAberto;
    });
  }

  @override
<<<<<<< HEAD
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _mandarEmail() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushNamed(context, '/codin');
    }
  }

  @override
  Widget build(BuildContext context) {
    final logo = 'assets/logo.site.tcc.png';
    final viva = 'assets/viva.png';

    return Scaffold(
      backgroundColor: const Color(0xFFE9E9E9),
      appBar: AppBar(
        backgroundColor: const Color(0xFF90017F),
        elevation: 0,
        title: Image.asset(logo, height: 38),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
=======
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF90017F),
        title: Image.asset('assets/logo.site.tcc.png', width: 120),
        actions: [
          IconButton(
            icon: Icon(menuAberto ? Icons.close : Icons.menu),
>>>>>>> e3e204cbcac2ca936196421256113456072b7c8c
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
<<<<<<< HEAD
                    decoration: const BoxDecoration(
                      color: Color(0xFF90017F),
                    ),
                    child: Image.asset(logo),
                  ),
                  ListTile(
                    leading: const Icon(Icons.home),
                    title: const Text('Início'),
                    onTap: () => Navigator.pushNamed(context, '/'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.videogame_asset),
                    title: const Text('Games'),
                    onTap: () => Navigator.pushNamed(context, '/index'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.help),
                    title: const Text('Sobre'),
                    onTap: () => Navigator.pushNamed(context, '/que'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.headset_mic),
                    title: const Text('Suporte'),
                    onTap: () => Navigator.pushNamed(context, '/suporte'),
=======
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
>>>>>>> e3e204cbcac2ca936196421256113456072b7c8c
                  ),
                ],
              ),
            )
          : null,
      body: SingleChildScrollView(
        child: Column(
          children: [
<<<<<<< HEAD
            // Search bar + user panel
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
                        hintText: "Pesquisar Jogos, Tags ou Criadores",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.search),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  TextButton(
                    onPressed: () => Navigator.pushNamed(context, '/login'),
                    child: const Text("Login"),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pushNamed(context, '/cadastro'),
                    child: const Text("Registre-se"),
=======
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
>>>>>>> e3e204cbcac2ca936196421256113456072b7c8c
                  ),
                ],
              ),
            ),
<<<<<<< HEAD
            // Main content
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 0),
              child: Center(
                child: Container(
                  width: 480,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 12,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
                  child: Column(
                    children: [
                      const Text(
                        'Redefinir Senha',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF90017F),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Para redefinir sua senha, coloque seu Email:',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(viva, height: 60),
                          const SizedBox(width: 18),
                          Expanded(
                            child: Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  TextFormField(
                                    controller: _emailController,
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                      hintText: "Email",
                                      border: OutlineInputBorder(),
                                      isDense: true,
                                      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Digite o email';
                                      }
                                      if (!RegExp(r"^[^@]+@[^@]+\.[^@]+").hasMatch(value)) {
                                        return 'Email inválido';
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(height: 14),
                                  SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color(0xFF90017F),
                                      ),
                                      onPressed: _mandarEmail,
                                      child: const Text('MANDE EMAIL', style: TextStyle(color: Colors.white)),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text('Lembrou a senha? '),
                                      InkWell(
                                        onTap: () => Navigator.pushNamed(context, '/login'),
                                        child: const Text(
                                          'Faça login',
                                          style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 18),
                          Image.asset(viva, height: 60),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Footer
            Container(
              color: const Color(0xFF90017F),
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 0),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1200),
                  child: Wrap(
                    runSpacing: 24,
                    spacing: 50,
                    children: [
                      // Sobre
                      SizedBox(
                        width: 350,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Game",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(text: "Legends"),
                                ],
                              ),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 26,
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              "Game Legends é uma plataforma dedicada a jogos indie, fornecendo uma maneira fácil para desenvolvedores distribuírem seus jogos e para jogadores descobrirem novas experiências.",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Row(
                              children: const [
                                Icon(Icons.phone, color: Colors.white70, size: 18),
                                SizedBox(width: 6),
                                Text(
                                  "(99) 99999-9999",
                                  style: TextStyle(color: Colors.white70),
                                ),
                                SizedBox(width: 18),
                                Icon(Icons.email, color: Colors.white70, size: 18),
                                SizedBox(width: 6),
                                Text(
                                  "info@gamelegends.com",
                                  style: TextStyle(color: Colors.white70),
                                ),
                              ],
                            ),
                            const SizedBox(height: 18),
                            Row(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.facebook, color: Colors.white),
                                  onPressed: () {},
                                ),
                                IconButton(
                                  icon: const Icon(Icons.camera_alt, color: Colors.white),
                                  onPressed: () {},
                                ),
                                IconButton(
                                  icon: const Icon(Icons.alternate_email, color: Colors.white),
                                  onPressed: () {},
                                ),
                                IconButton(
                                  icon: const Icon(Icons.business, color: Colors.white),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      // Links rápidos
                      SizedBox(
                        width: 220,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Links Rápidos",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18)),
                            const SizedBox(height: 10),
                            ...[
                              "Eventos",
                              "Equipe",
                              "Missão",
                              "Serviços",
                              "Afiliados"
                            ].map((txt) => Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 2),
                                  child: InkWell(
                                    onTap: () {},
                                    child: Text(
                                      txt,
                                      style: const TextStyle(
                                          color: Colors.white70, fontSize: 15),
                                    ),
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              color: const Color(0xFF90017F),
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: const Center(
                child: Text(
                  "© gamelegends.com | Feito pelo time do Game Legends",
                  style: TextStyle(color: Colors.white70),
                ),
              ),
=======
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
>>>>>>> e3e204cbcac2ca936196421256113456072b7c8c
            ),
          ],
        ),
      ),
    );
  }
}