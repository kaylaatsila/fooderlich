part of 'explore_recipe.dart';

class Ingredients {
  late String imageUrl;
  late String title;
  late String source;

  Ingredients({this.imageUrl, this.title, this.source});

  Ingredients.fromJson(Map<String, dynamic> json) {
    imageUrl = json['imageUrl'];
    title = json['title'];
    source = json['source'];
  }
}
