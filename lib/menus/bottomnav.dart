import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';

part 'bottomnav.g.dart';

@swidget
Widget bottomNavBar(BuildContext ctx) {
  return _bottomNavBarTheme(ctx,
      child: Row(
        children: <Widget>[
          _bottomNavBarIcon(ctx, icon: Icons.library_books, text: 'Library'),
          _bottomNavBarIcon(ctx, icon: Icons.new_releases, text: 'Updates'),
          _bottomNavBarIcon(ctx, icon: Icons.history, text: 'History'),
          _bottomNavBarIcon(ctx, icon: Icons.browser_updated, text: 'Browse'),
          _bottomNavBarIcon(ctx, icon: Icons.settings, text: 'More'),
        ],
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      ));
}

@swidget
Widget _bottomNavBarTheme(BuildContext ctx, {required Widget child}) {
  return BottomAppBar(
      child: IconTheme(data: IconThemeData(), child: child),
      color: Colors.blue);
}

@swidget
Widget _bottomNavBarIcon(BuildContext ctx,
    {required IconData icon, required String text}) {
  return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Column(
        children: <Widget>[Icon(icon), Text(text)],
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      ));
}
