import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class PaginaLogin extends StatefulWidget {
  @override
  _PaginaLoginState createState() => _PaginaLoginState();
}

class _PaginaLoginState extends State<PaginaLogin> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  String? errorMessage;
  bool menuAberto = false;
  bool loading = false;

  void handleLogin() async {
    final email = emailController.text.trim();
    final senha = senhaController.text;

    final emailRegex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@(yahoo|gmail|email)\.com(\.br)?$');
    if (!emailRegex.hasMatch(email)) {
      setState(() {
        errorMessage =
            "Formato de email inválido. Use um email válido como yahoo, gmail ou email.";
      });
      return;
    }

    setState(() {
      loading = true;
      errorMessage = null;
    });

    try {
      final response = await http.post(
        Uri.parse("http://localhost:8080/login"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "email": email,
          "senha": senha,
        }),
      );

      if (response.statusCode == 200) {
        // Parse o JSON
        final userMap = jsonDecode(response.body);

        // Salva tudo do usuário no SharedPreferences (como string)
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('usuario', jsonEncode(userMap));
        // Salve também o tipo para facilitar o Navbar
        if (userMap["usuario"] != null) {
          await prefs.setString('usuario_tipo', userMap["usuario"]);
        }

        setState(() {
          errorMessage = null;
        });
        // Navega para a página principal
        if (!mounted) return;
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
    } finally {
      setState(() {
        loading = false;
      });
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
                    onTap: () => Navigator.pushNamed(context, '/'),
                  ),
                  ListTile(
                    title: Text('Games', style: TextStyle(color: Colors.white)),
                    leading: Icon(Icons.videogame_asset, color: Colors.white),
                    onTap: () => Navigator.pushNamed(context, '/index'),
                  ),
                  ListTile(
                    title: Text('Sobre', style: TextStyle(color: Colors.white)),
                    leading: Icon(Icons.info, color: Colors.white),
                    onTap: () => Navigator.pushNamed(context, '/que'),
                  ),
                  ListTile(
                    title:
                        Text('Suporte', style: TextStyle(color: Colors.white)),
                    leading: Icon(Icons.headset, color: Colors.white),
                    onTap: () => Navigator.pushNamed(context, '/suporte'),
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
                      loading
                          ? CircularProgressIndicator(
                              color: Color(0xFF90017F),
                            )
                          : ElevatedButton(
                              onPressed: handleLogin,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF90017F),
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
                            Navigator.pushNamed(context, '/cadastro'),
                        child: Text("Ainda não tem conta? Cadastre-se"),
                      ),
                      TextButton(
                        onPressed: () =>
                            Navigator.pushNamed(context, '/mandaremail'),
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