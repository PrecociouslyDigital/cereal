import 'package:cereal/menus/routes.dart';
import 'package:flutter/material.dart';
import 'package:cereal/menus/bottomnav.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';

import '../../redux/sources/chapter.dart';
import '../../redux/state.dart' as state;
import '../../redux/sources/works.dart';
import '../../resolvers/resolver.dart';

part 'workPage.g.dart';

class WorkPage extends StatelessWidget {
  final String workId;

  const WorkPage({Key? key, required this.workId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return state.StoreConnector<Work>(
      converter: (store) => store.state.works[workId] ?? unknownWork(workId),
      builder: (context, work) => Scaffold(
        appBar: AppBar(
          title: Text(work.title),
        ),
        bottomNavigationBar: const BottomNavBar(),
        body: ChapterList(work.chapters.toValueList()),
      ),
    );
  }
}

@swidget
Widget chapterList(BuildContext ctx, List<Chapter> chapters) =>
    ListView.builder(
      itemCount: chapters.length,
      itemBuilder: (context, index) => InkWell(
          onTap: () => Navigator.pushNamed(context, chapters[index].id),
          child: ListTile(title: Text(chapters[index].title))),
    );
