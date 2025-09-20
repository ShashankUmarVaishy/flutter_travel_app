import 'package:flutter/material.dart';

class User_Header extends StatelessWidget {
  const User_Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                );
  }
}