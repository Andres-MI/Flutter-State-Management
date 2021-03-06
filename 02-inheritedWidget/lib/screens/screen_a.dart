import 'package:flutter/material.dart';

import '../widgets/my_inherited_widget.dart';

class ScreenA extends StatelessWidget {
  const ScreenA({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Screen A built');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen A'),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: const ScreenBody(),
    );
  }
}

class ScreenBody extends StatelessWidget {
  const ScreenBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Screen Body built');
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CustomText(),
          const SizedBox(
            height: 16.0,
          ),
          ElevatedButton(
              onPressed: () {
                MyCounterWidget.of(context).incrementCounter();
              },
              child: const Text('+')),
        ],
      ),
    );
  }
}

class CustomText extends StatelessWidget {
  const CustomText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Custom Text built');
    return Text(
      '${MyCounterWidget.of(context).counterValue}',
      style: Theme.of(context).textTheme.headline4,
    );
  }
}
