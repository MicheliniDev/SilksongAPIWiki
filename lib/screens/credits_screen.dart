import 'package:flutter/material.dart';

class CreditsScreen extends StatelessWidget {
  const CreditsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Créditos da API')),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'API: Hollow Knight Silksong Timeline',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('URL da documentação: https://exemplo-docs.com'),
            Text('URL de acesso à API: https://example.com/api'),
            Text('Métodos disponíveis: GET /timeline'),
            Text('Autenticação: Não necessária'),
          ],
        ),
      ),
    );
  }
}
