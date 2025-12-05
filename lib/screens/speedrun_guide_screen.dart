import 'package:flutter/material.dart';
import '../widgets/app_background.dart';

class SpeedrunGuideScreen extends StatelessWidget {
  const SpeedrunGuideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Guia de Speedrun'),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.flash_on), text: 'Strats'),
              Tab(icon: Icon(Icons.map), text: 'Rotas'),
            ],
          ),
        ),
        body: AppBackground(
          imageOpacity: 0.07,
          child: const TabBarView(
            children: [
              StratsView(),
              RoutesView(),
            ],
          ),
        ),
      ),
    );
  }
}

class StratsView extends StatelessWidget {
  const StratsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        Card(
          child: ListTile(
            leading: Icon(Icons.bolt, color: Colors.redAccent),
            title: Text('Needle Skip'),
            subtitle: Text('Use the needle lunge to bypass Moss Grotto gate.'),
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(Icons.auto_fix_high, color: Colors.redAccent),
            title: Text('Bomb Pogo'),
            subtitle: Text('Bounce on bombs to gain early vertical height.'),
          ),
        ),
      ],
    );
  }
}

class RoutesView extends StatelessWidget {
  const RoutesView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        Card(
          child: ListTile(
            leading: Icon(Icons.timer, color: Colors.red),
            title: Text('Any% NMG'),
            subtitle: Text('Estimated time: 45m. Critical path only.'),
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(Icons.check_circle, color: Colors.redAccent),
            title: Text('100% All Tools'),
            subtitle: Text('Estimated time: 3h 20m. Full completion route.'),
          ),
        ),
      ],
    );
  }
}
