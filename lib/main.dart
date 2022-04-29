import 'package:cereal/menus/routes.dart';
import 'package:cereal/redux/state.dart' as state;
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:flutter/material.dart';

import 'menus/updates/updates.dart';

void main() {
  buildRoutes();
  runApp(Cereal(
    store: state.store,
  ));
}

class Cereal extends StatelessWidget {
  final Store<state.State> store;

  Cereal({Key? key, required this.store}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StoreProvider<state.State>(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: router.generator,
        initialRoute: '/library',
      ),
      store: store,
    );
  }
}
