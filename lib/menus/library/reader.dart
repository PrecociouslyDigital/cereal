import 'package:flutter/material.dart';
import 'package:cereal/menus/bottomnav.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';

import '../../redux/sources/chapter.dart';
import '../../redux/state.dart' as state;
import '../../redux/sources/works.dart';
import '../../resolvers/resolver.dart';

class ChapterPage extends StatelessWidget {
  final String workId;
  final String chapterId;
  const ChapterPage({Key? key, required this.workId, required this.chapterId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return state.StoreConnector<Chapter>(
      converter: (store) => store.state.works[workId]!.chapters[chapterId]!,
      builder: (context, works) => Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: const Text('Chapter'),
        ),
        bottomNavigationBar: const BottomNavBar(),
      ),
    );
  }
}
