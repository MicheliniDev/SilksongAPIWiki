import 'package:flutter/material.dart';
import '../models/timeline_item.dart';
import '../services/api_service.dart';
import 'credits_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ApiService apiService = ApiService();

  List<TimelineItem> timelineItems = [];
  List<TimelineItem> filteredItems = [];
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    final items = await apiService.fetchTimeline();
    setState(() {
      timelineItems = items;
      filteredItems = items;
    });

    // Debug: imprime os títulos no console para conferir
    print(items.map((e) => e.title).toList());
  }

  void filterItems(String query) {
    final filtered = timelineItems
        .where((item) =>
            item.title.toLowerCase().contains(query.toLowerCase()) ||
            item.category.toLowerCase().contains(query.toLowerCase()))
        .toList();
    setState(() {
      filteredItems = filtered;
      searchQuery = query;
    });
  }

  void openSource(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Não foi possível abrir o link')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hollow Knight: Silksong'),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CreditsScreen()));
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                  labelText: 'Pesquisar por título ou categoria',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.search)),
              onChanged: filterItems,
            ),
            const SizedBox(height: 12),
            Expanded(
              child: filteredItems.isEmpty
                  ? const Center(child: Text('Nenhum item encontrado'))
                  : ListView.builder(
                      itemCount: filteredItems.length,
                      itemBuilder: (context, index) {
                        final item = filteredItems[index];
                        return Card(
                          elevation: 3,
                          margin: const EdgeInsets.symmetric(vertical: 6),
                          child: ListTile(
                            title: Text(item.title),
                            subtitle: Text('${item.date} • ${item.category}'),
                            trailing: const Icon(Icons.open_in_new),
                            onTap: () => openSource(item.source),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
