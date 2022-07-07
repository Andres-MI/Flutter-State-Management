import 'package:flutter/material.dart';

class MyInheritedModel extends InheritedModel<int> {
  final MyCounterWidgetState data;

  const MyInheritedModel({Key? key, required this.data, required super.child})
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
  int _counterA = 0;
  int _counterB = 0;

  int get counterAValue => _counterA;
  int get counterBValue => _counterB;

  void incrementCounterA() {
    setState(() {
      _counterA++;
    });
  }
  void incrementCounterB() {
    setState(() {
      _counterB++;
    });
  }

  void resetCounters() {
    setState(() {
      _counterA = 0;
      _counterB = 0;
    });
  }

  //In the build method InheritedWidget is returned with this widget as data
  //and it's child as InheritedWidget's child
  @override
  Widget build(BuildContext context) {
    return MyInheritedModel(data: this, child: widget.child);
  }
}
