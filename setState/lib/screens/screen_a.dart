import 'package:flutter/material.dart';

class ScreenA extends StatelessWidget {
  const ScreenA({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen A'),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '0',
              style: Theme.of(context).textTheme.headline4,
            ),
            const SizedBox(height: 16.0,),
            ElevatedButton(
                onPressed: (){},
                child: const Text('+')),
          ],
        ),
      ),
    );
  }
}
