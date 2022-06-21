import 'package:flutter/material.dart';
import 'package:set_state/screens/screen_a.dart';
import 'package:set_state/screens/screen_b.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

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

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  void _navigateToScreenA() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const ScreenA()));
  }

  void _navigateToScreenB() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const ScreenB()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            const SizedBox(
              height: 32.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: _navigateToScreenA,
                    child: const Text('Screen A')),
                const SizedBox(
                  width: 32.0,
                ),
                ElevatedButton(
                    onPressed: _navigateToScreenB, child: const Text('Screen B'))
              ],
            ),
            const SizedBox(
              height: 32.0,
            ),
            ElevatedButton(
                onPressed: _resetCounter, child: const Text('Reset counter'))
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
