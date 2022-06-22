import 'package:flutter/material.dart';

class ScreenB extends StatefulWidget {
  int counter;
  ScreenB({Key? key, required this.counter}) : super(key: key);

  @override
  State<ScreenB> createState() => _ScreenBState();
}

class _ScreenBState extends State<ScreenB> {
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
              '${widget.counter}',
              style: Theme.of(context).textTheme.headline4,
            ),
            const SizedBox(height: 16.0,),
            ElevatedButton(
                onPressed: (){
                  setState((){
                    widget.counter++;
                  });
                },
                child: const Text('+')),
          ],
        ),
      ),
    );
  }
}
