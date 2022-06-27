import 'package:flutter/material.dart';

class MyInheritedWidget extends InheritedWidget {
  final MyCounterWidgetState data;
  const MyInheritedWidget({Key? key, required this.data, required Widget child})
      : super(key: key, child: child);

  //Extending InheritedWidget will prompt us to override this method
  //This method will be fired whenever anything in your widget has been updated checking for changes
  //If this method returns true, widget is rebuilt
  @override
  bool updateShouldNotify(MyInheritedWidget oldWidget) {
    //Widget will be rebuilt when our data (in this case, counter) has changed
    return oldWidget != child;
  }
}

class MyCounterWidget extends StatefulWidget {
  final Widget child;
  const MyCounterWidget({Key? key, required this.child}) : super(key: key);

  static MyInheritedWidget of(BuildContext context) {
    final MyInheritedWidget? widget =
        context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>();
    assert(widget != null);
    return widget!;
  }

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

  //In the build method InheritedWidget is returned with this widget as data
  //and it's child as InheritedWidget's child
  @override
  Widget build(BuildContext context) {
    return MyInheritedWidget(data: this, child: widget.child);
  }
}
