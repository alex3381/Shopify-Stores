import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../../statemanagement/provider/theme_provider.dart';
import '../../../statemanagement/themes/theme.dart';


class MyWaveClipper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    var screenSize = MediaQuery.of(context).size;
    final size = MediaQuery.of(context).size;
    double width = MediaQuery.of(context).size.width;

    return Padding(
        padding: EdgeInsets.all(3),
        child: Container(
          width: double.infinity,
          child: Stack(
              children: <Widget>[
            //stack overlaps widgets
            Opacity(
              opacity: 0.5,
              child: ClipPath(
                clipper: WaveClipper(), //set our custom wave clipper
                child: Container(
                  color: themeProvider.getTheme == darkTheme
                ? Colors.white54.withOpacity(0.2)
                      : Colors.black12.withOpacity(0.1),
                  height: 530,
                  width: double.maxFinite,
                ),
              ),
            ),

            ClipPath(
              //upper clippath with less height
              clipper: WaveClipper(), //set our custom wave clipper.
              child: Container(
                width: double.infinity,

                  padding: EdgeInsets.only(bottom: 50),
                  color:  themeProvider.getTheme == darkTheme
              ? Colors.white54.withOpacity(0.2)
                    :  Colors.black12
                      .withOpacity(0.1),
                  height: 500,
              ))]),
        ));
  }
}

//Costom CLipper class with Path
class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(
        0, size.height); //start path with this if you are making at bottom

    var firstStart = Offset(size.width / 5, size.height);
    //fist point of quadratic bezier curve
    var firstEnd = Offset(size.width / 2.25, size.height - 50.0);
    //second point of quadratic bezier curve
    path.quadraticBezierTo(
        firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);

    var secondStart =
        Offset(size.width - (size.width / 3.24), size.height - 105);
    //third point of quadratic bezier curve
    var secondEnd = Offset(size.width, size.height - 10);
    //fourth point of quadratic bezier curve
    path.quadraticBezierTo(
        secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);

    path.lineTo(
        size.width, 0); //end with this path if you are making wave at bottom
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false; //if new instance have different instance than old instance
    //then you must return true;
  }
}
