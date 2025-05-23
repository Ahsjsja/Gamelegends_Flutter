import 'package:flutter/material.dart';

class Navbar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onMenuTap;
  final bool isMenuOpen;
  final TextEditingController searchController;

  const Navbar({
    Key? key,
    this.onMenuTap,
    this.isMenuOpen = false,
    required this.searchController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 900;

    return Material(
      elevation: 6,
      color: const Color(0xFF90017F),
      child: Container(
        height: 70,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          children: [
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/'),
              child: SizedBox(
                height: 45,
                child: Image.asset(
                  'assets/logo.site.tcc.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(width: 16),
            if (isWide)
              Expanded(
                child: Row(
                  children: [
                    _NavbarButton(
                      icon: Icons.home,
                      label: 'Início',
                      onTap: () => Navigator.pushNamed(context, '/'),
                    ),
                    _NavbarButton(
                      icon: Icons.videogame_asset,
                      label: 'Games',
                      onTap: () => Navigator.pushNamed(context, '/index'),
                    ),
                    _NavbarButton(
                      icon: Icons.help_outline,
                      label: 'Sobre',
                      onTap: () => Navigator.pushNamed(context, '/que'),
                    ),
                    _NavbarButton(
                      icon: Icons.headset_mic,
                      label: 'Suporte',
                      onTap: () => Navigator.pushNamed(context, '/suporte'),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: 220,
                      child: TextField(
                        controller: searchController,
                        style: const TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          hintText: 'Pesquisar Jogos, Tags ou Criadores',
                          hintStyle: const TextStyle(color: Colors.black54),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                          ),
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.search, color: Color(0xFF90017F)),
                            onPressed: () {
                              // Implementar busca
                            },
                          ),
                        ),
                        onSubmitted: (q) {
                          // Implementar busca
                        },
                      ),
                    ),
                    const SizedBox(width: 12),
                    TextButton(
                      onPressed: () => Navigator.pushNamed(context, '/login'),
                      style: TextButton.styleFrom(
                        backgroundColor: const Color(0xFF780069),
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                      ),
                      child: const Text('Login', style: TextStyle(color: Colors.white)),
                    ),
                    const SizedBox(width: 8),
                    TextButton(
                      onPressed: () => Navigator.pushNamed(context, '/cadastro'),
                      style: TextButton.styleFrom(
                        backgroundColor: const Color(0xFF780069),
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                      ),
                      child: const Text('Registre-se', style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              ),
            if (!isWide)
              Row(
                children: [
                  IconButton(
                    icon: Icon(isMenuOpen ? Icons.close : Icons.menu, color: Colors.white),
                    onPressed: onMenuTap,
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}

// Use este widget no corpo do seu Scaffold para mostrar o menu mobile!
class NavbarMobileMenu extends StatelessWidget {
  final VoidCallback closeMenu;
  final TextEditingController searchController;

  const NavbarMobileMenu({
    Key? key,
    required this.closeMenu,
    required this.searchController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      top: 70,
      bottom: 0,
      child: Material(
        color: Colors.transparent,
        child: Stack(
          children: [
            GestureDetector(
              onTap: closeMenu,
              child: Container(
                color: Colors.black26,
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xFF90017F),
                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(12)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _NavbarMobileItem(
                        icon: Icons.home,
                        text: 'Início',
                        onTap: () {
                          closeMenu();
                          Navigator.pushNamed(context, '/');
                        },
                      ),
                      _NavbarMobileItem(
                        icon: Icons.videogame_asset,
                        text: 'Games',
                        onTap: () {
                          closeMenu();
                          Navigator.pushNamed(context, '/index');
                        },
                      ),
                      _NavbarMobileItem(
                        icon: Icons.help_outline,
                        text: 'Sobre',
                        onTap: () {
                          closeMenu();
                          Navigator.pushNamed(context, '/que');
                        },
                      ),
                      _NavbarMobileItem(
                        icon: Icons.headset_mic,
                        text: 'Suporte',
                        onTap: () {
                          closeMenu();
                          Navigator.pushNamed(context, '/suporte');
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                        child: TextField(
                          controller: searchController,
                          style: const TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            hintText: 'Pesquisar Jogos, Tags ou Criadores',
                            hintStyle: const TextStyle(color: Colors.black54),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none,
                            ),
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.search, color: Color(0xFF90017F)),
                              onPressed: () {
                                // Implementar busca
                              },
                            ),
                          ),
                          onSubmitted: (q) {
                            // Implementar busca
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              closeMenu();
                              Navigator.pushNamed(context, '/login');
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: const Color(0xFF780069),
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                            ),
                            child: const Text('Login', style: TextStyle(color: Colors.white)),
                          ),
                          const SizedBox(width: 8),
                          TextButton(
                            onPressed: () {
                              closeMenu();
                              Navigator.pushNamed(context, '/cadastro');
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: const Color(0xFF780069),
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                            ),
                            child: const Text('Registre-se', style: TextStyle(color: Colors.white)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NavbarButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _NavbarButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          decoration: BoxDecoration(
            color: const Color(0xFF780069),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              Icon(icon, color: Colors.white, size: 22),
              const SizedBox(width: 6),
              Text(label,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500)),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavbarMobileItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  const _NavbarMobileItem({
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            decoration: BoxDecoration(
              color: const Color(0xFF780069),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Icon(icon, color: Colors.white, size: 26),
                const SizedBox(width: 14),
                Expanded(
                  child: Text(
                    text,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}