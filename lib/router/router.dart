import 'package:fluro/fluro.dart';

import 'package:landing_page/router/route_handler.dart';

class Flurorouter { 
  static final router = FluroRouter();

  static void configureRoutes() {    
    // RUTAS
    router.define('/:page', handler: homeHandler);

    // 404
    router.notFoundHandler = homeHandler;
  }
}

