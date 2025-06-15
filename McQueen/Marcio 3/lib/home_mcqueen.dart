import 'package:flutter/material.dart';
import 'detalhes_mcqueen.dart';

class HomeMcQueen extends StatelessWidget {
  const HomeMcQueen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDC143C), // novo fundo vermelho crimson
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'MCQUEEN',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontStyle: FontStyle.italic,
                letterSpacing: 1.5,
              ),
            ),
            const SizedBox(height: 16),
            Image.asset(
              'imagens/mcqueen_logo.png',
              height: 150,
            ),
            const SizedBox(height: 24),
            const Text(
              'Conheça tudo sobre o filme',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const DetalhesMcQueen()),
                );
              },
              child: const Text(
                'Iniciar',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
