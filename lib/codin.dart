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
            ),
          ],
        ),
      ),
    );
  }

  Widget _socialIcon(IconData icon) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Icon(icon, color: Colors.white),
    );
  }
}