import 'package:flutter/material.dart';

class ScreenA extends StatefulWidget {
  int counter;
  ScreenA({Key? key, required this.counter}) : super(key: key);

  @override
  State<ScreenA> createState() => _ScreenAState();
}

class _ScreenAState extends State<ScreenA> {
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
