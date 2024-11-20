import 'package:flutter/material.dart';
import 'package:skin_vault/models/skin_entry.dart';

class SkinDetailPage extends StatelessWidget {
  final SkinEntry skinEntry;

  const SkinDetailPage({super.key, required this.skinEntry});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          skinEntry.fields.name,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Skin Name: ${skinEntry.fields.name}",
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              "Category: ${skinEntry.fields.category}",
              style: const TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 16),
            Text(
              "Quality: ${skinEntry.fields.quality}",
              style: const TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 16),
            Text(
              "Quantity Available: ${skinEntry.fields.quantity}",
              style: const TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                // Logika tambahan dapat ditambahkan di sini
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Action coming soon!')),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
              ),
              child: const Text(
                "Add to Cart",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
