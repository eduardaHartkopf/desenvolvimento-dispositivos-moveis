import 'package:flutter/material.dart';

void main() {
  runApp(const CadastroApp());
}

class CadastroApp extends StatelessWidget {
  const CadastroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Criar Conta',
      home: Scaffold(
        body: const CadastroBody(),
      ),
    );
  }
}

class CadastroBody extends StatefulWidget {
  const CadastroBody({super.key});

  @override
  State<CadastroBody> createState() => _CadastroBodyState();
}

class _CadastroBodyState extends State<CadastroBody> {
  bool _aceitouTermos = true;
  int _tentativas = 0;

  void _alternarTermos(bool? valor) {
    setState(() {
      _aceitouTermos = valor ?? false;
    });
  }

 void _cadastrar() {
  setState(() {
    _tentativas++;
  });
}

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 360,
        child: Card(
          elevation: 4,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Criar Conta',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 24),

                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Nome completo',
                    border: OutlineInputBorder(), //aplica as bordas
                  ),
                ),

                const SizedBox(height: 16),

                const TextField(
                  decoration: InputDecoration(
                    labelText: 'E-mail',
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 16),

                const TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    border: OutlineInputBorder(), 
                  ),
                ),

               const SizedBox(height: 16),

                Row(
                  children: [
                    Checkbox(
                      value: _aceitouTermos,
                      onChanged: _alternarTermos,
                    ),
                    const Text('Aceito os termos de uso'),
                  ],
                ),

                const SizedBox(height: 16),

                ElevatedButton(
                  onPressed: _aceitouTermos ? _cadastrar : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  child: Text(
                    'Cadastrar (tentativa $_tentativas)',
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