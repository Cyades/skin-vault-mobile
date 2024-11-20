import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:skin_vault/models/skin_entry.dart';
import 'package:skin_vault/screens/skin_detail_page.dart';
import 'package:skin_vault/widgets/left_drawer.dart';

class SkinEntryPage extends StatefulWidget {
  const SkinEntryPage({super.key});

  @override
  State<SkinEntryPage> createState() => _SkinEntryPageState();
}

class _SkinEntryPageState extends State<SkinEntryPage> {
  Future<List<SkinEntry>> fetchSkin(CookieRequest request) async {
    final response = await request.get('http://127.0.0.1:8000/json/');

    List<SkinEntry> listSkin = [];
    for (var d in response) {
      if (d != null) {
        // Amankan data untuk mencegah potensi XSS
        final sanitizedFields = Fields.fromJson(d["fields"]);
        listSkin.add(SkinEntry(
          model: d["model"],
          pk: d["pk"],
          fields: sanitizedFields,
        ));
      }
    }
    return listSkin;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Skin Entry List',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        future: fetchSkin(request),
        builder: (context, AsyncSnapshot<List<SkinEntry>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error: ${snapshot.error}',
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text(
                'Sorry, no skins are available yet!',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (_, index) {
                final skin = snapshot.data![index];
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 6,
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SkinDetailPage(
                            skinEntry: skin,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            skin.fields.name,
                            style: const TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text("Weapon: ${skin.fields.weapon}"),
                          Text("Exterior: ${skin.fields.exterior}"),
                          Text("Category: ${skin.fields.category}"),
                          Text("Quality: ${skin.fields.quality}"),
                          const SizedBox(height: 10),
                          Text("Price: \$${skin.fields.price}"),
                          Text("Quantity: ${skin.fields.quantity}"),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
