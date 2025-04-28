import 'package:flutter/material.dart';

class PaginaLogin extends StatefulWidget {
  @override
  _PaginaLoginState createState() => _PaginaLoginState();
}

class _PaginaLoginState extends State<PaginaLogin> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  String? errorMessage;
  bool menuAberto = false;

  void handleLogin() async {
    final email = emailController.text;
    final senha = senhaController.text;

    // Regex para validar o formato do email
    final emailRegex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@(yahoo|gmail|email)\.com(\.br)?$');
    if (!emailRegex.hasMatch(email)) {
      setState(() {
        errorMessage =
            "Formato de email inválido. Use um email válido como yahoo, gmail ou email.";
      });
      return;
    }

    try {
      // Simulando uma requisição de login
      if (email == "exemplo@gmail.com" && senha == "senha123") {
        setState(() {
          errorMessage = null;
        });
        // Navegar para a página principal
        Navigator.pushReplacementNamed(context, '/');
      } else {
        setState(() {
          errorMessage = "Email ou senha incorretos.";
        });
      }
    } catch (error) {
      setState(() {
        errorMessage = "Ocorreu um erro. Tente novamente.";
      });
      print(error);
    }
  }

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
            color: Color(0xFF90017F),
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('assets/logo.site.tcc.png', width: 120),
                if (!menuAberto)
                  IconButton(
                    icon: Icon(Icons.menu, color: Colors.white),
                    onPressed: toggleMenu,
                  ),
              ],
            ),
          ),
          if (menuAberto)
            Container(
              color: Color(0xFF90017F),
              child: Column(
                children: [
                  ListTile(
                    title:
                        Text('Início', style: TextStyle(color: Colors.white)),
                    leading: Icon(Icons.home, color: Colors.white),
                    onTap: () => Navigator.pushNamed(context, '/Index'),
                  ),
                  ListTile(
                    title: Text('Games', style: TextStyle(color: Colors.white)),
                    leading: Icon(Icons.videogame_asset, color: Colors.white),
                    onTap: () => Navigator.pushNamed(context, '/'),
                  ),
                  ListTile(
                    title: Text('Sobre', style: TextStyle(color: Colors.white)),
                    leading: Icon(Icons.info, color: Colors.white),
                    onTap: () => Navigator.pushNamed(context, '/Que'),
                  ),
                  ListTile(
                    title:
                        Text('Suporte', style: TextStyle(color: Colors.white)),
                    leading: Icon(Icons.headset, color: Colors.white),
                    onTap: () => Navigator.pushNamed(context, '/Suporte'),
                  ),
                ],
              ),
            ),
          // Corpo Principal
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                        offset: Offset(0, 2),
                      )
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          foreground: Paint()
                            ..shader = LinearGradient(
                              colors: [Color(0xFF90017F), Color(0xFF05B7E7)],
                            ).createShader(Rect.fromLTWH(0, 0, 200, 70)),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          labelText: "Email",
                          border: OutlineInputBorder(),
                          hintText: "Ex: exemplo@yahoo.com",
                        ),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        controller: senhaController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "Senha",
                          border: OutlineInputBorder(),
                          hintText: "Senha",
                        ),
                      ),
                      if (errorMessage != null)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            errorMessage!,
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: handleLogin,
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFF90017F),
                          padding: EdgeInsets.symmetric(
                            horizontal: 40,
                            vertical: 10,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        child: Text("LOGIN"),
                      ),
                      TextButton(
                        onPressed: () =>
                            Navigator.pushNamed(context, '/Cadastro'),
                        child: Text("Ainda não tem conta? Cadastre-se"),
                      ),
                      TextButton(
                        onPressed: () =>
                            Navigator.pushNamed(context, '/MandarEmail'),
                        child: Text("Esqueceu a senha? Redefinir senha"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
}