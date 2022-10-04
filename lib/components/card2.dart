import 'package:flutter/material.dart';
import 'author_card.dart';
import '/fooderlich_theme.dart';
import '/models/models.dart';

class Card2 extends StatelessWidget {
  final ExploreRecipe recipe;

  const Card2({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints.expand(width: 350, height: 450),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(recipe.backgroundImage.toString()),
                fit: BoxFit.cover),
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        child: Column(
          children: [
            const AuthorCard(
                authorName: recipe.authorName.toString(),
                title: recipe.role.toString(),
                imageProvider: AssetImage(recipe.profileImage.toString())),
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                    bottom: 16,
                    right: 16,
                    child: Text(
                      recipe.title.toString(),
                      style: FooderlichTheme.lightTextTheme.headline1,
                    ),
                  ),
                  Positioned(
                    bottom: 70,
                    left: 16,
                    child: RotatedBox(
                      quarterTurns: 3,
                      child: Text(
                        recipe.subtitle.toString(),
                        style: FooderlichTheme.lightTextTheme.headline1,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
