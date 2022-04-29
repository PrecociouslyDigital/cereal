import 'package:cereal/menus/routes.dart';
import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';

part 'bottomnav.g.dart';

@swidget
Widget bottomNavBar(BuildContext ctx) {
  return BottomNavBarTheme(
      child: Row(
    children: const <Widget>[
      BottomNavBarIcon(
        icon: Icons.library_books,
        text: 'Library',
        route: '/library',
        key: Key('library'),
      ),
      BottomNavBarIcon(
        icon: Icons.new_releases,
        text: 'Updates',
        route: '/updates',
        key: Key('updates'),
      ),
      BottomNavBarIcon(
        icon: Icons.history,
        text: 'History',
        route: '/history',
        key: Key('history'),
      ),
      BottomNavBarIcon(
        icon: Icons.browser_updated,
        text: 'Browse',
        route: '/browse',
        key: Key('Browse'),
      ),
      BottomNavBarIcon(
          icon: Icons.settings, text: 'More', route: '/more', key: Key('more')),
    ],
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  ));
}

@swidget
Widget _bottomNavBarTheme(BuildContext ctx, {required Widget child}) {
  return BottomAppBar(
      child: IconTheme(data: const IconThemeData(), child: child),
      color: Colors.blue);
}

@swidget
Widget _bottomNavBarIcon(
  BuildContext ctx, {
  required IconData icon,
  required String text,
  required String route,
}) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    child: GestureDetector(
      onTap: () => Navigator.pushNamed(ctx, route),
      child: Column(
        children: <Widget>[Icon(icon), Text(text)],
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      ),
    ),
  );
}
