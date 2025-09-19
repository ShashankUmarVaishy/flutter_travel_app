import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:front_end/widgets/category_card.dart';

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
      //backgroundColor: Colors.grey[200],
      child: Column(
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
                // Header
                Container(
                  padding: const EdgeInsets.all(16),

                  child: Row(
                    children: [
                      const CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 20,
                        child: Icon(Icons.person, color: Colors.deepPurple),
                      ),
                      const SizedBox(width: 10),
                      const Expanded(
                        child: Text(
                          "Shashank Umar Vaishy",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                      // Icon(Icons.notifications, color: Colors.white),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Colors.white24,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.notifications,
                          color: Colors.white,
                          size: 22,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 12),

                // Plan Section
                Container(
                  padding: const EdgeInsets.only(
                    top: 4,
                    bottom: 12,
                    left: 4,
                    right: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.purple[50],
                    borderRadius: BorderRadius.circular(29),
                    border: Border.all(color: Colors.deepPurpleAccent),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 4,
                          vertical: 1,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.deepPurple, // background color
                          borderRadius: BorderRadius.circular(
                            30,
                          ), // rounded background
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 6,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Text(
                                "Free plan",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),

                            Chip(
                              label: Text("Bid left: 3"),
                              backgroundColor: Colors.white,
                              labelStyle: TextStyle(
                                color: Colors.deepPurple,
                                fontWeight: FontWeight.bold,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 4,
                          horizontal: 10,
                        ),
                        child: const Text(
                          "You have 3 bids left. Upgrade now to Bid more.",
                          style: TextStyle(
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 12),

                // Search Bar
                SizedBox(
                  height: 40,
                  child: Center(
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        hintText: "Search",
                        filled: true,
                        fillColor: Colors.deepPurple.shade100,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Categories
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: const Text(
              "Categories",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),

          const SizedBox(height: 10),

          //Caategories list
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
                );
              },
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
