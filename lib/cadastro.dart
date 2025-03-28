import 'package:flutter/material.dart';

void main() {
  runApp(const PaginaCadastro());
}

class PaginaCadastro extends StatefulWidget {
  const PaginaCadastro({super.key});

  @override
  State<PaginaCadastro> createState() => _PaginaCadastroState();
}

class _PaginaCadastroState extends State<PaginaCadastro> {
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

  void _handleSubmit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      if (_formData['senha'] != _formData['confirmarSenha']) {
        setState(() {
          _mensagem = 'As senhas não correspondem!';
        });
        return;
      }

      // Assuming you have a function to send data to the server
      // sendCadastroData(_formData);

      // Navigate to login page on successful registration
      Navigator.pushNamed(context, '/Login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cadastro',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Cadastro'),
        ),
        body: Container(
          decoration: _boxDecoration,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Text(
                      'CRIAR CONTA',
                      style: _headerTextStyle,
                    ),
                    const SizedBox(height: 16),
                    _buildTextFormField(
                      label: 'Nome',
                      onSaved: (value) =>
                          _handleChange('nome', value ?? ''),
                    ),
                    _buildTextFormField(
                      label: 'Sobrenome',
                      onSaved: (value) =>
                          _handleChange('sobrenome', value ?? ''),
                    ),
                    _buildTextFormField(
                      label: 'CPF',
                      onSaved: (value) =>
                          _handleChange('cpf', value ?? ''),
                    ),
                    _buildTextFormField(
                      label: 'Data de Nascimento',
                      onSaved: (value) =>
                          _handleChange('dataNascimento', value ?? ''),
                      keyboardType: TextInputType.datetime,
                    ),
                    _buildTextFormField(
                      label: 'Email',
                      onSaved: (value) =>
                          _handleChange('email', value ?? ''),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    _buildTextFormField(
                      label: 'Telefone',
                      onSaved: (value) =>
                          _handleChange('telefone', value ?? ''),
                      keyboardType: TextInputType.phone,
                    ),
                    _buildTextFormField(
                      label: 'Senha',
                      onSaved: (value) =>
                          _handleChange('senha', value ?? ''),
                      obscureText: true,
                    ),
                    _buildTextFormField(
                      label: 'Confirmar Senha',
                      onSaved: (value) =>
                          _handleChange('confirmarSenha', value ?? ''),
                      obscureText: true,
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: _handleSubmit,
                      style: _buttonStyle,
                      child: const Text('CADASTRE-SE'),
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
                        child: const Text('Já tem uma conta? Faça login'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
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
      child: TextFormField(
        decoration: _inputDecoration.copyWith(labelText: label),
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
    );
  }
}

final _boxDecoration = BoxDecoration(
  gradient: const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFF90017F), Color(0xFF05B7E7)],
  ),
);

final _headerTextStyle = const TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.bold,
  color: Color(0xFF90017F),
);

final _buttonStyle = ElevatedButton.styleFrom(
  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
  backgroundColor: const Color(0xFF007BFF),
  foregroundColor: Colors.white,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(5),
  ),
);

final _inputDecoration = const InputDecoration(
  border: OutlineInputBorder(),
  contentPadding: EdgeInsets.all(10),
);