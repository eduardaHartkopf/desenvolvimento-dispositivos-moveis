import 'package:flutter/material.dart';

void main() {
  runApp(const CartaoPerfilApp());
}

class CartaoPerfilApp extends StatelessWidget {
  const CartaoPerfilApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cartão de Perfil',
      home: Scaffold(
        appBar: AppBar(title: const Text('Meu perfil')),
        body: const CartaoPerfilBody(),
      ),
    );
  }
}

class CartaoPerfilBody extends StatefulWidget {
  const CartaoPerfilBody({super.key});

  @override
  State<CartaoPerfilBody> createState() => _CartaoPerfilBodyState();
}

class _CartaoPerfilBodyState extends State<CartaoPerfilBody> {
  bool _seguindo = false;
  int _curtidas = 0;

  void _alternarSeguir() {
    setState(() {
      _seguindo = !_seguindo;
    });
  }

  void _curtir() {
    setState(() {
      _curtidas++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircleAvatar(
                    radius: 50, child: Icon(Icons.person, size: 50)),
                const SizedBox(height: 16),
                const Text('João Vitor Trindade'),
                const SizedBox(height: 4),
                const Text(
                  'Professor de Programação Mobile',
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
                const SizedBox(height: 8),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.location_on, size: 16, color: Colors.grey),
                    SizedBox(width: 4),
                    Text('Caçador, SC', style: TextStyle(color: Colors.grey)),
                  ],
                ),
                const Divider(height: 32),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _alternarSeguir,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _seguindo ? Colors.grey : Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  child: Text(_seguindo ? 'Seguindo' : 'Seguir'),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.favorite_border),
                      color: Colors.red,
                      onPressed: _curtir,
                    ),
                    Text('$_curtidas curtidas'),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
