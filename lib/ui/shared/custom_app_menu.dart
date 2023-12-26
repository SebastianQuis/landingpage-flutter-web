import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:landing_page/providers/pageview_provider.dart';
import 'package:landing_page/ui/shared/custom_menu_item.dart';


class CustomAppMenu extends StatefulWidget {
  const CustomAppMenu({super.key});

  @override
  State<CustomAppMenu> createState() => _CustomAppMenuState();
}

class _CustomAppMenuState extends State<CustomAppMenu> with SingleTickerProviderStateMixin {
  bool isHover = false;
  bool isOpen = false;

  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 400))..addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    final pageViewProvider = Provider.of<PageViewProvider>(context);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      // cursor: SystemMouseCursors.text,
      // onEnter: (_) {
      //   setState(() {
      //     isHovered = true;
      //   });
      // },
      // onExit: (_) {
      //   setState(() {
      //     isHovered = false;
      //   });
      // },
      child: GestureDetector(
        onTap: () {
          if (isOpen) {
            controller.reverse();
          } else {
            Future.delayed(const Duration(milliseconds: 100));
            controller.forward();
          }

          setState(() {
            isOpen = !isOpen;
          });

        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          curve: Curves.easeInOut,
          decoration: BoxDecoration(
            color: Colors.black,
            boxShadow: [
              if( isHover )
                const BoxShadow(
                  color: Colors.black45,
                  blurRadius: 7.0,
                )
            ]
          ),
          width: 150,
          height: isOpen ? 310 : 50,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [

              _MenuTitleIcon(isOpen: isOpen, controller: controller),
              
              if(isOpen)
                ...[
                  CustomMenuItem( delay: 10,  onTap: () => pageViewProvider.goTo(0), title: 'Home'),
                  CustomMenuItem( delay: 40,  onTap: () => pageViewProvider.goTo(1), title: 'About'),
                  CustomMenuItem( delay: 70,  onTap: () => pageViewProvider.goTo(2), title: 'Contact'),
                  CustomMenuItem( delay: 100, onTap: () => pageViewProvider.goTo(3), title: 'Pricing'),
                  CustomMenuItem( delay: 130, onTap: () => pageViewProvider.goTo(4), title: 'Location'),
                  // SizedBox(height: 8,)
                ],

              
            ],
          )
        ),
      ),
    );
  }
}

class _MenuTitleIcon extends StatelessWidget {
  const _MenuTitleIcon({
    required this.isOpen,
    required this.controller,
  });

  final bool isOpen;
  final AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 50,
      child: Row(
        children: [
    
          // crea un container, cada que le da click
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: isOpen ? 42 : 0,
          ),
        
          Text('Menu', style: GoogleFonts.inter(
            color: Colors.white,
            fontSize: 16,
          )),
      
          const Spacer(),
        
          AnimatedIcon(
            icon: AnimatedIcons.menu_close,
            color: Colors.white,
            progress: controller,
          )
        
        ],
      ),
    );
  }
}
