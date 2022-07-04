import 'package:flutter/material.dart';
import 'package:inherited_model/screens/screen_a.dart';
import 'package:inherited_model/screens/screen_b.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counterA = 0;
  int _counterB = 0;

  void _incrementCounterA() {
    setState(() {
      _counterA++;
    });
  }

  void _incrementCounterB() {
    setState(() {
      _counterB++;
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
              'You have pushed the buttons this many times:',
            ),
            Text(
              '$_counterA  -  $_counterB',
              style: Theme.of(context).textTheme.headline4,
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
                    onPressed: _navigateToScreenB,
                    child: const Text('Screen B'))
              ],
            ),
            const SizedBox(
              height: 32.0,
            ),
            ElevatedButton(onPressed: () {}, child: const Text('Reset counter'))
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: _incrementCounterA,
            tooltip: 'Increment A',
            heroTag: null,
            child: const Icon(Icons.add),
          ),
          const SizedBox(
            width: 32,
          ),
          FloatingActionButton(
            onPressed: _incrementCounterB,
            tooltip: 'Increment B',
            heroTag: null,
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
