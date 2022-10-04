part of 'explore_recipe.dart';

class Instruction {
  late String imageUrl;
  late String description;
  late int durationInMinutes;

  Instruction({this.imageUrl, this.description, this.durationInMinutes});

  Instruction.fromJson(Map<String, dynamic> json) {
    imageUrl = json['imageUrl'] ?? '';
    description = json['description'] ?? '';
    durationInMinutes = json['durationInMinutes'] ?? 0;
  }
}
