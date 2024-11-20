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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Skin Name
            Text(
              skinEntry.fields.name,
              style: const TextStyle(
                fontSize: 26.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            
            // Weapon
            Text(
              "Weapon: ${skinEntry.fields.weapon}",
              style: const TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 8),
            
            // Exterior
            Text(
              "Exterior: ${skinEntry.fields.exterior}",
              style: const TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 8),
            
            // Category
            Text(
              "Category: ${skinEntry.fields.category}",
              style: const TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 8),
            
            // Quality
            Text(
              "Quality: ${skinEntry.fields.quality}",
              style: const TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 8),
            
            // Price
            Text(
              "Price: \$${skinEntry.fields.price}",
              style: const TextStyle(
                fontSize: 18.0,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            
            // Quantity Available
            Text(
              "Quantity Available: ${skinEntry.fields.quantity}",
              style: const TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 16),
            
            // Description
            Text(
              "Description:",
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              skinEntry.fields.description,
              style: const TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 32),
            
            // Add to Cart Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        "${skinEntry.fields.name} has been added to the cart!",
                        style: const TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Theme.of(context).colorScheme.primary,
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 12,
                  ),
                ),
                child: const Text(
                  "Add to Cart",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
