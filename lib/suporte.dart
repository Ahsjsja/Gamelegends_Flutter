import 'package:flutter/material.dart';
import 'navbar.dart'; // Certifique-se de que o arquivo navbar.dart está no mesmo diretório

class PaginaSuporte extends StatefulWidget {
  const PaginaSuporte({Key? key}) : super(key: key);

  @override
  State<PaginaSuporte> createState() => _PaginaSuporteState();
}

class _PaginaSuporteState extends State<PaginaSuporte> {
  bool menuAberto = false;
  Map<String, String> formData = {
    'email': "",
    'usuario': ""
  };

  // Simula FAQ
  final List<Map<String, String>> faqData = [
    {
      "question": "Como posso visualizar ou alterar minhas configurações de conta?",
      "answer":
          "Clique no ícone de perfil no canto superior direito e selecione 'Configurações da Conta' para visualizar ou editar suas informações pessoais e preferências."
    },
    {
      "question": "Onde posso encontrar o histórico das doações nos projetos?",
      "answer":
          "Vá para 'Minha Conta' e selecione 'Histórico de Compras' para ver todas as suas transações anteriores."
    },
    {
      "question": "Esqueci minha senha. Como posso recuperá-la?",
      "answer":
          "Clique em 'Esqueci minha senha' na página de login e siga as instruções para redefinir sua senha."
    },
    {
      "question": "Como posso encontrar as últimas notícias e atualizações sobre os jogos?",
      "answer":
          "Acesse a seção de notícias no menu principal para ver as últimas novidades sobre os projetos e lançamentos."
    },
    {
      "question": "Como posso deixar um comentário ou avaliação para um jogo?",
      "answer":
          "Na página de cada jogo, você encontrará uma seção de avaliações onde poderá escrever sua opinião."
    },
  ];

  @override
  void initState() {
    super.initState();
    setState(() {
      formData = {
        'email': "",
        'usuario': "",
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE9E9E9),
      appBar: AppBar(
        backgroundColor: const Color(0xFF90017F),
        elevation: 0,
        title: Row(
          children: [
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, "/"),
              child: Image.asset(
                'assets/logo.site.tcc.png',
                height: 44,
                fit: BoxFit.contain,
              ),
            ),
            
            const Spacer(),
            // Botões de navegação
            ...[
              {"label": "Início", "route": "/Index", "icon": Icons.home},
              {"label": "Games", "route": "/", "icon": Icons.videogame_asset},
              {"label": "Sobre", "route": "/Que", "icon": Icons.help},
              {"label": "Suporte", "route": "/Suporte", "icon": Icons.headset_mic},
            ].map((nav) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: TextButton.icon(
                    style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        textStyle: const TextStyle(fontSize: 16)),
                    onPressed: () => Navigator.pushNamed(
                        context, nav["route"] as String),
                    icon: Icon(nav["icon"] as IconData, size: 18),
                    label: Text(nav["label"] as String),
                  ),
                )),
            const SizedBox(width: 8),
            if (formData["usuario"] != null && formData["usuario"]!.isNotEmpty)
              TextButton.icon(
                onPressed: () {
                  Navigator.pushNamed(
                      context, '/Perfil?tipo=${formData["usuario"]}');
                },
                icon: const Icon(Icons.account_circle, color: Colors.white),
                label: Text(
                  "Perfil (${formData["usuario"]})",
                  style: const TextStyle(color: Colors.white),
                ),
              )
            else ...[
              TextButton(
                onPressed: () => Navigator.pushNamed(context, '/Login'),
                child: const Text("Login", style: TextStyle(color: Colors.white)),
              ),
              TextButton(
                onPressed: () => Navigator.pushNamed(context, '/Cadastro'),
                child: const Text("Registre-se", style: TextStyle(color: Colors.white)),
              ),
            ]
          ],
        ),
      ),
      body: ListView(
        children: [
          // FAQ Section
          Container(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 0),
            color: Colors.white,
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 720),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 12),
                    const Text(
                      "Perguntas Frequentes",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Color(0xFF90017F),
                      ),
                    ),
                    const SizedBox(height: 24),
                    ...faqData.map((faq) => FAQItem(
                          question: faq["question"]!,
                          answer: faq["answer"]!,
                        )),
                  ],
                ),
              ),
            ),
          ),
          // Footer
          Container(
            color: const Color(0xFF90017F),
            padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 0),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1200),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Sobre
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 32),
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
                    ),
                    // Links rápidos
                    Expanded(
                      flex: 1,
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
    );
  }
}

// Widget FAQItem
class FAQItem extends StatefulWidget {
  final String question;
  final String answer;

  const FAQItem({super.key, required this.question, required this.answer});

  @override
  State<FAQItem> createState() => _FAQItemState();
}

class _FAQItemState extends State<FAQItem> {
  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: isOpen ? 3 : 1,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: () => setState(() {
          isOpen = !isOpen;
        }),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                      child: Text(
                    widget.question,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 17),
                  )),
                  Icon(isOpen ? Icons.remove : Icons.add),
                ],
              ),
              if (isOpen)
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    widget.answer,
                    style: const TextStyle(color: Colors.black87, fontSize: 15),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}