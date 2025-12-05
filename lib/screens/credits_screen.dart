import 'package:flutter/material.dart';
import '../widgets/app_background.dart';

class CreditsScreen extends StatelessWidget {
  const CreditsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.red,
          elevation: 0,
          iconTheme: const IconThemeData(
              color: Colors.white), // ícone de voltar branco
          titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
          title: const Text('Créditos da API'),
        ),
        body: const Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'API: Hollow Knight Silksong Timeline',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(height: 8),
              Text('URL da documentação: https://exemplo-docs.com',
                  style: TextStyle(color: Colors.white)),
              Text('URL de acesso à API: https://example.com/api',
                  style: TextStyle(color: Colors.white)),
              Text('Métodos disponíveis: GET /timeline',
                  style: TextStyle(color: Colors.white)),
              Text('Autenticação: Não necessária',
                  style: TextStyle(color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }
}
