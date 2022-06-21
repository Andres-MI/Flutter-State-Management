import 'package:flutter/material.dart';

class ScreenB extends StatelessWidget {
  const ScreenB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen B'),
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
