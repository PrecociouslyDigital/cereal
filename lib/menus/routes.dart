import 'package:fluro/fluro.dart';

import 'package:cereal/menus/browse/browse.dart';
import 'package:cereal/menus/history/history.dart';
import 'package:cereal/menus/library/library.dart';
import 'package:cereal/menus/more/more.dart';

import 'updates/updates.dart';

final router = FluroRouter.appRouter;

final Handler LibraryHandler =
    Handler(handlerFunc: (context, _) => LibraryPage());
final Handler BrowseHandler =
    Handler(handlerFunc: (context, _) => BrowsePage());
final Handler UpdatesHandler =
    Handler(handlerFunc: (context, _) => UpdatesPage());
final Handler HistoryHandler =
    Handler(handlerFunc: (context, _) => HistoryPage());
final Handler MoreHandler = Handler(handlerFunc: (context, _) => MorePage());

void buildRoutes() {
  router.define("/library", handler: LibraryHandler);
  router.define("/browse", handler: BrowseHandler);
  router.define("/updates", handler: UpdatesHandler);
  router.define("/history", handler: HistoryHandler);
  router.define("/more", handler: MoreHandler);

  router.notFoundHandler = LibraryHandler;
}
