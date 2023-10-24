import 'package:flutter/material.dart';
import 'package:wahyubseptian_briefcase/theme/change_theme.dart';
import 'package:wahyubseptian_briefcase/tools/extension.dart';

class MyHomePage extends StatefulWidget {
  static const routeName = '/homePage';

  const MyHomePage({
    super.key,
  });

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
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          'Tinet Briefcase',
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
