import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../constant.dart';
import '../../responsive_ui/responsive_widget.dart';
import '../../statemanagement/provider/theme_provider.dart';
import '../../statemanagement/themes/theme.dart';
import 'animation/fadein_animation.dart';


class DoubleRectangle extends StatefulWidget {
  const DoubleRectangle({Key? key}) : super(key: key);

  @override
  State<DoubleRectangle> createState() => _DoubleRectangleState();
}
int _index = 0;
class _DoubleRectangleState extends State<DoubleRectangle> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    return  ResponsiveWidget.isSmallScreen(context)
      ? Row(
      crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          EntranceFader(
              duration: const Duration(milliseconds: 250),
              offset: const Offset(0, -10),
              delay: const Duration(seconds: 3),
              child: Padding(
                  padding: EdgeInsets.all(1.0),
         child: Container(
              alignment: Alignment.center,
              height: 25,
              width: 40,
              decoration: BoxDecoration(
                  color: themeProvider.getTheme == darkTheme
                      ? Colors.white.withOpacity(0.9)
                      : Colors.black.withOpacity(0.9),
                  border: Border.all(
                    color: themeProvider.getTheme == darkTheme
                        ? (Colors.pink.withOpacity(0.9)) // Colors.black54
                        : Colors.red.shade900,
                    width: 0.6,
                  ),
                  borderRadius: BorderRadius.circular(2),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black45.withOpacity(0.2),
                      offset: const Offset(
                        1.0, 1.0,
                      ), //Offset
                      blurRadius: 1.0,
                      spreadRadius: 1.0,
                    ), //BoxShadow
                    BoxShadow(
                      color: Colors.white,
                      offset: const Offset(0.0, 0.0),
                      blurRadius: 0.0,
                      spreadRadius: 0.0,
                    )]),

              child: Text( stock[_index % stock.length],
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme.headline2?.copyWith(
                      fontWeight: FontWeight.w800,
                      fontSize: 8,
                      color: themeProvider.getTheme == darkTheme
                          ? Colors.pink.withOpacity(0.5)
                          : Colors.red.withOpacity(0.9),
                      letterSpacing: 1.0)
              )))),


            EntranceFader(
              duration: const Duration(milliseconds: 250),
              offset: const Offset(0, -10),
              delay: const Duration(seconds: 3),
              child: Padding(
                  padding: EdgeInsets.all(1.0),
        child:  Container(
              alignment: Alignment.center,
            height: 25,
            width: 40,
              decoration: BoxDecoration(
                  color: themeProvider.getTheme == darkTheme
                      ? Colors.pink.withOpacity(0.9)
                      : Colors.red.withOpacity(0.9),
                  border: Border.all(
                    color: themeProvider.getTheme == darkTheme
                        ? (Colors.white.withOpacity(0.9)) // Colors.black54
                        : Colors.black,
                    width: 1.2,
                  ),
                  borderRadius: BorderRadius.circular(2),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black45.withOpacity(0.2),
                      offset: const Offset(
                        1.0, 1.0,
                      ), //Offset
                      blurRadius: 1.0,
                      spreadRadius: 1.0,
                    ), //BoxShadow
                    BoxShadow(
                      color: Colors.white,
                      offset: const Offset(0.0, 0.0),
                      blurRadius: 0.0,
                      spreadRadius: 0.0,
                    )]),
              child: Center(
                  heightFactor: 1,
                  child:Padding(
                      padding: EdgeInsets.all(3),

                      child: Text(
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          "Sales",
                          style: GoogleFonts.ubuntu(
                              textStyle: Theme.of(context).textTheme.headline1?.copyWith(fontSize: 8, fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                              ))))))))]
    )

         : Row(
            children: [

   EntranceFader(
    duration: const Duration(milliseconds: 250),
    offset: const Offset(0, -10),
    delay: const Duration(seconds: 3),
    child: Padding(
    padding: EdgeInsets.all(1.0),
           child:   Container(
                alignment: Alignment.center,
                height: 28,
                width: 69,
                decoration: BoxDecoration(
                    color: themeProvider.getTheme == darkTheme
                        ? Colors.white.withOpacity(0.9)
                        : Colors.black.withOpacity(0.9),
                    border: Border.all(
                      color: themeProvider.getTheme == darkTheme
                          ? (Colors.pink.withOpacity(0.9)) // Colors.black54
                          : Colors.red.shade900,
                      width: 0.6,
                    ),
                    borderRadius: BorderRadius.circular(2),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black45.withOpacity(0.2),
                        offset: const Offset(
                          1.0, 1.0,
                        ), //Offset
                        blurRadius: 1.0,
                        spreadRadius: 1.0,
                      ), //BoxShadow
                      BoxShadow(
                        color: Colors.white,
                        offset: const Offset(0.0, 0.0),
                        blurRadius: 0.0,
                        spreadRadius: 0.0,
                      )]),


                child: Text( stock[_index % stock.length],
                    // '350k',

                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headline2
                        ?.copyWith(
                        fontWeight: FontWeight.w800,
                        fontSize: 9,
                        color: themeProvider.getTheme == darkTheme
                            ? Colors.pink.withOpacity(0.5)
                            : Colors.red.withOpacity(0.9),
                        letterSpacing: 0.5)


                )))),

  EntranceFader(
    duration: const Duration(milliseconds: 250),
    offset: const Offset(0, -10),
    delay: const Duration(seconds: 3),
    child: Padding(
    padding: EdgeInsets.all(1.0),
             child: Container(
                  height: 28,
                  width: 69,
                decoration: BoxDecoration(
                    color: themeProvider.getTheme == darkTheme
                        ? Colors.pink.withOpacity(0.9)
                        : Colors.red.withOpacity(0.9),
                    border: Border.all(
                      color: themeProvider.getTheme == darkTheme
                          ? (Colors.white.withOpacity(0.9)) // Colors.black54
                          : Colors.black,
                      width: 1.2,
                    ),
                    borderRadius: BorderRadius.circular(2),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black45.withOpacity(0.2),
                        offset: const Offset(
                          1.0, 1.0,
                        ), //Offset
                        blurRadius: 1.0,
                        spreadRadius: 1.0,
                      ), //BoxShadow
                      BoxShadow(
                        color: Colors.white,
                        offset: const Offset(0.0, 0.0),
                        blurRadius: 0.0,
                        spreadRadius: 0.0,
                      )]),
                child: Center(
                  heightFactor: 1,
                child:Padding(
                  padding: EdgeInsets.all(3),

                child: Text(
                    textAlign: TextAlign.center,
                    maxLines: 1,
                "Customers",
                    style: GoogleFonts.ubuntu(
                        textStyle: Theme.of(context).textTheme.headline1?.copyWith(fontSize: 9, fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,

                        ))))))))]);
  }
}
