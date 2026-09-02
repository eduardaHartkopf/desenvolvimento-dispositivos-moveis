import 'package:flutter/material.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final _formKey = GlobalKey<FormState>();

  bool _aceitouTermos = false;
  String _nome = '';
  String _email = '';
  String _senha = '';


  void _alternarTermos(bool? valor) {
    setState(() {
      _aceitouTermos = valor ?? false;
    });
  }

  void _cadastrar() {

    if(_formKey.currentState!.validate()){
      Navigator.pop(context, _nome);
    }
  }
    //*if (_nome.isEmpty){
      //*ScaffoldMessenger.of(context).showSnackBar(
        //*SnackBar(content: Text ('Informe seu nome'), backgroundColor: Colors.yellowAccent
        //*,)
      //*);
     //* return;
   //* }

   //* if (_email.isEmpty || !_email.contains('@')){
      //*ScaffoldMessenger.of(context).showSnackBar(
     //*   SnackBar(content: Text ('Informe seu email'))
     //* );
    //*  return;
    //*}

    //*if(_senha.isEmpty || _senha.length <6){
    //*  ScaffoldMessenger.of(context).showSnackBar(
       //* SnackBar(content: Text('Informe sua senha'))
      //*);

      //*return;
    //*}
    
   //*Navigator.pop(context, _nome);
  //*}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastro')),
      body: Center(
        child: SizedBox(
          width: 320,
          child: Card(
            elevation: 4,
            color: Colors.white70,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Criar Conta',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Nome completo',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (valor) {
                        _nome = valor;
                      },
                      validator: (valor) {
                        if(valor == null || valor.isEmpty){
                          return 'Informe seu nome';
                        }

                        return null;

                      },
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'E-mail',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (valor) {
                        _email = valor;
                      },
                      validator: (valor) {
                        if(valor == null || valor.isEmpty || !valor.contains('@')){
                          return 'Informe seu email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Senha',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (valor) {
                        _senha = valor;
                      },
                      obscureText: true,
                      validator: (valor) {
                        if(valor == null || valor.isEmpty || valor.length <6){
                          return 'Informe sua senha';
                        }

                        return null;
                      },
                    ),
                    const Divider(height: 32),
                    Row(
                      children: [
                        Checkbox(
                          value: _aceitouTermos,
                          onChanged: _alternarTermos,
                        ),
                        const Text('Aceito os termos de uso'),
                      ],
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: _aceitouTermos ? _cadastrar : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                      ),
                      child: const Text('Cadastrar'),
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
}
