import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro'),
        backgroundColor: const Color(0xFF90017F),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width > 600 ? 500 : null,
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
                  const Text(
                    'CRIAR CONTA',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF90017F),
                    ),
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
                    onSaved:
                        (value) => _handleChange('dataNascimento', value ?? ''),
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
                    onSaved:
                        (value) => _handleChange('confirmarSenha', value ?? ''),
                    obscureText: true,
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _handleSubmit,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 24,
                        ),
                        backgroundColor: const Color(0xFF007BFF),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: const Text(
                        'CADASTRE-SE',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  if (_mensagem.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Text(
                        _mensagem,
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),
                ],
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFF90017F),
            ),
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
