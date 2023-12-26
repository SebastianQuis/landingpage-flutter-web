// import 'dart:html' as html;
import 'package:flutter/material.dart';

import 'package:universal_html/html.dart' as html;


class PageViewProvider extends ChangeNotifier {
  PageController scrollController = PageController();

  final List<String> _pageNames = ['home','about','contact','pricing','location'];
  int currentIndex = 0;

  createScrollController( String routeName) {
    scrollController = PageController( initialPage: getScrollIndex(routeName));
    html.document.title = _pageNames[ getScrollIndex(routeName) ];

    scrollController.addListener(() {
      final index = (scrollController.page ?? 0).round();
      if (index != currentIndex) {
        html.window.history.pushState(null, 'none', '#/${ _pageNames[index] }'); // CAMBIA NOMBRE DE URL
        currentIndex = index;
        html.document.title = _pageNames[currentIndex]; // NOMBRE DE LA VENTANA DE LA PAGINA, DONDE SALE EL ICONO
      }
    });
  }


  getScrollIndex( String routeName ) {
    return !_pageNames.contains(routeName)
      ? 0
      : _pageNames.indexOf(routeName);
  }


  goTo( int index ) {
    // html.window.history.pushState(null, 'none', '#/${ _pageNames[index] }');
    scrollController.animateToPage(
      index, 
      duration: const Duration(milliseconds: 300), 
      curve: Curves.easeInOut
    );
  }


}