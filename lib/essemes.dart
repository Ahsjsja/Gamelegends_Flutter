import 'package:flutter/material.dart';
import 'navbar.dart';

// Lista dos jogos para a categoria "Esse mês" (imagens devem estar em assets e declaradas no pubspec.yaml)
final _esseMesGames = [
  {
    "img": "assets/lily.png",
    "name": "Paper Lily",
  },
  {
    "img": "assets/mirror.png",
    "name": "Pocket Mirror",
  },
  {
    "img": "assets/phenomenom.png",
    "name": "Cinderella Phenomenom",
  },
  {
    "img": "assets/wolf.png",
    "name": "Lonely Wolf Treat",
  },
  {
    "img": "assets/oneshot.png",
    "name": "OneShot",
  },
  {
    "img": "assets/coracao.png",
    "name": "Com o Coração",
  },
];

class EsseMesPage extends StatefulWidget {
  const EsseMesPage({Key? key}) : super(key: key);

  @override
  State<EsseMesPage> createState() => _EsseMesPageState();
}

class _EsseMesPageState extends State<EsseMesPage> {
  final TextEditingController _searchController = TextEditingController();
  bool menuAberto = false;
  bool isMobileOpen = false;
  Map<String, bool> isOpen = {
    'genero': true,
    'plataformas': true,
    'postagem': true,
    'status': true,
  };

  Map<String, String> formData = {
    'email': "",
    'usuario': "",
  };

  void toggleList(String section) {
    setState(() {
      isOpen[section] = !(isOpen[section] ?? false);
    });
  }

  void toggleMenu() {
    setState(() {
      menuAberto = !menuAberto;
    });
  }

  void toggleMobileMenu() {
    setState(() {
      isMobileOpen = !isMobileOpen;
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
          Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    // Barra lateral
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      width: isWide || isMobileOpen ? 260 : 0,
                      child: isWide || isMobileOpen
                          ? Drawer(
                              elevation: 0,
                              child: Container(
                                color: Colors.white,
                                child: ListView(
                                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
                                  children: [
                                    _buildSection(
                                      "Gênero",
                                      "genero",
                                      [
                                        _buildFilterLink(context, "Terror", Icons.sports_esports, "/terror"),
                                        _buildFilterLink(context, "Esporte", Icons.sports_esports, "/esporte"),
                                        _buildFilterLink(context, "Aventura", Icons.sports_esports, "/aventura"),
                                        _buildFilterLink(context, "Educacional", Icons.sports_esports, "/educacional"),
                                        _buildFilterLink(context, "Sobrevivência", Icons.sports_esports, "/sobrevivencia"),
                                        _buildFilterLink(context, "Jogo de cartas", Icons.sports_esports, "/cartas"),
                                      ],
                                    ),
                                    _buildSection(
                                      "Plataformas",
                                      "plataformas",
                                      [
                                        _buildFilterLink(context, "Windows", Icons.desktop_windows, "/windows"),
                                        _buildFilterLink(context, "Mac OS", Icons.laptop_mac, "/macOs"),
                                        _buildFilterLink(context, "Android", Icons.android, "/android"),
                                        _buildFilterLink(context, "iOS", Icons.phone_iphone, "/iOS"),
                                      ],
                                    ),
                                    _buildSection(
                                      "Postagem",
                                      "postagem",
                                      [
                                        _buildFilterLink(context, "Hoje", Icons.access_time, "/hoje"),
                                        _buildFilterLink(context, "Essa semana", Icons.access_time, "/essaSemana"),
                                        _buildFilterLink(context, "Esse mês", Icons.access_time, "/esseMes"),
                                      ],
                                    ),
                                    _buildSection(
                                      "Status",
                                      "status",
                                      [
                                        _buildFilterLink(context, "Desenvolvido", Icons.flash_on, "/desenvolvido"),
                                        _buildFilterLink(context, "Desenvolvendo", Icons.play_arrow, "/desenvolvendo"),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : null,
                    ),
                    // Botão hamburguer mobile lateral
                    if (!isWide)
                      Container(
                        alignment: Alignment.topLeft,
                        child: IconButton(
                          icon: Icon(isMobileOpen ? Icons.chevron_left : Icons.chevron_right),
                          onPressed: toggleMobileMenu,
                        ),
                      ),
                    // Lista de produtos/jogos
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 6),
                        child: GridView.builder(
                          padding: const EdgeInsets.all(10),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: isWide ? 4 : 2,
                            mainAxisSpacing: 16,
                            crossAxisSpacing: 16,
                            childAspectRatio: 0.8,
                          ),
                          itemCount: _esseMesGames.length,
                          itemBuilder: (context, index) {
                            final produto = _esseMesGames[index];
                            return _GameCard(
                              nome: produto['name']!,
                              imageAsset: produto['img']!,
                              onTap: () {
                                // Navegue para a descrição se desejar
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ],
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
              ),
            ],
          ),
          // Menu mobile overlay do topo
          if (!isWide && menuAberto)
            NavbarMobileMenu(
              closeMenu: () => setState(() => menuAberto = false),
              searchController: _searchController,
            ),
        ],
      ),
    );
  }

  Widget _buildSection(String title, String key, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: GestureDetector(
            onTap: () => toggleList(key),
            child: Row(
              children: [
                Icon(
                  isOpen[key]! ? Icons.expand_more : Icons.chevron_right,
                  size: 20,
                  color: const Color(0xFF90017F),
                ),
                const SizedBox(width: 4),
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF90017F)),
                ),
              ],
            ),
          ),
        ),
        if (isOpen[key]!)
          ...children.map((w) => Padding(
                padding: const EdgeInsets.only(left: 18, bottom: 8),
                child: w,
              )),
        const SizedBox(height: 12),
      ],
    );
  }

  Widget _buildFilterLink(BuildContext context, String label, IconData icon, String route) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, route),
      borderRadius: BorderRadius.circular(8),
      child: Row(
        children: [
          Icon(icon, color: Colors.black54, size: 18),
          const SizedBox(width: 8),
          Text(label, style: const TextStyle(fontSize: 15, color: Colors.black87)),
        ],
      ),
    );
  }
}

class _GameCard extends StatelessWidget {
  final String nome;
  final String imageAsset;
  final VoidCallback onTap;

  const _GameCard({
    required this.nome,
    required this.imageAsset,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(14)),
                child: Image.asset(
                  imageAsset,
                  fit: BoxFit.cover,
                  errorBuilder: (c, o, s) => Container(
                    color: Colors.grey[200],
                    alignment: Alignment.center,
                    child: const Text("sem imagem", style: TextStyle(color: Colors.black38)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: Center(
                child: Text(
                  nome,
                  style: const TextStyle(
                    color: Color(0xFF90017F),
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}