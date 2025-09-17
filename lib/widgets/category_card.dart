import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final IconData logo_type;

  

  // const CategoryCard({super.key, required this.imageUrl, required this.title,required this.logo_type});
    const CategoryCard({
      Key? key,
      required this.imageUrl,
      required this.title,
      required this.logo_type,
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 199, 199, 199),
            blurRadius: 3,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Column(
          children: [
            Image.asset(
              imageUrl,
              height: 200,
              width: 300,
              fit: BoxFit.cover,
            ),
            Row(
              children: [
                Container(
                  // padding: const EdgeInsets.all(8), 
                  height: 38,
                  width: 46,
                  decoration: BoxDecoration(
                    color: Colors.purple.shade50, 
                    borderRadius: BorderRadius.circular(19), 
                  ),
                  child:  Center(
                    child: Icon(
                      logo_type,
                      color: Colors.purple, // icon color
                      size: 24,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ), // spacing between icon container & text
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

   