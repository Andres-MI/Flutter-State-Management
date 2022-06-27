import 'package:flutter/material.dart';
import 'package:inherited_widget/screens/homepage.dart';
import 'package:inherited_widget/widgets/my_inherited_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyCounterWidget(
          child: MyHomePage(title: 'Flutter Demo Home Page'),
        ));
  }
}
