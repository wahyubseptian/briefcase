import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wahyubseptian_briefcase/page/home/home.dart';
import 'package:wahyubseptian_briefcase/page/welcome/welcome_page.dart';
import 'package:wahyubseptian_briefcase/theme/theme.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final homeRedirect = prefs.getBool("isFirstTime") ?? false;
  runApp(MyApp(
    redirectHome: homeRedirect,
  ));
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  bool? redirectHome = false;
  MyApp({
    super.key,
    this.redirectHome,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      builder: (context, _) {
        final themeProvider = Provider.of<ThemeProvider>(context);
        return MaterialApp(
          title: 'Briefcase',
          themeMode: themeProvider.themeMode,
          darkTheme: MyTheme.darkTheme,
          theme: MyTheme.lightTheme,
          home: redirectHome! ? const MyHomePage() : const WelcomeScreen(),
        );
      });
}
