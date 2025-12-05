import 'package:flutter/material.dart';

class AppBackground extends StatelessWidget {
  final Widget child;
  final double imageOpacity;
  final String assetPath;
  final BoxFit fit;

  const AppBackground({
    super.key,
    required this.child,
    this.imageOpacity = 0.5, // opacidade padrão (6%)
    this.assetPath = 'assets/images/silksong.jpg',
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // imagem de fundo com opacidade baixa
        Positioned.fill(
          child: Opacity(
            opacity: imageOpacity,
            child: Image.asset(
              assetPath,
              fit: fit,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
        ),

        // conteúdo da tela por cima
        Positioned.fill(
          child: child,
        ),
      ],
    );
  }
}
