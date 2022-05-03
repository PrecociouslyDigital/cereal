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
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: router.generator,
        initialRoute: '/library',
      ),
      store: store,
    );
  }
}
