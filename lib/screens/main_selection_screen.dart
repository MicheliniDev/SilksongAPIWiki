import 'package:flutter/material.dart';
import '../widgets/app_background.dart';
import 'home_screen.dart';
import 'speedrun_guide_screen.dart';

class MainSelectionScreen extends StatelessWidget {
  const MainSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Silksong Companion'),
      ),
      body: AppBackground(
        imageOpacity: 0.07,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MenuButton(
                  icon: Icons.rss_feed,
                  label: 'Timeline & Notícias',
                  color: Colors.red.shade700,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const HomeScreen()),
                  ),
                ),
                const SizedBox(height: 20),
                MenuButton(
                  icon: Icons.timer,
                  label: 'Guia de Speedrun',
                  color: Colors.red.shade600,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const SpeedrunGuideScreen()),
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

class MenuButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const MenuButton({
    super.key,
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 80,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
        icon: Icon(icon, size: 32),
        label: Text(
          label,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.1,
          ),
        ),
        onPressed: onTap,
      ),
    );
  }
}
