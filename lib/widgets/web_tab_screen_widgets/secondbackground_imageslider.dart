import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:provider/provider.dart';
import 'package:shop_outlets/widgets/mobile_screen_widgets/descriptionsecondbackground_mobile.dart';
import '../../constant.dart';
import '../../responsive_ui/responsive_widget.dart';
import '../../statemanagement/provider/theme_provider.dart';
import '../../statemanagement/themes/theme.dart';
import 'description_secondbackground.dart';

class SecondBackground extends StatefulWidget {
  const SecondBackground({Key? key}) : super(key: key);

  @override
  State<SecondBackground> createState() => _SecondBackgroundState();
}

class _SecondBackgroundState extends State<SecondBackground> {
  late final PageController _pageController;
  int index = 0;
  int activePage = 0;
  bool end = false;
  late Timer _timer;

  @override
  void initState() {
    _pageController = PageController(
      viewportFraction: 0.99,
      initialPage: 0,
    );
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 2), (Timer timer) {
      if (activePage == images.length) {
        end = true;
      } else if (activePage == 0) {
        end = false;
      }

      if (end == false) {
        activePage++;
      } else {
        activePage--;
      }

      _pageController.animateToPage(
        activePage,
        duration: const Duration(milliseconds: 1000),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    final size = MediaQuery.of(context).size;
    double width = MediaQuery.of(context).size.width;
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: false);
    return ResponsiveWidget.isSmallScreen(context)
        ? Container(
            height: 270,
            child: Stack(
                clipBehavior: Clip.hardEdge,
                alignment: AlignmentDirectional.bottomEnd,
                fit: StackFit.passthrough,
                children: [
            PageView.builder(
                          physics: new AlwaysScrollableScrollPhysics(),
                          padEnds: false,
                          allowImplicitScrolling: true,
                          itemCount: images.length,
                          pageSnapping: false,
                          scrollDirection: Axis.horizontal,
                          controller: _pageController,
                          onPageChanged: (int index) {
                            setState(() {
                              activePage = index;
                            });
                          },
                          itemBuilder: (context, int index) {
                            return Stack(children: [
                              Container(
                                height:270,
                                  child: Padding(
                                      padding: EdgeInsets.only(
                                          bottom: 10.0, left: 4, right: 4),
                                      child: Row(children: [
                                        Expanded(
                                            child: Container(
                                                height: 270,
                                                width: 700,
                                                decoration: BoxDecoration(
                                                    gradient: LinearGradient(
                                                  end: FractionalOffset
                                                      .bottomRight,
                                                  begin: Alignment.bottomRight,
                                                  stops: [0.1, 0.9],
                                                  colors: [
                                                    Theme.of(context)
                                                        .colorScheme
                                                        .primary
                                                        .withOpacity(0.32),
                                                    Theme.of(context)
                                                        .colorScheme
                                                        .secondary
                                                        .withOpacity(0.39)
                                                  ],
                                                )),

                                                child: Stack(children: [
                                                  Center(
                                                      child: Container(
                                                          width: size.width * 0.85,
                                                          alignment: Alignment
                                                              .centerRight,
                                                          child: Padding(
                                                              padding: EdgeInsets.only(right: 50),
                                                              child: Text(
                                                                  textAlign: TextAlign.center,
                                                                  overflow: TextOverflow.visible,
                                                                  maxLines: 1,
                                                                  softWrap: true,
                                                                  left[index],
                                                                  style: Theme.of(
                                                                          context)
                                                                      .textTheme
                                                                      .headline1
                                                                      ?.copyWith(
                                                                        color: themeProvider.getTheme ==
                                                                                darkTheme
                                                                            ? Colors.pink.withOpacity(0.9)
                                                                            : Colors.red,
                                                                        fontSize: 14,
                                                                        fontWeight: FontWeight.bold,
                                                                      )))))
                                                ]))),

                                        /////////////////////////////////////////////// Major Container ////////////////////////////
                                        Expanded(
                                            child: Container(
                                                height: 270,
                                                width: 700,
                                                decoration: BoxDecoration(
                                                    gradient: LinearGradient(
                                                        end: FractionalOffset
                                                            .bottomRight,
                                                        begin: Alignment
                                                            .bottomRight,
                                                        stops: [
                                                      0.1,
                                                      0.9
                                                    ],
                                                        colors: [
                                                      Theme.of(context)
                                                          .colorScheme
                                                          .primary
                                                          .withOpacity(0.70),
                                                      Theme.of(context)
                                                          .colorScheme
                                                          .secondary
                                                          .withOpacity(0.77)
                                                    ])),
                                                child: Stack(children: [
                                                  Center(
                                                      child: Container(
                                                          height: 100,
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left: 50),
                                                              child: Text(
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .visible,
                                                                  maxLines: 1,
                                                                  softWrap:
                                                                      true,
                                                                  right[index],
                                                                  style: Theme.of(
                                                                          context)
                                                                      .textTheme
                                                                      .headline2
                                                                      ?.copyWith(
                                                                          fontWeight:
                                                                              FontWeight.w900,
                                                                          fontSize: width >= 1201
                                                                              ? 53
                                                                              : width >= 601
                                                                                  ? 25
                                                                                  : width >= 400
                                                                                      ? 16
                                                                                      : 14)))))])))]))),

                              Stack(
                                  children: [
                                    Positioned(
                                        left: 900,
                                        bottom: 310,
                                        child: Container(
                                          alignment: Alignment.centerRight,
                                          height: 190,
                                          width: 250,
                                          child: DescriptionSecondBackground(),
                                        )),
                                    ////////////////////////////////////////////  Main Image first Background  /////////////////////////////////////////
                                    Center(
                                      child: Container(
                                        height: 170,
                                        width: 300,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: FutureBuilder(
                                            future: Future.delayed(Duration(
                                                milliseconds: 1500 * index)),
                                            builder: (ctx, timer) =>
                                                CachedNetworkImage(
                                                  fit: BoxFit.cover,
                                                  filterQuality: FilterQuality.high,
                                                  imageUrl: images[index],
                                                  progressIndicatorBuilder: (context,
                                                      url, downloadProgress) =>
                                                      Container(
                                                          alignment:
                                                          Alignment.topCenter,
                                                          margin: EdgeInsets.only(
                                                              top: 20),
                                                          child: Center(
                                                              child:
                                                              CircularProgressIndicator(
                                                                backgroundColor:
                                                                Colors.grey,
                                                                color: Colors.purple,
                                                                strokeWidth: 10,
                                                              ))),
                                                  errorWidget:
                                                      (context, url, error) =>
                                                  const Icon(
                                                    Icons.error,
                                                    size: 100,
                                                    color: Colors.red,
                                                  ),
                                                )),
                                      ),
                                    ),

                                    //GLASSMORPHIC CONTAINER BEGINS BELOW  /////////////////////////////////////////////////////

                                    Positioned(
                                        left: 20,
                                        bottom: 30,
                                        child:  ResponsiveWidget.isSmallScreen(context)

                                        ?Center(
                            child: GlassmorphicContainer(
                                            height: 60,
                                            width: 170,
                                            borderRadius: 15,
                                            blur: 15,
                                            alignment: Alignment.center,
                                            border: 2,
                                            linearGradient: LinearGradient(
                                                colors: [
                                                  Colors.white.withOpacity(0.3),
                                                  Colors.white38.withOpacity(0.3)
                                                ],
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight),
                                            borderGradient: LinearGradient(
                                                end: FractionalOffset.bottomRight,
                                                begin: Alignment.bottomRight,
                                                stops: [
                                                  0.1,
                                                  0.9
                                                ],
                                                colors: [
                                                  Colors.white24.withOpacity(0.3),
                                                  Colors.white70.withOpacity(0.3)
                                                ]),
                                            child:   Padding(
                                                padding: EdgeInsets.all(3),


                                            child:Container(
                                                alignment: Alignment.center,
                                                child: Stack(
                                                  fit: StackFit.loose,
                                                  clipBehavior:
                                                  Clip.antiAliasWithSaveLayer,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                      children: [
                                                        Padding(
                                                            padding:
                                                            EdgeInsets.all(5),
                                                            child: Column(
                                                              children: [

                                                                Container(
                                                                    height: 40,
                                                                    width: 30,
                                                                    decoration: BoxDecoration(
                                                                        color: themeProvider.getTheme ==
                                                                            darkTheme ? Colors
                                                                            .white : Colors.black,
                                                                        borderRadius: BorderRadius.circular(
                                                                            7)),
                                                                    child:
                                                                    CachedNetworkImage(
                                                                      height: 40,
                                                                      width: 50,
                                                                      fit: BoxFit.cover,
                                                                      filterQuality: FilterQuality.high,
                                                                      imageUrl: sub[index],
                                                                      progressIndicatorBuilder: (context,
                                                                          url,
                                                                          downloadProgress) =>
                                                                          Container(
                                                                              alignment: Alignment.topCenter,
                                                                              margin: EdgeInsets.only(top: 5),
                                                                              child:
                                                                              CircularProgressIndicator(

                                                                                backgroundColor: Colors.grey,
                                                                                color: Colors.purple,
                                                                                strokeWidth: 2,
                                                                              )),
                                                                      errorWidget: (context, url, error) =>
                                                                      const Icon(
                                                                        Icons.error,
                                                                        size: 7,
                                                                        color: Colors.red,
                                                                      )))])),
                                                        Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          children: [
                                                            Padding(
                                                                padding: EdgeInsets.all(3),
                                                                child: Text(
                                                                  sub_one[index],
                                                                  style: Theme.of(context).textTheme.headline1?.copyWith(
                                                                      color: themeProvider.getTheme ==
                                                                          darkTheme ? Colors.white
                                                                          : Colors.black,
                                                                      fontWeight: FontWeight.w400,
                                                                      fontSize:7),

                                                                )),
                                                            Padding(
                                                                padding: EdgeInsets.all(4),
                                                                child: RichText(
                                                                    text: TextSpan(
                                                                        text: price[index],
                                                                        style: Theme.of(context).textTheme.headline1?.copyWith(
                                                                            color: themeProvider.getTheme == darkTheme ? Colors.white : Colors.black,
                                                                            fontWeight: FontWeight.w300,
                                                                            fontSize:6),
                                                                        children: <InlineSpan>[
                                                                          WidgetSpan(
                                                                              alignment: PlaceholderAlignment.baseline,
                                                                              baseline: TextBaseline.alphabetic,
                                                                              child: SizedBox(width: 2)),
                                                                          TextSpan(
                                                                            text: price_two[
                                                                            index],
                                                                            style: Theme.of(context).textTheme.headline1?.copyWith(
                                                                                color: themeProvider.getTheme == darkTheme ? Colors.black : Colors.white,
                                                                                fontWeight: FontWeight.w400,
                                                                                decoration: TextDecoration.lineThrough,
                                                                                fontSize:4,
                                                                            ))]))),
                                                            Row(
                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                Padding(padding: EdgeInsets.all(2),
                                                                    child: Container(
                                                                        height: 6,
                                                                        child: RatingBar.builder(
                                                                          itemSize: 6,
                                                                          initialRating: 3,
                                                                          minRating: 1,
                                                                          direction: Axis.horizontal,
                                                                          allowHalfRating: true,
                                                                          itemCount: 5,
                                                                          itemPadding:
                                                                          EdgeInsets.symmetric(horizontal: 4.0),
                                                                          itemBuilder: (context, _) =>
                                                                              Icon(
                                                                                Icons.star,
                                                                                color: themeProvider.getTheme == darkTheme
                                                                                    ? Colors.pink.withOpacity(0.8)
                                                                                    : Colors.redAccent.withOpacity(0.9),
                                                                              ),
                                                                          onRatingUpdate:
                                                                              (rating) {
                                                                            print(rating);
                                                                          },
                                                                        ))),
                                                                SizedBox(width: 14),
                                                                Container(
                                                                    height: 7,
                                                                    width: 9,
                                                                    decoration: BoxDecoration(
                                                                        color: Colors.black, borderRadius: BorderRadius.circular(12)),
                                                                    child: Icon(
                                                                      Icons.add,
                                                                      size: 6,
                                                                      color: Colors
                                                                          .white,
                                                                    )),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                )))))






                                        :Positioned(
                                         left: 300,
                                          bottom: 100,
                                      child: Center(
                                     child: GlassmorphicContainer(
                                            height: 100,
                                            width: 250,
                                            borderRadius: 15,
                                            blur: 15,
                                            alignment: Alignment.center,
                                            border: 2,
                                            linearGradient: LinearGradient(
                                                colors: [
                                                  Colors.white.withOpacity(0.3),
                                                  Colors.white38.withOpacity(0.3)
                                                ],
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight),
                                            borderGradient: LinearGradient(
                                                end: FractionalOffset.bottomRight,
                                                begin: Alignment.bottomRight,
                                                stops: [
                                                  0.1,
                                                  0.9
                                                ],
                                                colors: [
                                                  Colors.white24.withOpacity(0.3),
                                                  Colors.white70.withOpacity(0.3)
                                                ]),


                            child:Padding(
                            padding: EdgeInsets.all(5),
                                            child: Container(
                                                alignment: Alignment.center,
                                                child: Stack(
                                                  fit: StackFit.loose,
                                                  clipBehavior:
                                                  Clip.antiAliasWithSaveLayer,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                      children: [
                                                        Padding(
                                                            padding:
                                                            EdgeInsets.all(10),
                                                            child: Column(
                                                              children: [
                                                                Container(
                                                                    height: 60,
                                                                    width: 60,
                                                                    decoration: BoxDecoration(
                                                                        color: themeProvider.getTheme ==
                                                                            darkTheme
                                                                            ? Colors
                                                                            .white
                                                                            : Colors
                                                                            .black,
                                                                        borderRadius:
                                                                        BorderRadius.circular(
                                                                            12)),
                                                                    child:
                                                                    CachedNetworkImage(
                                                                      height: 400,
                                                                      width: 300,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                      filterQuality:
                                                                      FilterQuality
                                                                          .high,
                                                                      imageUrl: sub[
                                                                      index],
                                                                      progressIndicatorBuilder: (context,
                                                                          url,
                                                                          downloadProgress) =>
                                                                          Container(
                                                                              alignment: Alignment
                                                                                  .topCenter,
                                                                              margin: EdgeInsets.only(
                                                                                  top:
                                                                                  20),
                                                                              child:
                                                                              CircularProgressIndicator(
                                                                                backgroundColor:
                                                                                Colors.grey,
                                                                                color:
                                                                                Colors.purple,
                                                                                strokeWidth:
                                                                                3,
                                                                              )),
                                                                      errorWidget: (context,
                                                                          url,
                                                                          error) =>
                                                                      const Icon(
                                                                        Icons.error,
                                                                        size: 100,
                                                                        color: Colors
                                                                            .red,
                                                                      ),
                                                                    ))
                                                              ],
                                                            )),
                                                        Column(
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                          mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                          children: [
                                                            Padding(
                                                                padding:
                                                                EdgeInsets.all(
                                                                    10),
                                                                child: Text(
                                                                  sub_one[index],
                                                                  style: Theme.of(
                                                                      context)
                                                                      .textTheme
                                                                      .headline1
                                                                      ?.copyWith(
                                                                      color: themeProvider.getTheme ==
                                                                          darkTheme
                                                                          ? Colors
                                                                          .white
                                                                          : Colors
                                                                          .black,
                                                                      fontWeight:
                                                                      FontWeight
                                                                          .w900,
                                                                      fontSize: width >=
                                                                          1201
                                                                          ? 12
                                                                          : width >= 601
                                                                          ? 12
                                                                          : width >= 400
                                                                          ? 16
                                                                          : 14),
                                                                )),
                                                            Padding(
                                                                padding:
                                                                EdgeInsets.all(
                                                                    10),
                                                                child: RichText(
                                                                    text: TextSpan(
                                                                        text: price[
                                                                        index],
                                                                        style: Theme.of(context).textTheme.headline1?.copyWith(
                                                                            color: themeProvider.getTheme == darkTheme ? Colors.white : Colors.black,
                                                                            fontWeight: FontWeight.w900,
                                                                            fontSize: width >= 1201
                                                                                ? 12
                                                                                : width >= 601
                                                                                ? 12
                                                                                : width >= 400
                                                                                ? 16
                                                                                : 14),
                                                                        children: <InlineSpan>[
                                                                          WidgetSpan(
                                                                              alignment:
                                                                              PlaceholderAlignment
                                                                                  .baseline,
                                                                              baseline:
                                                                              TextBaseline
                                                                                  .alphabetic,
                                                                              child: SizedBox(
                                                                                  width:
                                                                                  4)),
                                                                          TextSpan(
                                                                            text: price_two[
                                                                            index],
                                                                            style: Theme.of(context).textTheme.headline1?.copyWith(
                                                                                color: themeProvider.getTheme == darkTheme ? Colors.black : Colors.white,
                                                                                fontWeight: FontWeight.w500,
                                                                                decoration: TextDecoration.lineThrough,
                                                                                fontSize: width >= 1201
                                                                                    ? 10
                                                                                    : width >= 601
                                                                                    ? 7
                                                                                    : width >= 400
                                                                                    ? 10
                                                                                    : 10),
                                                                          ),
                                                                        ]))),
                                                            Row(
                                                              mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                              crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                              children: [
                                                                Padding(
                                                                    padding:
                                                                    EdgeInsets
                                                                        .all(4),
                                                                    child:
                                                                    Container(
                                                                        height:
                                                                        10,
                                                                        child: RatingBar
                                                                            .builder(
                                                                          itemSize:
                                                                          11,
                                                                          initialRating:
                                                                          3,
                                                                          minRating:
                                                                          1,
                                                                          direction:
                                                                          Axis.horizontal,
                                                                          allowHalfRating:
                                                                          true,
                                                                          itemCount:
                                                                          5,
                                                                          itemPadding:
                                                                          EdgeInsets.symmetric(horizontal: 4.0),
                                                                          itemBuilder: (context, _) =>
                                                                              Icon(
                                                                                Icons.star,
                                                                                color: themeProvider.getTheme == darkTheme
                                                                                    ? Colors.pink.withOpacity(0.8)
                                                                                    : Colors.redAccent.withOpacity(0.9),
                                                                              ),
                                                                          onRatingUpdate:
                                                                              (rating) {
                                                                            print(rating);
                                                                          },
                                                                        ))),
                                                                SizedBox(width: 14),
                                                                Container(
                                                                    height: 15,
                                                                    width: 16,
                                                                    decoration: BoxDecoration(
                                                                        color: Colors
                                                                            .black,
                                                                        borderRadius:
                                                                        BorderRadius.circular(
                                                                            12)),
                                                                    child: Icon(
                                                                      Icons.add,
                                                                      size: 10,
                                                                      color: Colors
                                                                          .white,
                                                                    ))])])])],
                                                )))))))]),

                              Positioned(
                                  right: 30,
                                  bottom: 205,
                                  child: DescriptionSecondBackground_Mobile()
                              )]);})]))

