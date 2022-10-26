import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'fooderlich_theme.dart';
import 'screens/home.dart';
import 'models/models.dart';
import 'navigation/app_router.dart';
import 'myInheritedWidget.dart';

void main() {
  runApp(MyInheritedWidget(appData: MyInheritedData(isFavorite: false), child: const Fooderlich()));
}

class Fooderlich extends StatefulWidget {
  const Fooderlich({Key? key}) : super(key: key);

  @override
  _FooderlichState createState() => _FooderlichState();
}

class _FooderlichState extends State<Fooderlich> {
  final _groceryManager = GroceryManager();
  final _appStateManager = AppStateManager();
  late AppRouter _appRouter;

  @override
  void initState() {
    super.initState();
    _appRouter = AppRouter(
      appStateManager: _appStateManager,
      groceryManager: _groceryManager,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = FooderlichTheme.light();

    return MaterialApp(
      theme: theme,
      title: 'Fooderlich',
      home: Router(
        routerDelegate: _appRouter,
        backButtonDispatcher: RootBackButtonDispatcher(),
      ),
    );
  }
}

// home: MultiProvider(
//   providers: [
//     ChangeNotifierProvider(create: (context) => _appStateManager),
//     ChangeNotifierProvider(
//       create: (context) => GroceryManager(),
//     ),
//   ],
//   child: const Home(),
// ),