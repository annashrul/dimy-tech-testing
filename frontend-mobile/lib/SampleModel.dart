// To parse this JSON data, do
//
//     final sampleModel = sampleModelFromJson(jsonString);

import 'dart:convert';

List<SampleModel> sampleModelFromJson(String str) => List<SampleModel>.from(json.decode(str).map((x) => SampleModel.fromJson(x)));

String sampleModelToJson(List<SampleModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SampleModel {
  SampleModel({
    this.title,
    this.description,
    this.ingredients,
    this.image,
    this.id,
  });

  String title;
  String description;
  List<String> ingredients;
  String image;
  int id;

  factory SampleModel.fromJson(Map<String, dynamic> json) => SampleModel(
    title: json["title"],
    description: json["description"],
    ingredients: List<String>.from(json["ingredients"].map((x) => x)),
    image: json["image"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "description": description,
    "ingredients": List<dynamic>.from(ingredients.map((x) => x)),
    "image": image,
    "id": id,
  };
}
