import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellowAccent,
      padding: EdgeInsets.symmetric( horizontal: 10 ),
      child: Center(
        child: FittedBox(
          fit: BoxFit.contain,
          child: Text(
            'Home view',
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