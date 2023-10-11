import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wahyubseptian_briefcase/theme/change_theme.dart';
import 'package:wahyubseptian_briefcase/theme/theme.dart';
import 'package:wahyubseptian_briefcase/tools/extension.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
          home: const MyHomePage(title: 'Flutter Demo Home Page'),
        );
      });
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          widget.title,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        actions: const [ChangeTheme()],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'here im using a custom capitalize extension for string'
                  .capitalize(),
            ),
            const Text(
              'Briefcase App',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.airplanemode_inactive_sharp),
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
