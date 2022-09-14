import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../responsive_ui/responsive_widget.dart';
import '../../statemanagement/provider/theme_provider.dart';
import '../../statemanagement/themes/theme.dart';
import 'animation/fadein_animation.dart';
import 'double_rectangle.dart';

class AnimatedTextWidget extends StatelessWidget {
  AnimatedTextWidget({
    Key? key,
    required this.screenSize,
  }) : super(key: key);
  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: false);
    return  ResponsiveWidget.isSmallScreen(context)
         ? Padding(
        padding: const EdgeInsets.only(right:35),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              color: themeProvider.getTheme == darkTheme
                  ? Colors.white.withOpacity(0.9)
                  : Colors.black54.withOpacity(0.5),
   child: EntranceFader(
    duration: const Duration(milliseconds: 250),
    offset: const Offset(0, -10),
    delay: const Duration(seconds: 3),
    child: Padding(
    padding: EdgeInsets.all(1.0),
              child: Icon(
                size: 12,
                Icons.play_arrow_rounded,
                color: themeProvider.getTheme == darkTheme
                    ? Colors.pink.withOpacity(0.9)
                    : Colors.red,
              ),
            ))),
            Expanded(
              child: Container(
                width: 20.0,
                margin: const EdgeInsets.only(left: 3, top: 5),
                child: DefaultTextStyle(
                  style: GoogleFonts.electrolize(
                      textStyle:
                      Theme.of(context).textTheme.headline1?.copyWith(
                          fontSize: width >= 1201 ? 12
                              : width >= 601 ? 9
                              : width >= 400 ? 6 : 8),
                      color: themeProvider.getTheme == darkTheme
                          ? Colors.white.withOpacity(0.9)
                          : Colors.black54.withOpacity(0.9),
                      fontWeight: FontWeight.w800,
                      letterSpacing: 0.5),
                  child: AnimatedTextKit(
                    isRepeatingAnimation: true,
                    repeatForever: true,
                    animatedTexts: [
                      TypewriterAnimatedText('Lets Take You On A journey .....'),
                      TypewriterAnimatedText('Into The World Of Fashion .....'),
                      TypewriterAnimatedText('Were Class Meets Design .....'),
                    ],
                    onTap: () {
                      print("Tap Event");
                    },
                  ),
                ),
              ),
            ),

          ],
        ))





    :Padding(
        padding: const EdgeInsets.all(2),
        child:Container(
        height: 30,
        width: 300,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              color: themeProvider.getTheme == darkTheme
                  ? Colors.white.withOpacity(0.9)
                  : Colors.black54.withOpacity(0.5),
    child:EntranceFader(
    duration: const Duration(milliseconds: 250),
    offset: const Offset(0, -10),
    delay: const Duration(seconds: 3),
    child: Padding(
    padding: EdgeInsets.all(1.0),
              child: Icon(
                size: 17,
                Icons.play_arrow_rounded,
                color: themeProvider.getTheme == darkTheme
                    ? Colors.pink.withOpacity(0.9)
                    : Colors.red,
              ),
            ))),
            Expanded(
              child: Container(
                width: 250.0,
                margin: const EdgeInsets.only(left: 14, top: 3),
                child: DefaultTextStyle(
                  style: GoogleFonts.electrolize(
                      textStyle:
                          Theme.of(context).textTheme.headline1?.copyWith(
                              fontSize: width >= 1201 ? 12
                                  : width >= 601 ? 9
                                      : width >= 400 ? 9 : 10),
                      color: themeProvider.getTheme == darkTheme
                          ? Colors.white.withOpacity(0.9)
                          : Colors.black54.withOpacity(0.9),
                      fontWeight: FontWeight.w800,
                      letterSpacing: 0.5),
    child:EntranceFader(
    duration: const Duration(milliseconds: 250),
    offset: const Offset(0, -10),
    delay: const Duration(seconds: 3),
    child: Padding(
    padding: EdgeInsets.all(1.0),
                  child: AnimatedTextKit(
                    isRepeatingAnimation: true,
                    repeatForever: true,
                    animatedTexts: [
                      TypewriterAnimatedText('Lets Take You On A journey .....'),
                      TypewriterAnimatedText('Into The World Of Fashion .....'),
                      TypewriterAnimatedText('Were Class Meets Design .....'),
                    ],
                    onTap: () {
                      print("Tap Event");
                    },
                  ),
                ),
              ),
            ))),

            // SizedBox(height: 6),
    //         Positioned(
    //           left: 12,
    // child:DoubleRectangle()),
          ],
        )));
  }
}
