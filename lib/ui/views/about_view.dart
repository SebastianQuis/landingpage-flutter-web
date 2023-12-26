import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pink,
      child: Center(
        child: FittedBox(
          fit: BoxFit.contain,
          child: Text(
            'About view',
            style: GoogleFonts.inter(
              fontSize: 80,
              fontWeight: FontWeight.w600
            ),
          ),
        ),
      ),
    );
  }
}