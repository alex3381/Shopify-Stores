import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_outlets/widgets/reuseableWidgets/animatedtextwidget.dart';
import 'package:shop_outlets/widgets/reuseableWidgets/animation/fadein_animation.dart';
import '../../responsive_ui/responsive_widget.dart';
import '../../statemanagement/provider/theme_provider.dart';
import '../../statemanagement/themes/theme.dart';
import '../reuseableWidgets/double_rectangle.dart';


class WelcomeText extends StatelessWidget {
  const WelcomeText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: false);
    double width = MediaQuery.of(context).size.width;
    var screenSize = MediaQuery.of(context).size;
    return Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
      return ResponsiveWidget.isSmallScreen(context)
          ? Align(
        alignment: Alignment.topLeft,
       child: Stack(
          children: [


         Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(10),
                  child: Column(children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        EntranceFader(
                            duration: const Duration(milliseconds: 250),
                            offset: const Offset(0, -10),
                            delay: const Duration(seconds: 3),
                            child: RichText(
                                text: TextSpan(
                                    text: 'Switch',
                                    style:
                                    Theme.of(context).textTheme.headline2?.copyWith(
                                      fontSize: width >= 1201
                                          ? 48 : width >= 601
                                          ? 24 : width >= 400
                                          ? 19 : 19,
                                    ),
                                    children: <TextSpan>[

                                      TextSpan(
                                          text: ' Up', style:
                                      Theme.of(context).textTheme.headline2?.copyWith(
                                          fontSize: width >= 1201
                                              ? 48 : width >= 601
                                              ? 24 : width >= 400
                                              ? 19 : 19,
                                          color: themeProvider.getTheme == darkTheme
                                              ? Colors.pink.withOpacity(0.9)
                                              : Colors.red
                                        // .withOpacity(0.9),
                                      )),
                                      TextSpan(
                                          text: ' Your',
                                          style:
                                          Theme.of(context).textTheme.headline2?.copyWith(
                                            fontSize: width >= 1201
                                                ? 48 : width >= 601
                                                ? 24 : width >= 400
                                                ? 19 : 19,
                                          ))]))),
                        EntranceFader(
                            duration: const Duration(milliseconds: 250),
                            offset: const Offset(0, -10),
                            delay: const Duration(seconds: 3),
                            child: Row(
                              children: [





                              Text(
                              'Digital',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style:
                              Theme.of(context).textTheme.headline2?.copyWith(
                                  fontSize: width >= 1201
                                      ? 48
                                      : width >= 601
                                      ? 24
                                      : width >= 400
                                      ? 19 : 19,
                                  color: themeProvider.getTheme == darkTheme
                                      ? Colors.pink.withOpacity(0.9)
                                      : Colors.red),),
                           SizedBox(width:10),
                                EntranceFader(
                                    duration: const Duration(milliseconds: 250),
                                    offset: const Offset(0, -10),
                                    delay: const Duration(seconds: 3),
                                    child: Padding(
                                        padding: EdgeInsets.all(1.0),
                             child: Text(
                                  'Clothing',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style:
                                  Theme.of(context).textTheme.headline2?.copyWith(
                                    fontSize: width >= 1201
                                        ? 48
                                        : width >= 601
                                        ? 24
                                        : width >= 400
                                        ? 19 : 19))))])),
                        SizedBox(height: 4),
                        Padding(
                            padding: EdgeInsets.only(right:20),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  AnimatedTextWidget(screenSize: screenSize),
                                  SizedBox(height: 4),
                                  Row(
                                      children: <Widget>[
                                        Container(
                                            height: 30,
                                            width: 30,
                                     child: EntranceFader(
                                          duration: const Duration(milliseconds: 250),
                                          offset: const Offset(0, -10),
                                          delay: const Duration(seconds: 3),
                                          child: Padding(
                                              padding: EdgeInsets.all(1.0),
                                            child: Divider(
                                              thickness: 4,
                                              indent: 2,
                                              endIndent: 2,
                                              color: themeProvider.getTheme ==
                                                  darkTheme
                                                  ? Colors.pink.withOpacity(0.9)
                                                  :  Colors.red,
                                              height:
                                              2, // The divider's height extent.
                                            )))),
                                        SizedBox(width: 10),

                                        Container(
                                            child:  EntranceFader(
                                                duration: const Duration(milliseconds: 250),
                                                offset: const Offset(0, -10),
                                                delay: const Duration(seconds: 3),
                                                child: Text(
                                                  'What We Do',
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: Theme.of(context)
                                                      .textTheme.headline2
                                                      ?.copyWith(fontSize: width >= 1201 ? 24 : width >= 601
                                                      ? 12 : width >= 400 ? 10 : 12,
                                                      color: themeProvider.getTheme ==
                                                          darkTheme
                                                          ? Colors.pink.withOpacity(0.9)
                                                          : Colors.red,
                                                      fontWeight: FontWeight.w900,
                                                      letterSpacing: 1.3),
                                                )))]),
                                  Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      children: [
                                        // SizedBox(height: 13),
                                        Container(
                                          height: 40,
                                          width: 260,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5),
                                          ),
                                          child:  Container(
                                              child:Wrap(
                                                  children: [
                                                    EntranceFader(
                                                      duration: const Duration(milliseconds: 250),
                                                      offset: const Offset(0, -10),
                                                      delay: const Duration(seconds: 3),
                                                      child:  Text(
                                                        'We Get you the season\'s hottest Wears\n'
                                                            'from the World\'s Largest Fashion Store\n',

                                                        // We Provide to you the Best Designs',
                                                        maxLines: 2,

                                                        overflow: TextOverflow.ellipsis,
                                                        textWidthBasis: TextWidthBasis.longestLine,
                                                        textAlign: TextAlign.start,
                                                        style: Theme.of(context).textTheme.headline1
                                                            ?.copyWith(fontSize: width >=
                                                            1201 ? 10 : width >= 601 ? 9 : width >= 400 ? 9 : 10,
                                                          fontWeight: FontWeight.w800,
                                                          letterSpacing: 1.0,
                                                          color: themeProvider.getTheme ==
                                                              darkTheme
                                                              ? Colors.black.withOpacity(0.9)
                                                              : Colors.black.withOpacity(0.9),
                                                        ),
                                                      ),
                                                    )]) ),
                                        ),
                                        SizedBox(height: 3),
                                        DoubleRectangle(),
                                        SizedBox(height: 3),

                                        // SizedBox(height: 5),
                                        Row(
                                            children: [
                                              Container(
                                                alignment: Alignment.center,
                                                height: 25,
                                                width: 60,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(4),
                                                  color: themeProvider.getTheme ==
                                                      darkTheme
                                                      ?Colors.white.withOpacity(0.8)
                                                      : Colors.black.withOpacity(0.9),
                                                ),



                                                child:  EntranceFader(
                                                  duration: const Duration(milliseconds: 250),
                                                  offset: const Offset(0, -10),
                                                  delay: const Duration(seconds: 3),
                                                  child: Padding(
                                                      padding: EdgeInsets.all(1.0),

                                                      child: Text(
                                                        'Contact Us',
                                                        maxLines: 1,
                                                        overflow: TextOverflow.ellipsis,
                                                        style: Theme.of(context)
                                                            .textTheme.headline1
                                                            ?.copyWith(
                                                            fontSize: width >= 1201
                                                                // ? 9 : width >= 601
                                                                ? 10 : width >= 400
                                                                ? 8 : 9,
                                                            color: themeProvider.getTheme ==
                                                                darkTheme
                                                                ? Colors.pink.withOpacity(0.8)
                                                                : Colors.red,
                                                             fontWeight: FontWeight.w900,
                                                            letterSpacing: 0.5),
                                                      )),),),]),
                                        SizedBox(height: 40),
                                      ])]))])]))])],
      ))
        ///////////////////////////////////////////////// LARGE SCREEN ////////////////////////////////////////////////
        :Align(
        alignment: Alignment.topLeft,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(15),
                  child: Column(children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        EntranceFader(
                          duration: const Duration(milliseconds: 250),
                          offset: const Offset(0, -10),
                          delay: const Duration(seconds: 3),
                      child: RichText(
                          text: TextSpan(
                            text: 'Switch',
                            style:
                              Theme.of(context).textTheme.headline2?.copyWith(
                                fontSize: width >= 1201
                                    ? 48 : width >= 601
                                    ? 24 : width >= 400
                                    ? 16 : 12,
                              ),
                            children: <TextSpan>[

                              TextSpan(
                                  text: ' Up', style:
                                Theme.of(context).textTheme.headline2?.copyWith(
                                  fontSize: width >= 1201
                                      ? 48 : width >= 601
                                      ? 24 : width >= 400
                                      ? 16 : 12,
                                  color: themeProvider.getTheme == darkTheme
                                      ? Colors.pink.withOpacity(0.9)
                                      : Colors.red
                                      // .withOpacity(0.9),
                                )),
                              TextSpan(
                                  text: ' Your',
                                  style:
                                  Theme.of(context).textTheme.headline2?.copyWith(
                                fontSize: width >= 1201
                                    ? 48 : width >= 601
                                    ? 24 : width >= 400
                                    ? 16 : 12,
                              ))]))),
                        EntranceFader(
                          duration: const Duration(milliseconds: 250),
                          offset: const Offset(0, -10),
                          delay: const Duration(seconds: 3),
                       child: Text(
                          'Digital',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style:
                              Theme.of(context).textTheme.headline2?.copyWith(
                                    fontSize: width >= 1201
                                        ? 48
                                        : width >= 601
                                            ? 24
                                            : width >= 400
                                                ? 16
                                                : 12,
                                color: themeProvider.getTheme == darkTheme
                                    ? Colors.pink.withOpacity(0.9)
                                    : Colors.red
                                    // .withOpacity(0.9),

                                  ),
                        )),

                        EntranceFader(
                          duration: const Duration(milliseconds: 250),
                          offset: const Offset(0, -10),
                          delay: const Duration(seconds: 3),
                       child: Text(
                          'Clothing',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style:
                              Theme.of(context).textTheme.headline2?.copyWith(
                                    fontSize: width >= 1201
                                        ? 48
                                        : width >= 601
                                            ? 24
                                            : width >= 400
                                                ? 16
                                                : 12,
                                  )),
                        ),
                        // SizedBox(height: 6),

                        // SignatureDesign(height: 10,),
                        // SizedBox(height: 20),
                        Padding(
                            padding: EdgeInsets.all(2),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  AnimatedTextWidget(
                                    screenSize: screenSize,
                                  ),
                                  SizedBox(height: 13),
                                  Row(
                                    children: <Widget>[
                                      Container(
                                          height: 30,
                                          width: 50,
                                          child: Divider(
                                            thickness: 4,
                                            indent: 2,
                                            endIndent: 2,
                                            color: themeProvider.getTheme ==
                                                    darkTheme
                                                ? Colors.pink.withOpacity(0.9)
                                                :  Colors.red,
                                            height:
                                                2, // The divider's height extent.
                                          )),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        child:  EntranceFader(
                                              duration: const Duration(milliseconds: 250),
                                              offset: const Offset(0, -10),
                                              delay: const Duration(seconds: 3),
                                          child: Text(
                                        'What We Do',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(context)
                                            .textTheme.headline2
                                            ?.copyWith(fontSize: width >= 1201 ? 24 : width >= 601
                                                        ? 12 : width >= 400 ? 10 : 12,
                                                color: themeProvider.getTheme ==
                                                        darkTheme
                                                    ? Colors.pink.withOpacity(0.9)
                                                    : Colors.red,
                                            fontWeight: FontWeight.w900,
                                                letterSpacing: 1.3),
                                      )))]),
                                  Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 13),
                                            Container(
                                              height: 40,
                                              width: 260,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(5),
                                              ),
                                                  child:  Container(
                                                            child:Wrap(
                                                              children: [
                                                            EntranceFader(
                                                            duration: const Duration(milliseconds: 250),
                                                      offset: const Offset(0, -10),
                                                      delay: const Duration(seconds: 3),
                                                          child:  Text(
                                                              'We Get you the season\'s hottest Wears\n'
                                                                  'from the World\'s Largest Fashion Store\n',

                                                            // We Provide to you the Best Designs',
                                                              maxLines: 2,

                                                              overflow: TextOverflow.ellipsis,
                                                              textWidthBasis: TextWidthBasis.longestLine,
                                                              textAlign: TextAlign.start,
                                                              style: Theme.of(context).textTheme.headline1
                                                                  ?.copyWith(fontSize: width >=
                                                                            1201 ? 10 : width >= 601 ? 9 : width >= 400 ? 9 : 10,
                                                                    fontWeight: FontWeight.w800,
                                                                    letterSpacing: 1.0,
                                                                    color: themeProvider.getTheme ==
                                                                            darkTheme
                                                                        ? Colors.black.withOpacity(0.9)
                                                                        : Colors.black.withOpacity(0.9),
                                                                  ),
                                                            ),
                                                            )]) ),
                                                ),
                                        SizedBox(height: 5),

                                        DoubleRectangle(),
                                        SizedBox(height: 5),
                                        Row(
                                          children: [
                                        Container(
                                          alignment: Alignment.center,
                                          height: 30,
                                          width: 70,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            color: themeProvider.getTheme ==
                                                    darkTheme
                                                ?Colors.white.withOpacity(0.8)
                                                : Colors.black.withOpacity(0.9),
                                          ),
                                          child:  EntranceFader(
                                              duration: const Duration(milliseconds: 250),
                                              offset: const Offset(0, -10),
                                              delay: const Duration(seconds: 3),
                                          child: Padding(
                                            padding: EdgeInsets.all(1.0),

                                            child: Text(
                                              'Contact Us',
                                              // textScaleFactor: 1,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: Theme.of(context)
                                                  .textTheme.headline1
                                                  ?.copyWith(
                                                      fontSize: width >= 1201
                                                          ? 9 : width >= 601
                                                              ? 9 : width >= 400
                                                                  ? 9 : 10,
                                                  color: themeProvider.getTheme ==
                                                      darkTheme
                                                      ? Colors.pink.withOpacity(0.8)
                                                      : Colors.red,

                                                      fontWeight:
                                                          FontWeight.w900,
                                                      letterSpacing: 0.5),
                                            )),),),]),
                                        SizedBox(height: 10),
                                      ])
                                ]))
                      ],
                    ),
                  ]))
            ]),
        // TextTile()
      );
    });
  }
}
