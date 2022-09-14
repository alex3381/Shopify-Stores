import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:panorama/panorama.dart';
import 'package:provider/provider.dart';
import 'package:shop_outlets/widgets/web_tab_screen_widgets/texttile_mobile.dart';
import 'package:shop_outlets/widgets/web_tab_screen_widgets/welcometextfirstbackground.dart';
import '../../responsive_ui/responsive_widget.dart';
import '../../statemanagement/provider/theme_provider.dart';
import '../reuseableWidgets/animation/fadein_animation.dart';
import 'animatedImage_firstbackground.dart';
import 'texttile_animation.dart';


class FirstBackground extends StatefulWidget {
  FirstBackground({
    Key? key,
    required this.screenSize,
  }) : super(key: key);
  final Size screenSize;
  int index = 0;
  @override
  _FirstBackgroundState createState() => _FirstBackgroundState();
}
class _FirstBackgroundState extends State<FirstBackground> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context, listen: false);

return Container(
   height: ResponsiveWidget.isSmallScreen(context)
  ? MediaQuery.of(context).size.height / 2.15
   : MediaQuery.of(context).size.height / 1.3,
  width: MediaQuery.of(context).size.width,

  child:Stack(
    fit: StackFit.expand,
    clipBehavior: Clip.antiAliasWithSaveLayer,
    children: [
      Container(
        child: SizedBox(
          child: Stack(
              fit: StackFit.expand,
              children: [
          ClipRRect(
          borderRadius: BorderRadius.circular(5.0),
    child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                   child: Panorama(
              animSpeed: 6.0,
              animReverse: true,
              interactive: true,
              zoom: 1,
              hotspots: [
                Hotspot(
                  latitude: -15.0,
                  longitude: -129.0,
                  width: 30,
                  height: 75,
                ),
              ],
              child: Image.asset(
                'assets/carousel/another.jpg',
                filterQuality: FilterQuality.high,
                scale: 0.1,
          fit: BoxFit.cover,
              ))))]))),
      Container(
          child:Stack(
            children: [
              ResponsiveWidget.isSmallScreen(context)
              ? EntranceFader(
              duration: const Duration(milliseconds: 250),
              offset: const Offset(0, -10),
              delay: const Duration(seconds: 3),
              child: Padding(
                  padding: EdgeInsets.all(1.0),
              child:Container(
                  alignment: Alignment.topLeft,
                  height: 450,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.blueGrey.withOpacity(0.3),
                          Color(0xFF18FFFF).withOpacity(0.22),
                        ],
                        stops: [0.7,  0.5],)))))

              : Container(
                alignment: Alignment.topLeft,
                height: 600,

                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.blueGrey.withOpacity(0.3),
                      Color(0xFF18FFFF).withOpacity(0.22),
                    ],
                    stops: [0.7,  0.5],)))
            ])),
      WelcomeText(),
      AnimatedImageFirstBackground(),
Align(
  alignment: Alignment.centerRight,
  child: ResponsiveWidget.isSmallScreen(context)
  ? Container(
  padding:EdgeInsets.all(10),
child: Stack(
  children: [

      Container(
      alignment: Alignment.bottomRight,
      width: 600,
        height: 450,
        child:Padding(padding: EdgeInsets.only(right: 0, top: 240),
        child:TextTile_Mobile())),
     ])):
    PreferredSize(
    preferredSize: Size(screenSize.width, 1000),
    child: Container(
      alignment: Alignment.center,
      child: Padding(padding: EdgeInsets.only(right: 70, top: 54),
     child: TextTile(),
    )))),],));
  }
}
