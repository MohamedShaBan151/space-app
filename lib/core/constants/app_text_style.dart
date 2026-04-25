import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppTextStyle {
  static TextStyle boldtext = GoogleFonts.inter(
    fontSize: 48,
    fontWeight: FontWeight.w400,
  );
  static TextStyle buttontext = GoogleFonts.inter(
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );
  static TextStyle explorettext = GoogleFonts.inter(
    fontSize: 24,
    fontWeight: FontWeight.w700,
  );
  static TextStyle detailstext = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );
} 