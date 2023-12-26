import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:landing_page/providers/pageview_provider.dart';

import 'package:landing_page/ui/shared/custom_app_menu.dart';
import 'package:landing_page/ui/views/about_view.dart';
import 'package:landing_page/ui/views/contact_view.dart';
import 'package:landing_page/ui/views/home_view.dart';
import 'package:landing_page/ui/views/location_view.dart';
import 'package:landing_page/ui/views/pricing_view.dart';
 
class HomePage extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: gradientDecoration(),
        child: Stack(
          children: [

            _PageViewBody(),

            const Positioned(
              right: 20,
              top: 20,
              child: CustomAppMenu()
            ),


          ],
        ),
      )
    );
  }

  BoxDecoration gradientDecoration() {
    return const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.blue,
            Colors.blueGrey
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [
            0.5,
            0.5,
          ]
        ),
      );
  }
}


class _PageViewBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final pageViewProvider = Provider.of<PageViewProvider>(context);
    
    return PageView(
      controller: pageViewProvider.scrollController,
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      children: const [
        HomeView(),
        AboutView(),
        ContactView(),
        PricingView(),
        LocationView(),
      ],
    );
  }
}

