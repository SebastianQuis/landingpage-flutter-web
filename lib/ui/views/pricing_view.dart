import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PricingView extends StatelessWidget {
  const PricingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pink,
      child: Center(
        child: FittedBox(
          fit: BoxFit.contain,
          child: Text(
            'Pricing view',
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