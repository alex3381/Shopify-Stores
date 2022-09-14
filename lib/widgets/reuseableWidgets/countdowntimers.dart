import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../responsive_ui/responsive_widget.dart';
import '../../statemanagement/provider/theme_provider.dart';
import '../../statemanagement/themes/theme.dart';


class CountDownTimer extends StatelessWidget {
  const CountDownTimer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: false);
    double width = MediaQuery.of(context).size.width;
    return  ResponsiveWidget.isSmallScreen(context)
        ?  Center(
        child: Container(
            alignment: Alignment.center,
            width: 160,
            height: 50,
            decoration: BoxDecoration(

              color: themeProvider.getTheme == darkTheme
                  ? Colors.grey.withOpacity(0.3)
                  : Colors.redAccent.withOpacity(0.1),
              border: Border.all(
                color: themeProvider.getTheme == darkTheme
                    ? Colors.grey.withOpacity(0.3)
                    : Colors.redAccent.withOpacity(0.1),
                width: 1.8,
              ),
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  offset: const Offset(
                    1.0,
                    1.0,
                  ), //Offset
                  blurRadius: 1.0,
                  spreadRadius: 1.0,
                ), //BoxShadow
                BoxShadow(
                  color: Colors.white,
                  offset: const Offset(0.0, 0.0),
                  blurRadius: 0.0,
                  spreadRadius: 0.0,
                ), //BoxShadow
              ],
            ),
            child: Padding(
                padding: EdgeInsets.all(5),
                child: TimerCountdown(
                    timeTextStyle:
                    GoogleFonts.electrolize(
                      textStyle:
                      Theme.of(context).textTheme.headline1?.copyWith(
                          fontSize: width >= 1201
                              ? 11 : width >= 601
                              ? 7 : width >= 400
                              ? 7 :6),
                      color:  themeProvider.getTheme == darkTheme
                          ? Colors.black.withOpacity(0.9)
                          : Colors.red.withOpacity(0.9),
                      fontWeight: FontWeight.bold,
                      letterSpacing: .5,
                    ),
                    descriptionTextStyle: GoogleFonts.electrolize(
                      textStyle:
                      Theme.of(context).textTheme.headline1?.copyWith(
                          fontSize: width >= 1201
                              ? 10 : width >= 601
                              ? 7 : width >= 400
                              ? 6 :6),
                      color: themeProvider.getTheme == darkTheme
                          ? Colors.grey.withOpacity(0.5)
                          : Colors.redAccent.withOpacity(0.65),
                      fontWeight: FontWeight.bold,
                      letterSpacing: .5,
                    ),
                    enableDescriptions: true,
                    spacerWidth: 2,
                    format: CountDownTimerFormat.daysHoursMinutesSeconds,

                    endTime: DateTime.now().add(
                      Duration(

                        days: 5,
                        hours: 14,
                        minutes: 27,
                        seconds: 34,
                      ),
                    ),
                    onEnd: () {
                      print("Timer finished");
                    }))))


     : Center(
        child: Container(
            alignment: Alignment.center,
            width: 190,
            height: 55,
            decoration: BoxDecoration(

              color: themeProvider.getTheme == darkTheme
                  ? Colors.grey.withOpacity(0.3)
                  : Colors.redAccent.withOpacity(0.1),
              border: Border.all(
                color: themeProvider.getTheme == darkTheme
                    ? Colors.grey.withOpacity(0.3)
                    : Colors.redAccent.withOpacity(0.1),
                width: 1.8,
              ),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  offset: const Offset(
                    1.0,
                    1.0,
                  ), //Offset
                  blurRadius: 1.0,
                  spreadRadius: 1.0,
                ), //BoxShadow
                BoxShadow(
                  color: Colors.white,
                  offset: const Offset(0.0, 0.0),
                  blurRadius: 0.0,
                  spreadRadius: 0.0,
                ), //BoxShadow
              ],
            ),
            child: Padding(
                padding: EdgeInsets.all(7),
                child: TimerCountdown(
                    timeTextStyle:
                    GoogleFonts.electrolize(
                      textStyle:
                      Theme.of(context).textTheme.headline1?.copyWith(
                          fontSize: width >= 1201
                              ? 10 : width >= 601
                              ? 7 : width >= 400
                              ? 6 :6),
                      color:  themeProvider.getTheme == darkTheme
                    ? Colors.black.withOpacity(0.9)
                        : Colors.red.withOpacity(0.9),
                      fontWeight: FontWeight.bold,
                      letterSpacing: .5,
                    ),
                    descriptionTextStyle: GoogleFonts.electrolize(
                      textStyle:
                          Theme.of(context).textTheme.headline1?.copyWith(
                              fontSize: width >= 1201
                                  ? 10 : width >= 601
                                      ? 7 : width >= 400
                                          ? 6 :6),
                      color: themeProvider.getTheme == darkTheme
                          ? Colors.grey.withOpacity(0.5)
                          : Colors.redAccent.withOpacity(0.65),
                      fontWeight: FontWeight.bold,
                      letterSpacing: .5,
                    ),
                    enableDescriptions: true,
                    spacerWidth: 2,
                    format: CountDownTimerFormat.daysHoursMinutesSeconds,

                    endTime: DateTime.now().add(
                      Duration(

                        days: 5,
                        hours: 14,
                        minutes: 27,
                        seconds: 34,
                      ),
                    ),
                    onEnd: () {
                      print("Timer finished");
                    }))));
  }
}
