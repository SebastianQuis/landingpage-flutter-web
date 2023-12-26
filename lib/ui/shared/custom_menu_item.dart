import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomMenuItem extends StatefulWidget {
  final Function onTap;
  final String title;
  final int delay;
  
  const CustomMenuItem({
    super.key,
    required this.onTap,
    required this.title,
    this.delay = 0,
  });

  @override
  State<CustomMenuItem> createState() => _CustomMenuItemState();
}

class _CustomMenuItemState extends State<CustomMenuItem> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      from: 5.0,
      duration: const Duration(seconds: 1),
      delay: Duration(milliseconds: widget.delay),
      child: MouseRegion(
        onEnter: (_) {
          setState(() {
            isHover = true;
          });
        },
        onExit: (_) {
          setState(() {
            isHover = false;
          });
        },
        child: GestureDetector(
          onTap: () => widget.onTap(),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            width: 150,
            height: 50,
            color: isHover ? Colors.pink : Colors.black,
            // color: isho Colors.pink,
            child: Center(
              child: Text(
                widget.title,
                style: GoogleFonts.inter(
                  fontSize: 16,
                  color: Colors.white
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}