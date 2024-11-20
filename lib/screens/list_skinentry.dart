import 'dart:math';
import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:skin_vault/models/skin_entry.dart';
import 'package:skin_vault/widgets/left_drawer.dart';
import 'package:skin_vault/screens/skin_detail_page.dart';

class SkinEntryPage extends StatefulWidget {
  const SkinEntryPage({super.key});

  @override
  State<SkinEntryPage> createState() => _SkinEntryPageState();
}

class _SkinEntryPageState extends State<SkinEntryPage> {
  Future<List<SkinEntry>> fetchSkin(CookieRequest request) async {
    final response = await request.get('http://127.0.0.1:8000/json/');
    var data = response;

    List<SkinEntry> listSkin = [];
    for (var d in data) {
      if (d != null) {
        listSkin.add(SkinEntry.fromJson(d["fields"]));
      }
    }
    print(listSkin);
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
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.data.length == 0) {
              return const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    const Text(
                      'Sorry, no skins are available yet!',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => Card(
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
                            skinEntry: snapshot.data![index],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${snapshot.data![index].fields.Skin}",
                            style: const TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text("${snapshot.data![index].fields.skin}"),
                          const SizedBox(height: 10),
                          Text("${snapshot.data![index].fields.quality}"),
                          const SizedBox(height: 10),
                          Text("Quantity: ${snapshot.data![index].fields.quantity}"),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }
          }
        },
      ),
    );
  }
}
