import 'package:flutter/material.dart';
import 'package:inherited_widget/screens/screen_a.dart';
import 'package:inherited_widget/screens/screen_b.dart';
import 'package:inherited_widget/widgets/my_inherited_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
    print('Homepage built');
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
              //Now counterValue is accessible to every child in the widget tree
              '${MyCounterWidget.of(context).counterValue}',
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
                    onPressed: _navigateToScreenB,
                    child: const Text('Screen B'))
              ],
            ),
            const SizedBox(
              height: 32.0,
            ),
            ElevatedButton(
                onPressed: () {
                  MyCounterWidget.of(context).resetCounter();
                },
                child: const Text('Reset counter'))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          MyCounterWidget.of(context).incrementCounter();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
