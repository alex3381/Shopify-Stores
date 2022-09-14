import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../constant.dart';
import '../../statemanagement/provider/theme_provider.dart';
import '../../statemanagement/themes/theme.dart';
import '../reuseableWidgets/animation/fadein_animation.dart';


class TextTile extends StatefulWidget {
  const TextTile({
    Key? key,
  }) : super(key: key);
  @override
  State<TextTile> createState() => _TextTileState();
}
class _TextTileState extends State<TextTile> {
  late final Timer timer;
  int index = 0;
  final List<Color> _colorss = [
    Color(0xFF827717).withOpacity(0.9),
    Color(0xFF3849AB).withOpacity(0.9),
    Color(0xFF263238).withOpacity(0.9),
  ];

  final List _titles = [
    'Summer Wears',
    'Fashion  Police',
    'Work Place Attitude',
  ];

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 9), (timer) {
      setState(() => index++);
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: false);



    return
      Align(
        alignment: Alignment.centerRight,
         child: EntranceFader(
          duration: const Duration(milliseconds: 250),
    offset: const Offset(0, -10),
    delay: const Duration(seconds: 3),
    child: Padding(
    padding: EdgeInsets.all(1.0),
        child: GlassmorphicContainer(
            height: 100,
            width: 250,
            borderRadius: 5,
            blur: 6,
            border: 2,
            linearGradient: LinearGradient(
                colors: [
                  Colors.white.withOpacity(0.3),
                  Colors.white38.withOpacity(0.3)
                ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            borderGradient: LinearGradient(colors: [
              Colors.white24.withOpacity(0.3),
              Colors.white70.withOpacity(0.3)
            ]),
            child:  Padding(
                padding: EdgeInsets.all(4),

                child: Container(
                    color: themeProvider.getTheme == darkTheme
                        ? Color(0XFFBBDEFB).withOpacity(0.4)
                        : Color(0xFFFFFFFF).withOpacity(0.3),
                    child: AnimatedSwitcher(
                        switchInCurve: Curves.linear,
                        duration: Duration(milliseconds: 200),
                        transitionBuilder: (child,
                            Animation<double> animation) =>
                            FadeTransition(
                              child: SizedBox.expand(child: child),
                              opacity: Tween<double>(begin: 0.5, end: 1.0)
                                  .animate(
                                  CurvedAnimation(
                                      parent: animation,
                                      curve: Interval(0.5, 1.0))),
                              alwaysIncludeSemantics: true,
                            ),
                        child: Column(
                            children: [
                              Column(
                                  children: [
                              EntranceFader(
                              duration: const Duration(milliseconds: 250),
                              offset: const Offset(0, -10),
                              delay: const Duration(seconds: 3),
                              child: Padding(
                                  padding: EdgeInsets.all(1.0),
                                  child:  Text(
                                        _titles[index % _titles.length],
                                        textAlign: TextAlign.center,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline2
                                            ?.copyWith(
                                            fontWeight: FontWeight.w800,
                                            fontSize: width >= 1201
                                                ? 10
                                                : width >= 601
                                                ? 10
                                                : width >= 400
                                                ? 7 : 7,
                                            color: _colorss[
                                            index % _colorss.length],
                                            letterSpacing: 0.5))))]),
                              SizedBox(height: 4),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          EntranceFader(
                                              duration: const Duration(milliseconds: 250),
                                              offset: const Offset(0, -10),
                                              delay: const Duration(seconds: 3),
                                              child: Padding(
                                                  padding: EdgeInsets.all(1.0),
                                          child:Text(
                                              longwordssmallscreen[index % longwords.length],
                                              maxLines: 4,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline2
                                                  ?.copyWith(
                                                fontWeight: FontWeight.w300,
                                                fontSize: width >= 1201
                                                    ? 8
                                                    : width >= 601
                                                    ? 7 : width >= 400
                                                    ? 4 : 4,
                                                color: _colorss[
                                                index % _colorss.length],
                                              ))))])]),

                EntranceFader(
                    duration: const Duration(milliseconds: 250),
                    offset: const Offset(0, -10),
                    delay: const Duration(seconds: 3),
                    child: Padding(
                        padding: EdgeInsets.all(1.0),
                            child:  RichText(
                                  text: TextSpan(
                                      text: tags[index % tags.length],
                                      style: GoogleFonts.electrolize(
                                        color: _colorss[
                                        index % _colorss.length],
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .headline1
                                            ?.copyWith(
                                          fontWeight:
                                          FontWeight.bold,
                                          fontSize: width >= 1201
                                              ? 10
                                              : width >= 601
                                              ? 10
                                              : width >= 400
                                              ? 5
                                              : 5,
                                          letterSpacing: 0.5,
                                          color: _colorss[index %
                                              _colorss.length],
                                        ),
                                      ),
                                      children: <InlineSpan>[
                                        WidgetSpan(
                                            alignment:
                                            PlaceholderAlignment
                                                .baseline,
                                            baseline:
                                            TextBaseline.alphabetic,
                                            child: SizedBox(width: 4)),
                                        TextSpan(
                                            text: tag_twos[
                                            index % tag_twos.length],
                                            style: GoogleFonts.electrolize(
                                                color: themeProvider.getTheme ==
                                                    darkTheme
                                                    ? Colors.pink.withOpacity(0.8)
                                                    : Colors.redAccent.withOpacity(0.8),
                                                textStyle: Theme.of(context)
                                                    .textTheme.headline1?.copyWith(
                                                  fontWeight:
                                                  FontWeight.w900,
                                                  decoration:
                                                  TextDecoration
                                                      .lineThrough,
                                                  color: _colorss[index %
                                                      _colorss.length],
                                                  fontSize: width >= 1201
                                                      ? 7 : width >= 601
                                                      ? 6 : width >= 400
                                                      ? 4 : 4,
                                                  letterSpacing: 0.5,
                                                )))])))),
                              SizedBox(height: 4),
                              Padding(
                                  padding: EdgeInsets.only(left: 28),
                                  child: Column(
                                      children: [
                                        Row(
                                            children: [
                                              Container(
                                                  height: 7,
                                     child: EntranceFader(
                                          duration: const Duration(milliseconds: 250),
                                          offset: const Offset(0, -10),
                                          delay: const Duration(seconds: 3),
                                          child: Padding(
                                              padding: EdgeInsets.all(1.0),
                                                  child: RatingBar.builder(
                                                      itemSize: 12,
                                                      initialRating: 4,
                                                      minRating: 1,
                                                      direction: Axis.horizontal,
                                                      allowHalfRating: true,
                                                      itemCount: 5,
                                                      itemPadding: EdgeInsets.symmetric(
                                                          horizontal: 4.0),
                                                      itemBuilder: (context, _) =>
                                                          Icon(
                                                            Icons.star,
                                                            color: themeProvider
                                                                .getTheme ==
                                                                darkTheme
                                                                ? Colors.pink
                                                                .withOpacity(0.8)
                                                                : Colors.redAccent
                                                                .withOpacity(0.9)
                                                                .withOpacity(0.8),
                                                          ),
                                                      onRatingUpdate: (rating) {print(rating);
                                                      })))),
                                              SizedBox(width: 70),
                                              Container(
                                                height: 15,
                                                width: 16,
                                                decoration: BoxDecoration(
                                                    color: themeProvider.getTheme ==
                                                        darkTheme
                                                        ? Colors.white
                                                        : Colors.black,
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        12)),
                                                 child: EntranceFader(
                                                      duration: const Duration(milliseconds: 250),
                                                      offset: const Offset(0, -10),
                                                      delay: const Duration(seconds: 3),
                                                      child: Padding(
                                                          padding: EdgeInsets.all(1.0),
                                                child: Icon(Icons.shopping_cart_checkout_sharp,
                                                  size: 12,
                                                  color: themeProvider.getTheme ==
                                                      darkTheme
                                                      ? Colors.pink.withOpacity(0.8)
                                                      : Colors.redAccent.withOpacity(0.9),
                                                ))))])]))]))))))));
  }
}
