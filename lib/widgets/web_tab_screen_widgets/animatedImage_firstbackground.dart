import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../constant.dart';
import '../../responsive_ui/responsive_widget.dart';
import '../reuseableWidgets/double_rectangle.dart';

class AnimatedImageFirstBackground extends StatefulWidget {
  const AnimatedImageFirstBackground({Key? key}) : super(key: key);
  @override
  State<AnimatedImageFirstBackground> createState() => _AnimatedImageFirstBackgroundState();}
class _AnimatedImageFirstBackgroundState extends State<AnimatedImageFirstBackground> {
  late final Timer timer;
  int _index = 0;
  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 9), (timer) {
      setState(() => _index++);
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
   return ResponsiveWidget.isSmallScreen(context)

     ? Column(
     children: [
       Stack(
         fit: StackFit.loose,
         children: [
           Container(
               height: 300,
               width: 300,
               child:AnimatedSwitcher(
                   switchInCurve: Curves.linear,
                   duration: Duration(milliseconds: 200),
                   transitionBuilder: (child,
                       Animation<double> animation) =>
                       FadeTransition(
                         child: SizedBox.expand(child: child),
                         opacity:
                         Tween<double>(begin: 0.5, end: 1.0)
                             .animate(
                           CurvedAnimation(
                             parent: animation,
                             curve: Interval(0.5, 1.0),
                           ),),
                         alwaysIncludeSemantics: true,
                       ),
                   child: CachedNetworkImage(
                       height: 300,
                       width: 300,
                       imageUrl: values[_index % values.length],
                       colorBlendMode: BlendMode.colorBurn,
                       color: Color(0xFF18FFFF).withOpacity(0.3),
                       imageBuilder: (
                           context,
                           imageProvider,
                           ) => Container(
                           height: 300,
                           decoration: BoxDecoration(
                               image: DecorationImage(
                                 image: imageProvider,
                                 fit: BoxFit.cover,
                                 filterQuality: FilterQuality.high,
                               ) )),
                       key: UniqueKey(),
                       placeholder: (context, url) => Container(
                         alignment: Alignment.center,
                         margin: EdgeInsets.only(top: 20),
                         width: 20,
                         height: 200,
                         child: CircularProgressIndicator(
                           backgroundColor: Colors.grey,
                           color: Colors.purple,
                           strokeWidth: 4,
                         ),
                       ),
                       errorWidget: (context, url, error) =>
                       const Icon(
                         Icons.error,
                         size: 100,
                         color: Colors.red,
                       )))),
         ],)],)

     :Column(
      children: [
         Stack(
           fit: StackFit.loose,
                children: [

           Container(
           height: 500,
           width: 500,
              child:AnimatedSwitcher(
                  switchInCurve: Curves.linear,
                  duration: Duration(milliseconds: 200),
                  transitionBuilder: (child,
                          Animation<double> animation) =>
                      FadeTransition(
                        child: SizedBox.expand(child: child),
                        opacity:
                            Tween<double>(begin: 0.5, end: 1.0)
                                .animate(
                          CurvedAnimation(
                            parent: animation,
                            curve: Interval(0.5, 1.0),
                          ),),
                        alwaysIncludeSemantics: true,
                      ),
                  child: Container(
                    child: Stack(
                      children: [


                  CachedNetworkImage(
                      height: 500,
                      width: 500,
                      imageUrl: values[_index % values.length],
                      colorBlendMode: BlendMode.colorBurn,
                      color: Color(0xFF18FFFF).withOpacity(0.3),
                      imageBuilder: (
                        context,
                        imageProvider,
                      ) => Container(
                            height: 600,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                                filterQuality: FilterQuality.high,
                              ) )),
                      key: UniqueKey(),
                      placeholder: (context, url) => Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(top: 20),
                            width: 20,
                            height: 200,
                            child: CircularProgressIndicator(
                              backgroundColor: Colors.grey,
                              color: Colors.purple,
                              strokeWidth: 4,
                            ),
                          ),
                      errorWidget: (context, url, error) =>
                          const Icon(
                            Icons.error,
                            size: 100,
                            color: Colors.red,
                          )),



                      ])
              ),
              ))])],);
  }
}
