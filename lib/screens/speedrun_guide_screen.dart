import 'package:flutter/material.dart';
import '../widgets/app_background.dart';
import 'package:url_launcher/url_launcher.dart';

class SpeedrunGuideScreen extends StatelessWidget {
  const SpeedrunGuideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Guia de Speedrun', style: TextStyle(color: Colors.white),),
          bottom: const TabBar(
            labelColor: Colors.white, 
            unselectedLabelColor: Colors.white60,
            indicatorColor: Colors.white, 
            tabs: [
              Tab(icon: Icon(Icons.flash_on), text: 'Strats'),
              Tab(icon: Icon(Icons.movie), text: 'Video Referência'),
            ],
          ),
        ),
        body: const AppBackground(
          imageOpacity: 0.07,
          child: TabBarView(
            children: [
              StratsView(),
              ReferenceRunView()
            ],
          ),
        ),
      ),
    );
  }
}

class StratItem {
  final String title;
  final String subtitle;
  final IconData icon;
  final String videoUrl;

  StratItem({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.videoUrl,
  });
}

class StratsView extends StatelessWidget {
  const StratsView({super.key});

  Future<void> _launchVideo(BuildContext context, String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Could not open video link')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<StratItem> strats = [
      StratItem(
        title: 'Beastfly Pogo',
        subtitle: 'Na medula, use o inimigo voador para dar pogo e pular a área inteira.',
        icon: Icons.bolt,
        videoUrl: 'https://youtu.be/dGGLDbh_mBM?t=405', 
      ),
      StratItem(
        title: 'Silkspear Animation Cancelling',
        subtitle: 'Após utilizar a Lança, ataque e vire para cancelar a animação.',
        icon: Icons.auto_fix_high,
        videoUrl: 'https://youtu.be/7YhUO7e4xRo?t=1016', 
      ),
      StratItem(
        title: 'Bell Beast P2 Skip',
        subtitle: 'Combo Ataque - Lança até acabar seda para pular a fase 2.',
        icon: Icons.integration_instructions_sharp,
        videoUrl: 'https://youtu.be/dGGLDbh_mBM?t=619',
      ),
      StratItem(
        title: 'Fast Hornet',
        subtitle: 'Sequência para velocidade: Pulo - Pogo - Dash.',
        icon: Icons.access_alarm,
        videoUrl: 'https://youtu.be/dGGLDbh_mBM?t=1126',
      ),
      StratItem(
        title: 'Fourth Chorus Skip',
        subtitle: 'Corra, pule, dash e cura no último frame da arena.',
        icon: Icons.ac_unit_sharp,
        videoUrl: 'https://youtu.be/7YhUO7e4xRo?t=2959',
      ),
      StratItem(
        title: 'Early Cling Grip',
        subtitle: 'Use o Taunt para atrair o inimigo e dar pogo até a plataforma.',
        icon: Icons.access_time_filled_sharp,
        videoUrl: 'https://youtu.be/dGGLDbh_mBM?t=1473',
      ),
      StratItem(
        title: 'Widow Cutscene Skip',
        subtitle: 'Use o Taunt na entrada da arena para pular o diálogo.',
        icon: Icons.abc_sharp,
        videoUrl: 'https://youtu.be/dGGLDbh_mBM?t=1633',
      ),
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: strats.length,
      itemBuilder: (context, index) {
        final item = strats[index];
        return Card(
          child: ListTile(
            leading: Icon(item.icon, color: Colors.redAccent),
            title: Text(item.title),
            subtitle: Text(item.subtitle),
            trailing: IconButton(
              icon: const Icon(Icons.play_circle_fill, color: Colors.red, size: 32),
              tooltip: 'Ver Estratégia',
              onPressed: () => _launchVideo(context, item.videoUrl),
            ),
          ),
        );
      },
    );
  }
}

class ReferenceRunView extends StatelessWidget {
  const ReferenceRunView({super.key});

  Future<void> _launchFullRun() async {
    const url = 'https://www.youtube.com/watch?v=7YhUO7e4xRo'; 
    final Uri uri = Uri.parse(url);
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    const String videoId = '7YhUO7e4xRo'; 
    const String thumbnailUrl = 'https://img.youtube.com/vi/$videoId/maxresdefault.jpg';

    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: 800,
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12), 
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                GestureDetector(
                  onTap: _launchFullRun,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      AspectRatio(
                        aspectRatio: 16 / 9, 
                        child: Image.network(
                          thumbnailUrl,
                          fit: BoxFit.cover,
                          errorBuilder: (c, o, s) => Container(color: Colors.black), 
                        ),
                      ),
                      AspectRatio(
                        aspectRatio: 16 / 9,
                        child: Container(color: Colors.black.withOpacity(0.3)),
                      ),
                      const Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                        size: 64,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Expanded(
                            child: Text(
                              'Guia de Speedrun de Silksong (Any%)',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                          IconButton(
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                            icon: const Icon(Icons.open_in_new, color: Colors.red),
                            onPressed: _launchFullRun,
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'Feito por Fireb0rn',
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}