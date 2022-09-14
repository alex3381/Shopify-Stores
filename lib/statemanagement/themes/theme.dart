import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//LightTheme
final ThemeData lightTheme = ThemeData(

  brightness: Brightness.light,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  scrollbarTheme: ScrollbarThemeData(
    radius: Radius.circular(4),
    interactive: true,
    thickness: MaterialStateProperty.all(6.5),
    minThumbLength: 1,
    mainAxisMargin: 1,
    crossAxisMargin: 1,
  ).copyWith(
    showTrackOnHover: true,
    thumbColor: MaterialStateProperty.all(Colors.black45.withOpacity(0.7))),

  colorScheme: ColorScheme.light(
    primary: Color(0xffff0814),
    secondary: Color(0xffff0814),
  ),
  textTheme: TextTheme(
      headline1: GoogleFonts.electrolize(
        fontSize: 12,
        color: Colors.black54,
        fontWeight: FontWeight.w200,
        letterSpacing: 0.9,
      ),
      headline2: GoogleFonts.electrolize(
        fontSize: 17,
        color: Colors.black,
        fontWeight: FontWeight.w700,
        letterSpacing: .5,
      ),
      headline3: GoogleFonts.electrolize(
        fontSize: 15,
        fontWeight: FontWeight.w300,
        letterSpacing: 2,
        color: Colors.black,
      ),
      headline4: GoogleFonts.electrolize(
        fontSize: 15,
        fontWeight: FontWeight.w900,
        letterSpacing: 1.3,
        color: Colors.black,
      )),
);





//DarkTheme
ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.black,
  colorScheme:
      ColorScheme.dark(
          primary: Colors.black54,
          secondary: Colors.black54),
  visualDensity: VisualDensity.adaptivePlatformDensity,
  scrollbarTheme: ScrollbarThemeData(
    radius: Radius.circular(4),
    interactive: true,
    thickness: MaterialStateProperty.all(6.5),
    minThumbLength: 1,
    mainAxisMargin: 1,
    crossAxisMargin: 1,
  ).copyWith(
    showTrackOnHover: true,
    thumbColor: MaterialStateProperty.all(Colors.pinkAccent.withOpacity(0.7)),
  ),
  textTheme: TextTheme(
      headline1: GoogleFonts.electrolize(
        fontSize: 12,
        fontWeight: FontWeight.w200,
        letterSpacing: 0.9,
      ),
      headline2: GoogleFonts.electrolize(
        fontSize: 17,
        color: Colors.white,
        fontWeight: FontWeight.w700,
        letterSpacing: .5,
      ),
      headline3: GoogleFonts.electrolize(
        fontSize: 15,
        fontWeight: FontWeight.w300,
        letterSpacing: 2,
        color: Colors.white,
      ),
      headline4: GoogleFonts.electrolize(
        fontSize: 15,
        fontWeight: FontWeight.w900,
        letterSpacing: 1.3,
        color: Colors.black,
      )),
);
