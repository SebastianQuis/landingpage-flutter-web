import 'package:fluro/fluro.dart';

import 'package:provider/provider.dart';

import 'package:landing_page/ui/pages/home_page.dart';
import 'package:landing_page/providers/pageview_provider.dart';

final Handler homeHandler = Handler(
  handlerFunc: (context, params) {
    final page = params['page']!.first;
    
    if (page != '/') {
      final pageViewProvider = Provider.of<PageViewProvider>(context!, listen: false);
      pageViewProvider.createScrollController(page);

      return HomePage();
    }
    return null;  
  },
);