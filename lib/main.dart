import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'fooderlich_theme.dart';
import 'models/models.dart';
import 'screens/screens.dart';
import 'navigation/app_router.dart';
import 'myInheritedWidget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appStateManager = AppStateManager();
  appStateManager.initializeApp();
  runApp(Fooderlich(appStateManager: appStateManager));
  // runApp(MyInheritedWidget(appData: MyInheritedData(isFavorite: false), child: const Fooderlich()));
}

class Fooderlich extends StatefulWidget {
  final AppStateManager appStateManager;

  const Fooderlich({Key? key, required this.appStateManager}) : super(key: key);

  @override
  _FooderlichState createState() => _FooderlichState();
}

class _FooderlichState extends State<Fooderlich> {
  final _groceryManager = GroceryManager();
  final _appStateManager = AppStateManager();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => _groceryManager,
        ),
        ChangeNotifierProvider(
          create: (context) => widget.appStateManager,
        ),
        // TODO: Add AppStateManager ChangeNotifierProvider
      ],
      builder: (context, child) {
        ThemeData theme;
        theme = FooderlichTheme.light();

        return MaterialApp(
          theme: theme,
          title: 'Fooderlich',
          // TODO: Replace with Router widget
          home: const SplashScreen(),
        );
      },
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