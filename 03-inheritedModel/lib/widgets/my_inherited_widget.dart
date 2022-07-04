import 'package:flutter/material.dart';

class MyInheritedWidget extends InheritedModel<int>{

  MyInheritedWidget({required super.child});

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    throw UnimplementedError();
  }

  @override
  bool updateShouldNotifyDependent(covariant InheritedModel<int> oldWidget, Set<int> dependencies) {
    // TODO: implement updateShouldNotifyDependent
    throw UnimplementedError();
  }

}