
import 'package:flutter/material.dart';
import 'package:task1/widget/button.dart';
import 'package:task1/widget/input_text.dart';

class BodyApp extends StatelessWidget {
  const BodyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 75.0,
            backgroundImage: const AssetImage('assets/images.png'),
          ),
          const SizedBox(height: 20),
          const Text(
            "Welcome To Flutter",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 26,
            ),
          ),
          const SizedBox(height: 10),
          const Icon(Icons.star, color: Colors.yellow, size: 100),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.blueGrey),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Email"),
                const SizedBox(height: 5),
                InputText(),
                const SizedBox(height: 30),
                const Text("Password"),
                const SizedBox(height: 5),
                InputText(),
                const SizedBox(height: 30),
                Button(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

