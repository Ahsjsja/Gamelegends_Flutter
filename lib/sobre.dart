import 'package:flutter/material.dart';
import 'navbar.dart';

class PaginaSobre extends StatefulWidget {
  const PaginaSobre({Key? key}) : super(key: key);

  @override
  State<PaginaSobre> createState() => _PaginaSobreState();
}

class _PaginaSobreState extends State<PaginaSobre> {
  bool menuAberto = false;
  final TextEditingController _searchController = TextEditingController();
  Map<String, String> formData = {
    'email': "",
    'usuario': "", // "Cliente" ou "Desenvolvedor"
  };

  @override
  void initState() {
    super.initState();
    // Aqui você pode integrar com o seu sistema de autenticação real se quiser.
  }

  void toggleMenu() {
    setState(() {
      menuAberto = !menuAberto;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 900;

    return Scaffold(
      backgroundColor: const Color(0xFFE9E9E9),
      appBar: Navbar(
        searchController: _searchController,
        isMenuOpen: menuAberto,
        onMenuTap: toggleMenu,
      ),
      body: Stack(
        children: [
          ListView(
            children: [
              // Header visual (equivalente ao background com Pessoas.png)
              Container(
                height: 320,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/Pessoas.png'),
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                  ),
                ),
                alignment: Alignment.center,
                child: Container(
                  color: Colors.black.withOpacity(0.3),
                  padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 12),
                  child: Text(
                    'Quem Somos',
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              blurRadius: 8,
                              color: Colors.black38,
                              offset: Offset(1, 2),
                            ),
                          ],
                        ) ??
                        const TextStyle(fontSize: 36, color: Colors.white),
                  ),
                ),
              ),

              // Seções principais
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 0),
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 1000),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // QUEM SOMOS
                        Container(
                          margin: const EdgeInsets.only(bottom: 32),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 8,
                                spreadRadius: 1,
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 28),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'QUEM SOMOS?',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 26,
                                  color: Color(0xFF90017F),
                                ),
                              ),
                              SizedBox(height: 16),
                              Text(
                                'Somos a Game Legends, uma plataforma de jogos dedicada a promover a inclusão e o apoio aos desenvolvedores independentes, especialmente aqueles que estão começando a produzir seus primeiros jogos. Nosso objetivo é criar um ecossistema de jogos mais saudável, criativo e inclusivo, onde gamers e desenvolvedores possam se unir e colaborar.',
                                style: TextStyle(fontSize: 17, color: Colors.black87, height: 1.4),
                              ),
                            ],
                          ),
                        ),
                        // O QUE FAZEMOS
                        Container(
                          margin: const EdgeInsets.only(bottom: 32),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 8,
                                spreadRadius: 1,
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 28),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'O QUE FAZEMOS?',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 26,
                                  color: Color(0xFF90017F),
                                ),
                              ),
                              SizedBox(height: 16),
                              Text(
                                'Nós oferecemos uma plataforma onde desenvolvedores de jogos podem receber apoio financeiro diretamente de jogadores através de doações. Utilizamos tecnologias avançadas, como sistemas de pagamento integrados e inteligência artificial, para facilitar transações e personalizar recomendações de jogos. Isso não só ajuda a financiar e lançar novos jogos, mas também promove a diversidade e a inovação na indústria de games. Além disso, criamos uma comunidade onde jogadores podem se conectar com desenvolvedores, trocar ideias e contribuir para o sucesso de novos projetos.',
                                style: TextStyle(fontSize: 17, color: Colors.black87, height: 1.4),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // === Footer IDÊNTICO AO SUPORTE ===
              Container(
                color: const Color(0xFF90017F),
                padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 600),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // GameLegends
                        const Text(
                          "GameLegends",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Descrição
                        const Text(
                          "Game Legends é uma plataforma dedicada a jogos indie, fornecendo uma maneira fácil para desenvolvedores distribuírem seus jogos e para jogadores descobrirem novas experiências.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Contatos
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.phone, color: Colors.white70, size: 18),
                            SizedBox(width: 6),
                            Text(
                              "(99) 99999-9999",
                              style: TextStyle(color: Colors.white70),
                            ),
                            SizedBox(width: 16),
                            Icon(Icons.email, color: Colors.white70, size: 18),
                            SizedBox(width: 6),
                            Text(
                              "info@gamelegends.com",
                              style: TextStyle(color: Colors.white70),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),

                        // Divisor
                        Container(
                          height: 1,
                          color: Colors.white.withOpacity(0.3),
                          margin: const EdgeInsets.symmetric(horizontal: 40),
                        ),
                        const SizedBox(height: 24),

                        // Links Rápidos
                        const Text(
                          "Links Rápidos",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12),

                        Column(
                          children: [
                            "Eventos",
                            "Equipe",
                            "Missão",
                            "Serviços",
                            "Afiliados"
                          ].map((txt) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: Text(
                              txt,
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 15,
                              ),
                            ),
                          )).toList(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // Rodapé inferior idêntico
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
              ),
            ],
          ),
          // Menu mobile overlay
          if (!isWide && menuAberto)
            NavbarMobileMenu(
              closeMenu: () => setState(() => menuAberto = false),
              searchController: _searchController,
            ),
        ],
      ),
    );
  }
}