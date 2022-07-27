import 'package:flutter/material.dart';
import 'package:inherited_model/widgets/my_inherited_model.dart';

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
    print('ScreenBody built');
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CustomText1(),
              Text('    -    '),
              CustomText2(),
            ],
          ),
          const SizedBox(
            height: 16.0,
          ),
          ElevatedButton(
              onPressed: () {
                InheritedModel.inheritFrom<MyInheritedModel>(context, aspect: 0)
                    ?.data
                    .incrementCounterA();
              },
              child: const Text('+')),
        ],
      ),
    );
  }
}

class CustomText1 extends StatelessWidget {
  const CustomText1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('CustomText1 built');
    return Text(
      '${InheritedModel.inheritFrom<MyInheritedModel>(context, aspect: 0)?.data.counterAValue}',
      style: Theme.of(context).textTheme.headline4,
    );
  }
}

class CustomText2 extends StatelessWidget {
  const CustomText2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('CustomText2 built');
    return Text(
      //Change the aspect to 1 not to build this widget!
      '${InheritedModel.inheritFrom<MyInheritedModel>(context, aspect: 0)?.data.counterBValue}',
      style: Theme.of(context).textTheme.headline4,
    );
  }
}
