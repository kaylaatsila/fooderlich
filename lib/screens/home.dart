import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fooderlich/screens/recipes_screen.dart';
import '../components/components.dart';
import '../models/models.dart';
import 'explore_screen.dart';
import 'grocery_screen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  bool isFavorited = false;

  static List<Widget> pages = <Widget>[
    ExploreScreen(),
    RecipesScreen(),
    const GroceryScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TabManager>(
      builder: (context, tabManager, child) {
        return Scaffold(
            appBar: AppBar(
                title: Text('Fooderlich',
                    style: Theme.of(context).textTheme.headline6)),
            body: IndexedStack(index: tabManager.selectedTab, children: pages),
            bottomNavigationBar: BottomNavigationBar(
                selectedItemColor:
                    Theme.of(context).textSelectionTheme.selectionColor,
                currentIndex: tabManager.selectedTab,
                onTap: (index) {
                  tabManager.goToTab(index);
                },
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.explore),
                    label: 'Explore',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.book),
                    label: 'Recipes',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.list),
                    label: 'To Buy',
                  ),
                ]));
      },
    );
  }
}