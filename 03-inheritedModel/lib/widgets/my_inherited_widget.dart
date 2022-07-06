import 'package:flutter/material.dart';

class MyInheritedWidget extends InheritedModel<int> {
  final MyCounterWidgetState data;

  const MyInheritedWidget({Key? key, required this.data, required super.child})
      : super(key: key);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return child != oldWidget;
  }

  @override
  bool updateShouldNotifyDependent(
      covariant InheritedModel<int> oldWidget, Set<int> dependencies) {
    if (dependencies.contains(0)) {
      return true;
    } else {
      return false;
    }
  }
}

class MyCounterWidget extends StatefulWidget {
  final Widget child;
  const MyCounterWidget({Key? key, required this.child}) : super(key: key);

  // //Of method is created
  // static MyCounterWidgetState of(BuildContext context) {
  //   final MyCounterWidgetState? widgetState =
  //       context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>()?.data;
  //   assert(widgetState != null);
  //   return widgetState!;
  // }

  @override
  State<MyCounterWidget> createState() => MyCounterWidgetState();
}

class MyCounterWidgetState extends State<MyCounterWidget> {
  int _counter = 0;

  int get counterValue => _counter;

  void incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  //In the build method InheritedWidget is returned with this widget as data
  //and it's child as InheritedWidget's child
  @override
  Widget build(BuildContext context) {
    return MyInheritedWidget(data: this, child: widget.child);
  }
}
