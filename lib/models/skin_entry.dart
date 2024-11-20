// To parse this JSON data, do
//
//     final skinEntry = skinEntryFromJson(jsonString);

import 'dart:convert';

List<SkinEntry> skinEntryFromJson(String str) => List<SkinEntry>.from(json.decode(str).map((x) => SkinEntry.fromJson(x)));

String skinEntryToJson(List<SkinEntry> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SkinEntry {
    String model;
    String pk;
    Fields fields;

    SkinEntry({
        required this.model,
        required this.pk,
        required this.fields,
    });

    factory SkinEntry.fromJson(Map<String, dynamic> json) => SkinEntry(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
    String name;
    String weapon;
    String exterior;
    String category;
    String quality;
    int price;
    String description;
    int quantity;
    int user;
    DateTime time;

    Fields({
        required this.name,
        required this.weapon,
        required this.exterior,
        required this.category,
        required this.quality,
        required this.price,
        required this.description,
        required this.quantity,
        required this.user,
        required this.time,
    });

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        name: json["name"],
        weapon: json["weapon"],
        exterior: json["exterior"],
        category: json["category"],
        quality: json["quality"],
        price: json["price"],
        description: json["description"],
        quantity: json["quantity"],
        user: json["user"],
        time: DateTime.parse(json["time"]),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "weapon": weapon,
        "exterior": exterior,
        "category": category,
        "quality": quality,
        "price": price,
        "description": description,
        "quantity": quantity,
        "user": user,
        "time": "${time.year.toString().padLeft(4, '0')}-${time.month.toString().padLeft(2, '0')}-${time.day.toString().padLeft(2, '0')}",
    };
}