import 'package:flutter/material.dart';

class PaginaCodin extends StatefulWidget {
<<<<<<< HEAD
  const PaginaCodin({Key? key}) : super(key: key);

  @override
  State<PaginaCodin> createState() => _PaginaCodinState();
=======
  @override
  _PaginaCodinState createState() => _PaginaCodinState();
>>>>>>> e3e204cbcac2ca936196421256113456072b7c8c
}

class _PaginaCodinState extends State<PaginaCodin> {
  bool menuAberto = false;
<<<<<<< HEAD
  final List<TextEditingController> _codeControllers =
      List.generate(6, (_) => TextEditingController());
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
    for (final c in _codeControllers) {
      c.dispose();
    }
    super.dispose();
  }

  void _confirmar() {
    // Aqui você pode validar o código ou fazer qualquer lógica
    Navigator.pushNamed(context, '/redefinir');
  }

  @override
  Widget build(BuildContext context) {
    final logo = 'assets/logo.site.tcc.png';
    final sonic = 'assets/sonic.png';
    final esquerda = 'assets/esquerda.png';

    return Scaffold(
      backgroundColor: const Color(0xFFE9E9E9),
      appBar: AppBar(
        backgroundColor: const Color(0xFF90017F),
        elevation: 0,
        title: Image.asset(logo, height: 38),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
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
                    decoration: const BoxDecoration(
                      color: Color(0xFF90017F),
                    ),
                    child: Image.asset(logo),
                  ),
                  ListTile(
                    leading: const Icon(Icons.home),
                    title: const Text('Início'),
                    onTap: () => Navigator.pushNamed(context, '/Index'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.videogame_asset),
                    title: const Text('Games'),
                    onTap: () => Navigator.pushNamed(context, '/'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.help),
                    title: const Text('Sobre'),
                    onTap: () => Navigator.pushNamed(context, '/Que'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.headset_mic),
                    title: const Text('Suporte'),
                    onTap: () => Navigator.pushNamed(context, '/Suporte'),
                  ),
                ],
              ),
            )
          : null,
      body: SingleChildScrollView(
        child: Column(
          children: [
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
                    onPressed: () => Navigator.pushNamed(context, '/Login'),
                    child: const Text("Login"),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pushNamed(context, '/Cadastro'),
                    child: const Text("Registre-se"),
                  ),
                ],
              ),
            ),
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
                        'Coloque o código enviado para sua conta de Email:',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(sonic, height: 60),
                          const SizedBox(width: 18),
                          Expanded(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: List.generate(6, (i) {
                                    return Container(
                                      width: 38,
                                      margin: const EdgeInsets.symmetric(horizontal: 3),
                                      child: TextField(
                                        controller: _codeControllers[i],
                                        maxLength: 1,
                                        textAlign: TextAlign.center,
                                        keyboardType: TextInputType.text,
                                        decoration: InputDecoration(
                                          counterText: '',
                                          border: OutlineInputBorder(),
                                          isDense: true,
                                          contentPadding: const EdgeInsets.symmetric(vertical: 10),
                                        ),
                                      ),
                                    );
                                  }),
                                ),
                                const SizedBox(height: 14),
                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFF90017F),
                                    ),
                                    onPressed: _confirmar,
                                    child: const Text('CONFIRMAR', style: TextStyle(color: Colors.white)),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text('Lembrou a senha? '),
                                    InkWell(
                                      onTap: () => Navigator.pushNamed(context, '/Login'),
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
                          const SizedBox(width: 18),
                          Image.asset(sonic, height: 60),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: GestureDetector(
                          onTap: () => Navigator.pushNamed(context, '/MandarEmail'),
                          child: Image.asset(esquerda, height: 36),
                        ),
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Cabeçalho
          Container(
            color: const Color(0xFF90017F),
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Logo
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/');
                        },
                        child: Image.asset(
                          'assets/logo.site.tcc.png', // Substitua pelo caminho correto
                          width: 120,
                        ),
                      ),
                      // Navegação
                      if (!menuAberto)
                        Row(
                          children: [
                            _navItem(Icons.home, "Início", '/Index'),
                            _navItem(Icons.gamepad, "Games", '/'),
                            _navItem(Icons.question_circle, "Sobre", '/Que'),
                            _navItem(Icons.headset, "Suporte", '/Suporte'),
                          ],
                        ),
                      // Hamburguer
                      IconButton(
                        icon: const Icon(Icons.menu, color: Colors.white),
                        onPressed: toggleMenu,
                      ),
                    ],
                  ),
                ),
                if (menuAberto)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _navItem(Icons.home, "Início", '/Index'),
                      _navItem(Icons.gamepad, "Games", '/'),
                      _navItem(Icons.question_circle, "Sobre", '/Que'),
                      _navItem(Icons.headset, "Suporte", '/Suporte'),
                    ],
                  ),
              ],
            ),
          ),
          // Main Content
          Expanded(
            child: Center(
              child: Container(
                width: 800,
                padding: const EdgeInsets.all(40),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Redefinir Senha",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Coloque o código enviado para sua conta de Email:",
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        6,
                        (index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: TextField(
                              textAlign: TextAlign.center,
                              maxLength: 1,
                              decoration: const InputDecoration(
                                counterText: '',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/RedefinirSenha');
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor:
                            const Color(0xFF780069), // Botão de envio
                      ),
                      child: const Text(
                        "CONFIRMAR",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/Login');
                      },
                      child: const Text("Lembrou a senha? Faça login"),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Footer
          Container(
            color: const Color(0xFF90017F),
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Game Legends é uma plataforma dedicada a jogos indie, fornecendo uma maneira fácil para desenvolvedores distribuírem seus jogos e para jogadores descobrirem novas experiências.",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _socialIcon(Icons.facebook),
                    _socialIcon(Icons.twitter),
                    _socialIcon(Icons.instagram),
                    _socialIcon(Icons.linkedin),
                  ],
                ),
                const SizedBox(height: 10),
                const Text(
                  "© gamelegends.com | Feito pelo time do Game Legends",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

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
              style: const TextStyle(color: Colors.white),
>>>>>>> e3e204cbcac2ca936196421256113456072b7c8c
            ),
          ],
        ),
      ),
    );
  }
<<<<<<< HEAD
=======

  Widget _socialIcon(IconData icon) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Icon(icon, color: Colors.white),
    );
  }
>>>>>>> e3e204cbcac2ca936196421256113456072b7c8c
}