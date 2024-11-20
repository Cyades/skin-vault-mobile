import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:skin_vault/screens/menu.dart';
import 'package:skin_vault/widgets/left_drawer.dart';

class SkinEntryFormPage extends StatefulWidget {
  const SkinEntryFormPage({super.key});

  @override
  State<SkinEntryFormPage> createState() => _SkinEntryFormPageState();
}

class _SkinEntryFormPageState extends State<SkinEntryFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  String _weapon = "";
  String _exterior = "";
  String _category = "";
  String _quality = "";
  double _price = 0.0; // Gunakan double untuk kompatibilitas decimal
  String _description = "";
  int _quantity = 0;
  int _user = 1; // Default user ID, bisa diubah sesuai implementasi
  DateTime _time = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Form Tambah Skin',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTextField(
                label: "Name",
                hint: "Skin Name",
                onChanged: (value) => _name = value ?? "",
              ),
              _buildTextField(
                label: "Weapon",
                hint: "Weapon Type",
                onChanged: (value) => _weapon = value ?? "",
              ),
              _buildTextField(
                label: "Exterior",
                hint: "Exterior",
                onChanged: (value) => _exterior = value ?? "",
              ),
              _buildTextField(
                label: "Category",
                hint: "Category",
                onChanged: (value) => _category = value ?? "",
              ),
              _buildTextField(
                label: "Quality",
                hint: "Quality",
                onChanged: (value) => _quality = value ?? "",
              ),
              _buildNumberField(
                label: "Price",
                hint: "Price (e.g., 1000.0)",
                onChanged: (value) =>
                    _price = double.tryParse(value ?? "0.0") ?? 0.0,
              ),
              _buildTextField(
                label: "Description",
                hint: "Skin Description",
                maxLines: 3,
                onChanged: (value) => _description = value ?? "",
              ),
              _buildNumberField(
                label: "Quantity",
                hint: "Skin Quantity",
                onChanged: (value) =>
                    _quantity = int.tryParse(value ?? "0") ?? 0,
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32.0, vertical: 12.0),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      final response = await request.postJson(
                        "http://127.0.0.1:8000/create-flutter/",
                        jsonEncode(<String, dynamic>{
                          'name': _name,
                          'weapon': _weapon,
                          'exterior': _exterior,
                          'category': _category,
                          'quality': _quality,
                          'price': _price,
                          'description': _description,
                          'quantity': _quantity,
                          'user': _user,
                          'time': _time.toIso8601String(),
                        }),
                      );
                      if (context.mounted) {
                        if (response['status'] == 'success') {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                "Skin baru berhasil disimpan!",
                                style: TextStyle(color: Colors.white),
                              ),
                              backgroundColor: Colors.green,
                            ),
                          );
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MyHomePage(),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                "Terdapat kesalahan, silakan coba lagi.",
                                style: TextStyle(color: Colors.white),
                              ),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      }
                    }
                  },
                  child: const Text(
                    "Save",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required String hint,
    required Function(String?) onChanged,
    int maxLines = 1,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: hint,
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        onChanged: onChanged,
        maxLines: maxLines,
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return "$label tidak boleh kosong!";
          }
          return null;
        },
      ),
    );
  }

  Widget _buildNumberField({
    required String label,
    required String hint,
    required Function(String?) onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: hint,
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        onChanged: onChanged,
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return "$label tidak boleh kosong!";
          }
          if (double.tryParse(value) == null) {
            return "$label harus berupa angka!";
          }
          return null;
        },
      ),
    );
  }
}
