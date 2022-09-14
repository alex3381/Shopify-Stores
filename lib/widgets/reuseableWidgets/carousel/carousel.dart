import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:panorama/panorama.dart';
import 'package:provider/provider.dart';
import '../../../constant.dart';
import '../../../statemanagement/provider/theme_provider.dart';
import '../../../statemanagement/themes/theme.dart';

class Carousel extends StatefulWidget {
  const Carousel({Key? key}) : super(key: key);
  @override
  _CarouselState createState() => _CarouselState();
}
class _CarouselState extends State<Carousel> {
  late final PageController _pageController;
  int index = 0;
  int _activePageIndex = 0;
  bool end = false;
  @override
  void initState() {
    _pageController = PageController(
      initialPage: 0,
      viewportFraction: 0.8,
    );
    super.initState();
    Timer.periodic(const Duration(seconds: 2), (Timer timer) {
      if (_activePageIndex   ==  imagesCarousel.length ) {
        end = true;
      } else if (_activePageIndex  == 0) {
        end = false;
      }

      if (end == false) {
        _activePageIndex ++;
      } else {
        _activePageIndex--;
      }

      _pageController.animateToPage(
        _activePageIndex ,
          duration: const Duration(milliseconds: 1000),
        curve: Curves.easeIn,
      );});}
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    return Center(
     child: Padding(padding:const EdgeInsets.all(15),
          child: Column(
              children: [
                Stack(
                    children: [
                      SizedBox(
                          height: 400,
                          child: PageView.builder(
                              allowImplicitScrolling: true,
                              physics: const AlwaysScrollableScrollPhysics(),
                              pageSnapping: true,
                              clipBehavior: Clip.antiAlias,
                              controller: _pageController,
                              itemCount:imagesCarousel.length,
                              onPageChanged: ( int index ) {
                                setState(() {_activePageIndex  = index;
                                });},
                              itemBuilder: (c,i) {
                                 return  AnimatedScale(
                                   scale: _activePageIndex  == i ? 1 : 0.85,
                                duration: const Duration(milliseconds: 300),
                                child: Container(
                                    height: 200,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 10,
                                          color: Colors.black.withOpacity(0.1),
                                        )]),
                                    child: SizedBox(
                                      child: Stack(
                                          children: [
                                            ClipRRect(
                                              borderRadius: BorderRadius.circular(20.0),
                                             child: Panorama(
                                                animSpeed: 18.0,
                                                animReverse: true,
                                                interactive: true,
                                                zoom: 0,
                                                hotspots: [
                                                  Hotspot(
                                                    latitude: -15.0,
                                                    longitude: -129.0,
                                                    width: 30,
                                                    height: 75,
                                                  )],
                                                child: Image.network(imagesCarousel[_activePageIndex],
                                                  fit: BoxFit.contain,
                                                ))),

                                             Center(
                                           child: AspectRatio(
                                              aspectRatio: 18 / 8,
                                              child: Center(
                                                child: Text(
                                                  products[_activePageIndex],
                                                  style: TextStyle(
                                                    letterSpacing: 8,
                                                    fontFamily: "Electrolize",
                                                    fontSize: screenSize.width / 25,
                                                    color:   themeProvider.getTheme == darkTheme
                                ? Colors.white.withOpacity(0.9)
                                    : Colors.black.withOpacity(0.9),
                                                  ),))))]))));}))])])));
  }}

