import 'package:flutter/material.dart';
import '../controllers/news_controller.dart';
import '../data/models/news.dart';

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  final controller = NewsController();
  List<News> newsList = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    final data = await controller.getNews();
    setState(() {
      newsList = data;
      isLoading = false;
    });
  }

  // 👇 Pull to refresh
  Future<void> refreshData() async {
    await loadData();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text("News")),
      body: RefreshIndicator(
        onRefresh: refreshData,
        child: ListView.builder(
          itemCount: newsList.length,
          itemBuilder: (context, index) {
            final item = newsList[index];

            return ListTile(
              leading: Image.network(
                item.image,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: Text(item.title),
              subtitle: Text(item.content),
            );
          },
        ),
      ),
    );
  }
}