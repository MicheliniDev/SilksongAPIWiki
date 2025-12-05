import 'package:flutter/material.dart';
import '../models/timeline_item.dart';
import '../services/api_service.dart';
import 'credits_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/app_background.dart';

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
  }

  void filterItems(String query) {
    setState(() {
      searchQuery = query;
      filteredItems = timelineItems.where((item) {
        final text = '${item.title} ${item.category}'.toLowerCase();
        return text.contains(query.toLowerCase());
      }).toList();
    });
  }

  void openSource(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Não foi possível abrir o link')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.red, // 🔴 AppBar vermelha
          elevation: 0,
          iconTheme: const IconThemeData(
            color: Colors.white, // ícones brancos
          ),
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
          title: const Text('Silksong Timeline'),
          actions: [
            IconButton(
              icon: const Icon(Icons.info_outline, color: Colors.white),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CreditsScreen()),
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(14),
              child: TextField(
                onChanged: filterItems,
                style: const TextStyle(color: Colors.black87),
                decoration: InputDecoration(
                  hintText: 'Buscar...',
                  hintStyle: const TextStyle(color: Colors.black54),
                  prefixIcon: const Icon(Icons.search, color: Colors.black54),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filteredItems.length,
                itemBuilder: (_, i) {
                  final item = filteredItems[i];
                  return Card(
                    child: ListTile(
                      leading:
                          const Icon(Icons.bookmark, color: Colors.redAccent),
                      title: Text(item.title),
                      subtitle: Text(item.description),
                      trailing: IconButton(
                        icon: const Icon(Icons.open_in_new,
                            color: Colors.redAccent),
                        onPressed: () => openSource(item.source),
                      ),
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
