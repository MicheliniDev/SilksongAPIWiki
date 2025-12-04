import 'package:flutter/material.dart';

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
        body: const TabBarView(
          children: [
            // Subpage 1: Strats
            StratsView(),
            // Subpage 2: Rotas
            RoutesView(),
          ],
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
            leading: Icon(Icons.bug_report, color: Colors.deepPurple),
            title: Text('Needle Skip'),
            subtitle: Text('Use the needle lunge to bypass the gate in Moss Grotto.'),
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(Icons.air, color: Colors.deepPurple),
            title: Text('Bomb Pogo'),
            subtitle: Text('Bounce off enemy bombs to gain vertical height early.'),
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
            leading: Icon(Icons.timer, color: Colors.redAccent),
            title: Text('Any% NMG'),
            subtitle: Text('Estimated time: 45m. Focuses on critical path only.'),
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(Icons.check_circle_outline, color: Colors.green),
            title: Text('100% All Tools'),
            subtitle: Text('Estimated time: 3h 20m. Collects all tools and rosaries.'),
          ),
        ),
      ],
    );
  }
}