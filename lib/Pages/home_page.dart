import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:front_end/widgets/category_card.dart';
import 'package:front_end/widgets/plan_section_home.dart';
import 'package:front_end/widgets/search_bar.dart';
import 'package:front_end/widgets/user_header.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> categories = [];

  @override
  void initState() {
    super.initState();
    loadCategories();
  }

  Future<void> loadCategories() async {
    final String response = await rootBundle.loadString(
      'assets/files/categories.json',
    );
    final data = json.decode(response);
    setState(() {
      categories = data['categories'];
    });
  }

  final Map<String, IconData> iconMapping = {
    "beach_access": Icons.beach_access,
    "flight": Icons.flight,
    "shopping_cart": Icons.shopping_cart,
    "home": Icons.home,
    "camera": Icons.camera,
  };

  @override
  Widget build(BuildContext context) {
    return Material(
      
      child: Scaffold(
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.zero,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.deepPurple, // background for the group
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
        
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  const SizedBox(height: 22),
                   
                  //User Header
                  User_Header(),
        
                  const SizedBox(height: 12),
        
                  // Plan Section
                  PlanSection(),
        
                  const SizedBox(height: 12),
        
                  // Search Bar
                  MySearchBar(),
        
                ],
              ),
            ),
        
            const SizedBox(height: 20),
        
            // CAtegory text/ heading
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: const Text(
                "Categories",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
        
            const SizedBox(height: 10),
        
            // Category List
            Expanded(
              child: ListView.builder(
                itemCount: categories.length,
                padding: const EdgeInsets.all(8),
                itemBuilder: (context, index) {
                  final cat = categories[index];
                  return CategoryCard(
                    imageUrl: cat['imageUrl'],
                    title: cat['title'],
                    logo_type: iconMapping[cat['logotype']] ?? Icons.bolt_sharp,
                    route: cat['route'],
                  );
                },
              ),
            ),
        
            const SizedBox(height: 20),
        
          ],
        ),
      ),
    );
  }
}
