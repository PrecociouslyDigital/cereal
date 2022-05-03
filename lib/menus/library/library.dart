import 'package:flutter/material.dart';
import 'package:cereal/menus/bottomnav.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';

import '../../redux/state.dart' as state;
import '../../redux/sources/works.dart';
import '../../resolvers/resolver.dart';
import '../routes.dart';

part 'library.g.dart';

class LibraryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text('Library'),
      ),
      bottomNavigationBar: const BottomNavBar(),
      body: state.StoreConnector<List<Work>>(
        converter: (store) => store.state.works.toValueList(),
        builder: (context, works) =>
            works.isEmpty ? const AddWork() : WorkList(works),
      ),
    );
  }
}

@swidget
Widget addWork(BuildContext ctx) => ListView.builder(
    itemCount: 1,
    itemBuilder: (context, index) => state.StoreConnector<VoidCallback>(
        converter: (store) => () async => store.dispatch(
            AddWorkAction(await Resolvers.ao3.resolver.getWork('23949661'))),
        builder: (context, callback) => InkWell(
              onTap: callback,
              child: const ListTile(
                title: Text('Add Test Work'),
                subtitle: Text('Do It'),
              ),
            )));

@swidget
Widget workList(BuildContext ctx, List<Work> works) => ListView.builder(
      itemCount: works.length,
      itemBuilder: (context, index) => InkWell(
          onTap: () => router.navigateTo(context, works[index].id),
          child: ListTile(
              title: Text(works[index].title),
              subtitle: Text(works[index].author))),
    );