        ///////// WEB //////////

        : PreferredSize(
            preferredSize: Size(screenSize.width, 1000),
            child: Container(
              alignment: Alignment.center,
              height: 500,
              child: Stack(
                clipBehavior: Clip.hardEdge,
                alignment: AlignmentDirectional.bottomEnd,
                fit: StackFit.passthrough,
                children: [
              PageView.builder(
                        physics: new AlwaysScrollableScrollPhysics(),
                        padEnds: false,
                        allowImplicitScrolling: true,
                        itemCount: images.length,
                        pageSnapping: false,
                        scrollDirection: Axis.horizontal,
                        controller: _pageController,
                        onPageChanged: (int index) {
                          setState(() {
                            activePage = index;
                          });},
                        itemBuilder: (context, int index) {
                          return Stack(
                            children: [
                              Container(
                                  child: Padding(
                                      padding: EdgeInsets.only(
                                          bottom: 10.0, left: 4, right: 4),
                                      child: Row(children: [
                                        Expanded(
                                            child: Container(
                                                decoration: BoxDecoration(
                                                    gradient: LinearGradient(
                                                  end: FractionalOffset
                                                      .bottomRight,
                                                  begin: Alignment.bottomRight,
                                                  stops: [0.1, 0.9],
                                                  colors: [
                                                    Theme.of(context)
                                                        .colorScheme
                                                        .primary
                                                        .withOpacity(0.32),
                                                    Theme.of(context)
                                                        .colorScheme
                                                        .secondary
                                                        .withOpacity(0.39)
                                                  ])),
                                                height: 480,
                                                width: 700,
                                                child: Stack(children: [
                                                  Center(
                                                      child: Container(
                                                          width: size.width *
                                                              0.85,
                                                          alignment: Alignment
                                                              .centerRight,
                                                          child: Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      right:
                                                                          200),
                                                              child: Text(
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .visible,
                                                                  maxLines: 1,
                                                                  softWrap:
                                                                      true,
                                                                  left[index],
                                                                  style: Theme.of(
                                                                          context)
                                                                      .textTheme
                                                                      .headline1
                                                                      ?.copyWith(
                                                                        color: themeProvider.getTheme ==
                                                                                darkTheme
                                                                            ? Colors.pink.withOpacity(0.9)
                                                                            : Colors.red,
                                                                        fontSize: width >=
                                                                                1201
                                                                            ? 53
                                                                            : width >= 601
                                                                                ? 25
                                                                                : width >= 400
                                                                                    ? 16
                                                                                    : 14,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      )))))
                                                ]))),
                                        /////////////////////////////////////////////// Major Container ////////////////////////////
                                        Expanded(
                                            child: Container(
                                                height: 480,
                                                width: 700,
                                                decoration: BoxDecoration(
                                                    gradient: LinearGradient(
                                                        end: FractionalOffset
                                                            .bottomRight,
                                                        begin: Alignment
                                                            .bottomRight,
                                                        stops: [
                                                      0.1,
                                                      0.9
                                                    ],
                                                        colors: [
                                                      Theme.of(context)
                                                          .colorScheme
                                                          .primary
                                                          .withOpacity(0.70),
                                                      Theme.of(context)
                                                          .colorScheme
                                                          .secondary
                                                          .withOpacity(0.77)
                                                    ])),
                                                child: Stack(children: [
                                                  Center(
                                                      child: Container(
                                                          height: 100,
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left:
                                                                          200),
                                                              child: Text(
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .visible,
                                                                  maxLines: 1,
                                                                  softWrap:
                                                                      true,
                                                                  right[index],
                                                                  style: Theme.of(
                                                                          context)
                                                                      .textTheme
                                                                      .headline2
                                                                      ?.copyWith(
                                                                          fontWeight:
                                                                              FontWeight.w900,
                                                                          fontSize: width >= 1201
                                                                              ? 53
                                                                              : width >= 601
                                                                                  ? 25
                                                                                  : width >= 400
                                                                                      ? 16
                                                                                      : 14
                                                                  )))))])))]))),
                              Stack(
                                  children: [
                                ////////////////////////////////////////////  Main Image first Background  /////////////////////////////////////////
                                Center(
                                  child: Container(
                                    height: 400,
                                    width: 300,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: FutureBuilder(
                                        future: Future.delayed(Duration(
                                            milliseconds: 1500 * index)),
                                        builder: (ctx, timer) =>
                                            CachedNetworkImage(
                                              fit: BoxFit.cover,
                                              filterQuality: FilterQuality.high,
                                              imageUrl: images[index],
                                              progressIndicatorBuilder: (context,
                                                      url, downloadProgress) =>
                                                  Container(
                                                      alignment:
                                                          Alignment.topCenter,
                                                      margin: EdgeInsets.only(
                                                          top: 20),
                                                      child: Center(
                                                          child:
                                                              CircularProgressIndicator(
                                                        backgroundColor:
                                                            Colors.grey,
                                                        color: Colors.purple,
                                                        strokeWidth: 10,
                                                      ))),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      const Icon(
                                                Icons.error,
                                                size: 100,
                                                color: Colors.red,
                                              ),
                                            )),
                                  ),
                                ),

                                //GLASSMORPHIC CONTAINER BEGINS BELOW  /////////////////////////////////////////////////////

                                Positioned(
                                    left: 400,
                                    bottom: 100,
                                    child: GlassmorphicContainer(
                                        height: 100,
                                        width: 250,
                                        borderRadius: 15,
                                        blur: 15,
                                        alignment: Alignment.center,
                                        border: 2,
                                        linearGradient: LinearGradient(
                                            colors: [
                                              Colors.white.withOpacity(0.3),
                                              Colors.white38.withOpacity(0.3)
                                            ],
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight),
                                        borderGradient: LinearGradient(
                                            end: FractionalOffset.bottomRight,
                                            begin: Alignment.bottomRight,
                                            stops: [
                                              0.1,
                                              0.9
                                            ],
                                            colors: [
                                              Colors.white24.withOpacity(0.3),
                                              Colors.white70.withOpacity(0.3)
                                            ]),
                                        child: Container(
                                            alignment: Alignment.center,
                                            child: Stack(
                                              fit: StackFit.loose,
                                              clipBehavior:
                                                  Clip.antiAliasWithSaveLayer,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.all(10),
                                                        child: Column(
                                                          children: [
                                                            Container(
                                                                height: 60,
                                                                width: 60,
                                                                decoration: BoxDecoration(
                                                                    color: themeProvider.getTheme ==
                                                                            darkTheme
                                                                        ? Colors
                                                                            .white
                                                                        : Colors
                                                                            .black,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            12)),
                                                                child:
                                                                    CachedNetworkImage(
                                                                  height: 400,
                                                                  width: 300,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  filterQuality:
                                                                      FilterQuality
                                                                          .high,
                                                                  imageUrl: sub[
                                                                      index],
                                                                  progressIndicatorBuilder: (context,
                                                                          url,
                                                                          downloadProgress) =>
                                                                      Container(
                                                                          alignment: Alignment
                                                                              .topCenter,
                                                                          margin: EdgeInsets.only(
                                                                              top:
                                                                                  20),
                                                                          child:
                                                                              CircularProgressIndicator(
                                                                            backgroundColor:
                                                                                Colors.grey,
                                                                            color:
                                                                                Colors.purple,
                                                                            strokeWidth:
                                                                                3,
                                                                          )),
                                                                  errorWidget: (context,
                                                                          url,
                                                                          error) =>
                                                                      const Icon(
                                                                    Icons.error,
                                                                    size: 100,
                                                                    color: Colors
                                                                        .red,
                                                                  ),
                                                                ))
                                                          ],
                                                        )),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    10),
                                                            child: Text(
                                                              sub_one[index],
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .headline1
                                                                  ?.copyWith(
                                                                      color: themeProvider.getTheme ==
                                                                              darkTheme
                                                                          ? Colors
                                                                              .white
                                                                          : Colors
                                                                              .black,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w900,
                                                                      fontSize: width >=
                                                                              1201
                                                                          ? 12
                                                                          : width >= 601
                                                                              ? 12
                                                                              : width >= 400
                                                                                  ? 16
                                                                                  : 14),
                                                            )),
                                                        Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    10),
                                                            child: RichText(
                                                                text: TextSpan(
                                                                    text: price[
                                                                        index],
                                                                    style: Theme.of(context).textTheme.headline1?.copyWith(
                                                                        color: themeProvider.getTheme == darkTheme ? Colors.white : Colors.black,
                                                                        fontWeight: FontWeight.w900,
                                                                        fontSize: width >= 1201
                                                                            ? 12
                                                                            : width >= 601
                                                                                ? 12
                                                                                : width >= 400
                                                                                    ? 16
                                                                                    : 14),
                                                                    children: <InlineSpan>[
                                                                  WidgetSpan(
                                                                      alignment:
                                                                          PlaceholderAlignment
                                                                              .baseline,
                                                                      baseline:
                                                                          TextBaseline
                                                                              .alphabetic,
                                                                      child: SizedBox(
                                                                          width:
                                                                              4)),
                                                                  TextSpan(
                                                                    text: price_two[
                                                                        index],
                                                                    style: Theme.of(context).textTheme.headline1?.copyWith(
                                                                        color: themeProvider.getTheme == darkTheme ? Colors.black : Colors.white,
                                                                        fontWeight: FontWeight.w500,
                                                                        decoration: TextDecoration.lineThrough,
                                                                        fontSize: width >= 1201
                                                                            ? 10
                                                                            : width >= 601
                                                                                ? 7
                                                                                : width >= 400
                                                                                    ? 10
                                                                                    : 10),
                                                                  ),
                                                                ]))),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(4),
                                                                child:
                                                                    Container(
                                                                        height:
                                                                            10,
                                                                        child: RatingBar
                                                                            .builder(
                                                                          itemSize:
                                                                              11,
                                                                          initialRating:
                                                                              3,
                                                                          minRating:
                                                                              1,
                                                                          direction:
                                                                              Axis.horizontal,
                                                                          allowHalfRating:
                                                                              true,
                                                                          itemCount:
                                                                              5,
                                                                          itemPadding:
                                                                              EdgeInsets.symmetric(horizontal: 4.0),
                                                                          itemBuilder: (context, _) =>
                                                                              Icon(
                                                                            Icons.star,
                                                                            color: themeProvider.getTheme == darkTheme
                                                                                ? Colors.pink.withOpacity(0.8)
                                                                                : Colors.redAccent.withOpacity(0.9),
                                                                          ),
                                                                          onRatingUpdate:
                                                                              (rating) {
                                                                            print(rating);
                                                                          },
                                                                        ))),
                                                            SizedBox(width: 14),
                                                            Container(
                                                                height: 15,
                                                                width: 16,
                                                                decoration: BoxDecoration(
                                                                    color: Colors
                                                                        .black,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            12)),
                                                                child: Icon(
                                                                  Icons.add,
                                                                  size: 10,
                                                                  color: Colors
                                                                      .white,
                                                                )),],),],),],)],))))
                              ]),],);}),
                  ///////////// WEB  //////////
                  Positioned(
                      left: 50,
                      bottom: 310,
                      child:
                      Container(
                        alignment: Alignment.centerRight,
                        height: 190,
                        width: 250,
                        child: DescriptionSecondBackground(),
                      ))])));
  }
}
