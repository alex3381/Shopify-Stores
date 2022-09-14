import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:provider/provider.dart';
import '../../constant.dart';
import '../../statemanagement/provider/theme_provider.dart';
import '../../statemanagement/themes/theme.dart';

class DescriptionSecondBackground_Mobile extends StatefulWidget {
  DescriptionSecondBackground_Mobile  ({Key? key}) : super(key: key);
  @override
  State<DescriptionSecondBackground_Mobile > createState() =>
      _DescriptionSecondBackground_MobileState();
}
class _DescriptionSecondBackground_MobileState
    extends State<DescriptionSecondBackground_Mobile > {
  @override
  int index = 0;
  late final PageController _pageController;

  int activePage = 0;
  final int _current = 0;
  bool end = false;
  late Timer _timer;

  @override
  void initState() {
    _pageController = PageController(
      viewportFraction: 0.99,
      initialPage: 0,
    );

    super.initState();
    _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
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
    double width = MediaQuery.of(context).size.width;
    ThemeProvider themeProvider =
    Provider.of<ThemeProvider>(context, listen: false);
    return Align(
          alignment: Alignment.center,
          child: Center(
           heightFactor: 1,
              child: GlassmorphicContainer(
                  height: 60,
                  width: 160,
                  borderRadius: 15,
                  blur: 15,
                  alignment: Alignment.center,
                  border: 2,
                  linearGradient: LinearGradient(
                    end: FractionalOffset.bottomRight,
                    begin: Alignment.bottomRight,
                    stops: [
                      0.1,
                      0.9
                    ],
                    colors: [
                      Colors.white.withOpacity(0.3),
                      Colors.white38.withOpacity(0.3)
                    ],
                  ),
                  borderGradient: LinearGradient(colors: [
                    Colors.white24.withOpacity(0.3),
                    Colors.white70.withOpacity(0.3)
                  ]),


         child:Padding(
                  padding:EdgeInsets.all(5),
                  child: Container(
                      height: 45,
                      alignment: Alignment.center,
                      child: PageView.builder(
                          physics: new AlwaysScrollableScrollPhysics(),
                          padEnds: false,
                          allowImplicitScrolling: true,
                          itemCount: images.length,
                          pageSnapping: true,
                          scrollDirection: Axis.horizontal,
                          controller: _pageController,
                          onPageChanged: (int index) {
                            setState(() {
                              activePage = index;
                            });
                          },
                          itemBuilder: (context, int index) {
                            return Stack(
                                fit: StackFit.expand,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                children: [
                                  Column(
                                    children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                            Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [

                                              Container(
                                                  height: 40,
                                                  width: 40,
                                                  decoration: BoxDecoration(
                                                      color: themeProvider.getTheme == darkTheme
                                                          ?   Colors.white.withOpacity(0.9)
                                                          : Colors.black.withOpacity(0.7),
                                                      borderRadius: BorderRadius.circular(4)),
                                                  child: CachedNetworkImage(
                                                    height: 30,
                                                    width: 30,
                                                    fit: BoxFit.cover,
                                                    filterQuality:
                                                    FilterQuality.high,
                                                    imageUrl:
                                                    sub_division[index],
                                                    progressIndicatorBuilder: (context,
                                                        url,
                                                        downloadProgress) =>
                                                        Container(
                                                            alignment: Alignment.topCenter,
                                                            margin: EdgeInsets.only(top: 5),
                                                            child: CircularProgressIndicator(
                                                              backgroundColor: Colors.grey,
                                                              color: Colors.purple,
                                                              strokeWidth: 2,

                                                            )
                                                        ),
                                                    errorWidget:
                                                        (context, url, error) =>
                                                    const Icon(
                                                      Icons.error,
                                                      size: 10,
                                                      color: Colors.red,
                                                    )))]),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                              padding: EdgeInsets.all(2),
                                              child: Text(description_one[index],
                                                style:  Theme.of(context).textTheme.headline1?.copyWith(
                                                    color: themeProvider.getTheme == darkTheme
                                                        ?   Colors.white
                                                        :   Colors.black,
                                                    fontWeight: FontWeight.w400, fontSize: 7,)


                                              )),
                                          Padding(
                                              padding: EdgeInsets.all(2),
                                              child: RichText(
                                                  text: TextSpan(
                                                      text: tag[index],
                                                      style:  Theme.of(context).textTheme.headline1?.copyWith(
                                                        color: themeProvider.getTheme == darkTheme
                                                            ?   Colors.white
                                                            :   Colors.black,
                                                        fontWeight: FontWeight.w300,
                                                        fontSize: 6
                                                      ),
                                                      children: <InlineSpan>[
                                                        WidgetSpan(alignment: PlaceholderAlignment.baseline,
                                                            baseline: TextBaseline.alphabetic,
                                                            child: SizedBox(width: 2)),
                                                        TextSpan(
                                                          text: tag_two[index],
                                                          style:  Theme.of(context).textTheme.headline1?.copyWith(
                                                              color: themeProvider.getTheme == darkTheme
                                                                  ?   Colors.black
                                                                  :   Colors.white,

                                                              fontWeight: FontWeight.w200,
                                                              decoration: TextDecoration.lineThrough,
                                                              fontSize: 5,
                                                        )),

                                                      ]))),
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                  padding: EdgeInsets.all(4),
                                                  child: Container(
                                                      height: 10,
                                                      child: RatingBar.builder(
                                                        itemSize: 5,
                                                        initialRating: 3,
                                                        minRating: 1,
                                                        direction:
                                                        Axis.horizontal,
                                                        allowHalfRating: true,
                                                        itemCount: 5,
                                                        itemPadding: EdgeInsets
                                                            .symmetric(
                                                            horizontal: 3.0),
                                                        itemBuilder:
                                                            (context, _) =>
                                                            Icon(
                                                              Icons.star,
                                                              color: themeProvider.getTheme == darkTheme
                                                                  ?   Colors.white
                                                                  :   Colors.black,
                                                            ),
                                                        onRatingUpdate: (rating) {
                                                          print(rating);
                                                        }))),
                                              SizedBox(width: 7),
                                              Container(
                                                  height: 10,
                                                  width: 12,
                                                  decoration: BoxDecoration(
                                                      color: themeProvider.getTheme == darkTheme
                                                          ?   Colors.black
                                                          :   Colors.white,
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          5)),
                                                  child: Icon(
                                                    Icons.shopping_cart_checkout_sharp,
                                                    size: 6,
                                                    color: themeProvider.getTheme == darkTheme
                                                        ?   Colors.white
                                                        :   Colors.black,
                                                  )),])])])])],
                            );})))),
    ));
  }
}
