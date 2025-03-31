import 'package:flutter/material.dart';
import 'package:myhttp/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Game Legends',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: 'Arial',
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _menuAberto = false;

  void _toggleMenu() {
    setState(() {
      _menuAberto = !_menuAberto;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Header
          Container(
            color: const Color(0xFF90017F),
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                // Desktop header content
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Logo
                    const SizedBox(
                      width: 120,
                      child: Placeholder(), // Replace with your logo image
                    ),
                    
                    // Navigation - hidden on mobile initially
                    if (MediaQuery.of(context).size.width > 768)
                      Row(
                        children: [
                          _buildNavItem(Icons.home, 'Início', '/Index'),
                          _buildNavItem(Icons.gamepad, 'Games', '/'),
                          _buildNavItem(Icons.help, 'Sobre', '/Que'),
                          _buildNavItem(Icons.headset, 'Suporte', '/Suporte'),
                        ],
                      ),
                    
                    // Search and user panel
                    if (MediaQuery.of(context).size.width > 768)
                      Row(
                        children: [
                          // Search form
                          SizedBox(
                            width: 300,
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: 'Pesquisar Jogos, Tags ou Criadores',
                                filled: true,
                                fillColor: Colors.white,
                                contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide.none,
                                ),
                                suffixIcon: Container(
                                  decoration: const BoxDecoration(
                                    color: Color(0xFF780069),
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(5),
                                      bottomRight: Radius.circular(5),
                                    ),
                                  child: IconButton(
                                    icon: const Icon(Icons.search, color: Colors.white),
                                    onPressed: () {},
                                  ),
                                ),
                              ),
                            ),
                            
                            // User panel
                            const SizedBox(width: 10),
                            TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: const Color(0xFF780069),
                                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              onPressed: () {},
                              child: const Text('Login', style: TextStyle(color: Colors.white)),
                            const SizedBox(width: 5),
                            TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: const Color(0xFF780069),
                                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              onPressed: () {},
                              child: const Text('Registre-se', style: TextStyle(color: Colors.white)),
                          ],
                        ),
                        
                        // Hamburger menu - visible on mobile
                        if (MediaQuery.of(context).size.width <= 768)
                          IconButton(
                            icon: const Icon(Icons.menu, color: Colors.white),
                            onPressed: _toggleMenu,
                          ),
                      ],
                    ),
                    
                    // Mobile menu - appears when hamburger is clicked
                    if (_menuAberto && MediaQuery.of(context).size.width <= 768)
                      Column(
                        children: [
                          _buildMobileNavItem(Icons.home, 'Início', '/Index'),
                          _buildMobileNavItem(Icons.gamepad, 'Games', '/'),
                          _buildMobileNavItem(Icons.help, 'Sobre', '/Que'),
                          _buildMobileNavItem(Icons.headset, 'Suporte', '/Suporte'),
                          const SizedBox(height: 10),
                          SizedBox(
                            width: double.infinity,
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: 'Pesquisar Jogos, Tags ou Criadores',
                                filled: true,
                                fillColor: Colors.white,
                                contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide.none,
                                ),
                                suffixIcon: Container(
                                  decoration: const BoxDecoration(
                                    color: Color(0xFF780069),
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(5),
                                      bottomRight: Radius.circular(5),
                                    ),
                                  child: IconButton(
                                    icon: const Icon(Icons.search, color: Colors.white),
                                    onPressed: () {},
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: const Color(0xFF780069),
                                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: const Text('Login', style: TextStyle(color: Colors.white)),
                                const SizedBox(width: 5),
                                TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: const Color(0xFF780069),
                                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  onPressed: () {},
                                  child: const Text('Registre-se', style: TextStyle(color: Colors.white)),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    
                    // Main content
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Color(0xFF90017F), Color(0xFF05B7E7)],
                          ),
                        ),
                        child: const Center(
                          child: CadastroForm(),
                        ),
                      ),
                    ),
                    
                    // Footer
                    Container(
                      color: const Color(0xFF90017F),
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // About section
                              const Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('GameLegends', style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                                    SizedBox(height: 10),
                                    Text(
                                      'Game Legends é uma plataforma dedicada a jogos indie, fornecendo uma maneira fácil para desenvolvedores distribuírem seus jogos e para jogadores descobrirem novas experiências.',
                                      style: TextStyle(color: Colors.white)),
                                    SizedBox(height: 10),
                                    Row(
                                      children: [
                                        Icon(Icons.phone, color: Colors.white, size: 16),
                                        SizedBox(width: 5),
                                        Text('(99) 99999-9999', style: TextStyle(color: Colors.white)),
                                      ],
                                    ),
                                    SizedBox(height: 5),
                                    Row(
                                      children: [
                                        Icon(Icons.email, color: Colors.white, size: 16),
                                        SizedBox(width: 5),
                                        Text('info@gamelegends.com', style: TextStyle(color: Colors.white)),
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      children: [
                                        IconButton(
                                          icon: Icon(Icons.facebook, color: Colors.white),
                                          onPressed: null),
                                        IconButton(
                                          icon: Icon(Icons.twitter, color: Colors.white),
                                          onPressed: null),
                                        IconButton(
                                          icon: Icon(Icons.instagram, color: Colors.white),
                                          onPressed: null),
                                        IconButton(
                                          icon: Icon(Icons.linkedin, color: Colors.white),
                                          onPressed: null),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              
                              // Links section
                              const Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Links Rápidos', style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                                    SizedBox(height: 10),
                                    TextButton(
                                      onPressed: null,
                                      child: Text('Eventos', style: TextStyle(color: Colors.white))),
                                    TextButton(
                                      onPressed: null,
                                      child: Text('Equipe', style: TextStyle(color: Colors.white))),
                                    TextButton(
                                      onPressed: null,
                                      child: Text('Missão', style: TextStyle(color: Colors.white))),
                                    TextButton(
                                      onPressed: null,
                                      child: Text('Serviços', style: TextStyle(color: Colors.white))),
                                    TextButton(
                                      onPressed: null,
                                      child: Text('Afiliados', style: TextStyle(color: Colors.white))),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const Divider(color: Color(0xFFA0008D), height: 20),
                          const Text('© gamelegends.com | Feito pelo time do Game Legends',
                            style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }
            
            Widget _buildNavItem(IconData icon, String label, String route) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: const Color(0xFF780069),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  ),
                  onPressed: () {},
                  child: Row(
                    children: [
                      Icon(icon, color: Colors.white, size: 20),
                      const SizedBox(width: 8),
                      Text(label, style: const TextStyle(color: Colors.white, fontSize: 16)),
                    ],
                  ),
                ),
              );
            }
            
            Widget _buildMobileNavItem(IconData icon, String label, String route) {
              return Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  border: Border(bottom: BorderSide(color: Color(0xFFA0008D))),
                child: TextButton(
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    alignment: Alignment.center,
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(icon, color: Colors.white, size: 20),
                      const SizedBox(width: 8),
                      Text(label, style: const TextStyle(color: Colors.white, fontSize: 16)),
                    ],
                  ),
                ),
              );
            }
          }
          
          class CadastroForm extends StatefulWidget {
            const CadastroForm({super.key});
            
            @override
            State<CadastroForm> createState() => _CadastroFormState();
          }
          
          class _CadastroFormState extends State<CadastroForm> {
            final _formKey = GlobalKey<FormState>();
            final Map<String, String> _formData = {
              'nome': '',
              'sobrenome': '',
              'cpf': '',
              'dataNascimento': '',
              'email': '',
              'telefone': '',
              'senha': '',
              'confirmarSenha': '',
            };
            
            String _mensagem = '';
            
            void _handleChange(String key, String value) {
              setState(() {
                _formData[key] = value;
              });
            }
            
            Future<void> _handleSubmit() async {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                if (_formData['senha'] != _formData['confirmarSenha']) {
                  setState(() {
                    _mensagem = 'As senhas não correspondem!';
                  });
                  return;
                }
                
                final cadastroData = json.encode({
                  ..._formData,
                  'datanascimento': _formData['dataNascimento'],
                });
                
                try {
                  final response = await http.post(
                    Uri.parse('http://localhost:8080/cadastro'),
                    headers: {'Content-Type': 'application/json'},
                    body: cadastroData,
                  );
                  
                  if (response.statusCode == 201) {
                    setState(() {
                      _mensagem = 'Cadastro realizado com sucesso!';
                    });
                    Navigator.pushNamed(context, '/Login');
                  } else {
                    final errorResponse = json.decode(response.body);
                    setState(() {
                      _mensagem = errorResponse['message'] ?? 'Erro no cadastro.';
                    });
                  }
                } catch (error) {
                  setState(() {
                    _mensagem = 'Erro ao se conectar ao servidor. Tente novamente.';
                  });
                }
              }
            }
            
            @override
            Widget build(BuildContext context) {
              return Container(
                width: MediaQuery.of(context).size.width > 600 ? 800 : null,
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'CRIAR CONTA',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF90017F)),
                        ),
                      const SizedBox(height: 20),
                      _buildTextFormField(
                        label: 'Nome',
                        onSaved: (value) => _handleChange('nome', value ?? ''),
                      ),
                      _buildTextFormField(
                        label: 'Sobrenome',
                        onSaved: (value) => _handleChange('sobrenome', value ?? ''),
                      ),
                      _buildTextFormField(
                        label: 'CPF',
                        onSaved: (value) => _handleChange('cpf', value ?? ''),
                      ),
                      _buildTextFormField(
                        label: 'Data de Nascimento',
                        onSaved: (value) => _handleChange('dataNascimento', value ?? ''),
                        keyboardType: TextInputType.datetime,
                      ),
                      _buildTextFormField(
                        label: 'Email',
                        onSaved: (value) => _handleChange('email', value ?? ''),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      _buildTextFormField(
                        label: 'Telefone',
                        onSaved: (value) => _handleChange('telefone', value ?? ''),
                        keyboardType: TextInputType.phone,
                      ),
                      _buildTextFormField(
                        label: 'Senha',
                        onSaved: (value) => _handleChange('senha', value ?? ''),
                        obscureText: true,
                      ),
                      _buildTextFormField(
                        label: 'Confirmar Senha',
                        onSaved: (value) => _handleChange('confirmarSenha', value ?? ''),
                        obscureText: true,
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _handleSubmit,
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                            backgroundColor: const Color(0xFF007BFF),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          child: const Text('CADASTRE-SE', style: TextStyle(fontSize: 18)),
                        ),
                      if (_mensagem.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: Text(
                            _mensagem,
                            style: const TextStyle(color: Colors.red),
                          ),
                        ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/Login');
                          },
                          child: RichText(
                            text: TextSpan(
                              text: 'Já tem uma conta? Faça login: ',
                              style: const TextStyle(color: Colors.black),
                              children: [
                                TextSpan(
                                  text: 'Login',
                                  style: TextStyle(
                                    color: const Color(0xFF007BFF),
                                    decoration: TextDecoration.underline,
                                  ),
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
            
            Widget _buildTextFormField({
              required String label,
              required void Function(String?) onSaved,
              bool obscureText = false,
              TextInputType keyboardType = TextInputType.text,
            }) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF90017F)),
                      ),
                    const SizedBox(height: 5),
                    TextFormField(
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(10),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      obscureText: obscureText,
                      keyboardType: keyboardType,
                      onSaved: onSaved,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Campo obrigatório';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              );
            }
          }