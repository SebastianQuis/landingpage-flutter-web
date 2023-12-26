import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LocationView extends StatelessWidget {
  const LocationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      child: Center(
        child: FittedBox(
          fit: BoxFit.contain,
          child: Text(
            'Location view',
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