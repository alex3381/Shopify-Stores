import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:provider/provider.dart';
import '../../responsive_ui/responsive_widget.dart';
import '../../statemanagement/provider/theme_provider.dart';
import '../../statemanagement/themes/theme.dart';


class FlashSales extends StatelessWidget {
  const FlashSales({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context, listen: false);

    return Padding(
        padding: EdgeInsets.all(10),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child:Center(
                  heightFactor: 1,
                  child: Container(
                      alignment: Alignment.center,
                      height: 30,
                      width: 110,
                      decoration: BoxDecoration(
                          color: themeProvider.getTheme == darkTheme
                              ? Colors.black.withOpacity(0.5)
                              : Colors.red.withOpacity(0.9),
                          border: Border.all(
                            color: themeProvider.getTheme == darkTheme
                                ? (Colors.white.withOpacity(0.9)) // Colors.black54
                                : Colors.black.withOpacity(0.3),
                            width: 0.8,
                          ),
                          borderRadius: BorderRadius.circular(10),
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
                      child: Text(
                        textScaleFactor: 1,
                        "Flash Sale",
                        style: Theme.of(context).textTheme.headline1?.copyWith(
                              color: themeProvider.getTheme == darkTheme
                                  ? Colors.white
                                  : Colors.black,
                              fontWeight: FontWeight.w300,
                              fontSize: width >= 1201
                                  ? 15 : width >= 601
                                      ? 13 : width >= 400
                                          ? 8 : 8,
                              letterSpacing: .5,
                            ))))),
            Spacer(flex: 1),
            Expanded(
                flex: 2,
                child:Center(
                    heightFactor: 1,
                    child: Container(
                        alignment: Alignment.center,
                        height: 30,
                        width: 90,
                        decoration: BoxDecoration(
                            color: themeProvider.getTheme == darkTheme
                                ? Colors.black.withOpacity(0.5)
                                : Colors.red.withOpacity(0.9),
                            border: Border.all(
                              color: themeProvider.getTheme == darkTheme
                                  ? (Colors.white.withOpacity(0.9)) // Colors.black54
                                  : Colors.black.withOpacity(0.3),
                              width: 0.8,
                            ),
                            borderRadius: BorderRadius.circular(10),
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
                      child: Text(
                        'Time Left',
                        style: Theme.of(context).textTheme.headline1?.copyWith(
                          color: themeProvider.getTheme == darkTheme
                              ? Colors.white
                              : Colors.black,
                          fontWeight: FontWeight.w300,
                                  fontSize: width >= 1201
                                      ? 15 : width >= 601
                                          ? 13 : width >= 400
                                              ? 8 : 10,
                          letterSpacing: .5,
                        ))))),
            Spacer(flex: 1),
            Expanded(
                flex: 1,
                child: Center(
                    heightFactor: 1,
                    child: Container(
                        alignment: Alignment.center,
                        height: 30,
                        width: 90,
                        decoration: BoxDecoration(
                            color: themeProvider.getTheme == darkTheme
                                ? Colors.black.withOpacity(0.5)
                                : Colors.red.withOpacity(0.9),
                            border: Border.all(
                              color: themeProvider.getTheme == darkTheme
                                  ? (Colors.white.withOpacity(0.9)) // Colors.black54
                                  : Colors.black.withOpacity(0.3),
                              width: 0.8,
                            ),
                            borderRadius: BorderRadius.circular(10),
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
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'See All',
                              style: Theme.of(context).textTheme.headline1?.copyWith(
                            color: themeProvider.getTheme == darkTheme
                            ? Colors.white
                                : Colors.black,
                            fontWeight: FontWeight.w300,
                                        fontSize: width >= 1201
                                            ? 15
                                            : width >= 601
                                                ? 13
                                                : width >= 400
                                                    ? 8 : 8,
                                letterSpacing: .5,
                              ),
                            ),
                            WidgetSpan(
                              alignment: PlaceholderAlignment.middle,
                              child:  ResponsiveWidget.isSmallScreen(context)
    ? Icon(
                                Icons.chevron_right_rounded,
                                size: 12,
                                color: themeProvider.getTheme == darkTheme
                                    ? Colors.white
                                    : Colors.black,
                              )
                             : Icon(
                                Icons.chevron_right_rounded,
                                size: 23,
                                color: themeProvider.getTheme == darkTheme
                                    ? Colors.white
                                    : Colors.black,
                              ))])))))]));
}}
