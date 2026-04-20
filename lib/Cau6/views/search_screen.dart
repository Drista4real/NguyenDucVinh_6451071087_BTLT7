import 'package:flutter/material.dart';
import '../controllers/product_controller.dart';
import '../data/models/product.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final controller = ProductController();
  List<Product> results = [];
  bool isLoading = false;

  void search(String keyword) async {
    if (keyword.isEmpty) {
      setState(() => results = []);
      return;
    }

    setState(() => isLoading = true);

    try {
      final data = await controller.search(keyword);
      setState(() => results = data);
    } catch (e) {
      print(e);
    }

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Search Product")),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Nhập keyword...",
                border: OutlineInputBorder(),
              ),
              onChanged: search,
            ),
          ),

          if (isLoading)
            CircularProgressIndicator(),

          Expanded(
            child: ListView.builder(
              itemCount: results.length,
              itemBuilder: (context, index) {
                final p = results[index];

                return ListTile(
                  title: Text(p.title),
                  subtitle: Text("Price: ${p.price}"),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}