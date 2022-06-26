import 'package:flutter/material.dart';

class MyInheritedWidget extends InheritedWidget {
  final int counter;
  const MyInheritedWidget(
      {Key? key, required this.counter, required Widget child})
      : super(key: key, child: child);

  //Extending InheritedWidget will prompt us to override this method
  //This method will be fired whenever anything in your widget has been updated checking for changes
  //If this method returns true, widget is rebuilt
  @override
  bool updateShouldNotify(MyInheritedWidget oldWidget) {
    //Widget will be rebuilt when our data (in this case, counter) has changed
    return oldWidget.counter != counter;
  }
}
