import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_outlets/widgets/reuseableWidgets/animation/fadein_animation.dart';
import '../../responsive_ui/responsive_widget.dart';
import '../../statemanagement/provider/theme_provider.dart';
import '../../statemanagement/themes/theme.dart';



class TopBarContents extends StatefulWidget {
  @override
  _TopBarContentsState createState() => _TopBarContentsState();
}

class _TopBarContentsState extends State<TopBarContents> {
  final List _isHovering = [
    false, false, false, false, false, false, false,];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    var screenSize = MediaQuery.of(context).size;
    return PreferredSize(
        preferredSize: Size(screenSize.width, 1000),
        child: Consumer<ThemeProvider>(
            builder: (context, ThemeProvider themeProvider, child) {
          return ResponsiveWidget.isSmallScreen(context)
           ?  SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                    padding: EdgeInsets.all(2),
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              end: FractionalOffset.bottomRight,
                              begin: Alignment.bottomRight,
                              stops: [
                                0.1,
                                0.9
                              ],
                              colors: [
                                Theme.of(context).colorScheme.primary.withOpacity(0.56),
                                Theme.of(context).colorScheme.secondary.withOpacity(0.65),
                              ])),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.060,
                      child: Padding(
                          padding: EdgeInsets.all(5),
                          child: Row(
                            children: [
                              Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  children: [
                                    CachedNetworkImage(
                                      height: 30,
                                      width: 40,
                                      fit: BoxFit.contain,
                                      imageUrl:
                                      'https://i.postimg.cc/13gk3Q5d/red.png',
                                      progressIndicatorBuilder: (context, url,
                                          downloadProgress) =>
                                          Container(
                                              alignment: Alignment.topCenter,
                                              margin: EdgeInsets.only(top: 20),
                                              child: CircularProgressIndicator(
                                                backgroundColor: Colors.grey,
                                                color: Colors.purple,
                                                strokeWidth: 2,
                                              )),
                                      errorWidget: (context, url, error) =>
                                      const Icon(
                                        Icons.error,
                                        size: 100,
                                        color: Colors.red)),
                                    Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          EntranceFader(
                                              duration: const Duration(milliseconds: 250),
                                              offset: const Offset(0, -10),
                                              delay: const Duration(seconds: 4),
                                              child:  Flexible(
                                                  flex: 1,
                                                  child: Text(
                                                    textScaleFactor: 1,
                                                    'SHOPIFY',
                                                    textAlign: TextAlign.center,
                                                    style: Theme.of(context).textTheme.headline2
                                                        ?.copyWith(fontWeight: FontWeight.w900,
                                                        fontSize: width >= 1201
                                                            ? 17 : width >= 601
                                                            ? 11 : width >= 400
                                                            ? 11 : 9,
                                                        letterSpacing: 0.5),
                                                  ))),
                                          Flexible(
                                              flex: 1,
                                              child: Text('STORE',
                                                  textAlign: TextAlign.center,
                                                  style: Theme.of(context).textTheme.headline2
                                                      ?.copyWith(fontWeight: FontWeight.w900,
                                                      fontSize: width >= 1201
                                                          ? 17 : width >= 601
                                                          ? 11 : width >= 400
                                                          ? 11 : 9,

                                                      letterSpacing: 0.5)
                                              ))])]),
                              Spacer(),
                              Row(
                                children: [
                                  InkWell(
                                      onHover: (value) {
                                        setState(() {
                                          value
                                              ? _isHovering[1] = true
                                              : _isHovering[1] = false;
                                        });},
                                      onTap: () {},
                                      child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            EntranceFader(
                                                duration: const Duration(milliseconds: 250),
                                                offset: const Offset(0, -10),
                                                delay: const Duration(seconds: 3),
                                                child: Flexible(
                                                    flex: 1,
                                                    child: Text('CATEGORIES',
                                                        style: Theme.of(context).textTheme.headline1?.copyWith(
                                                          fontWeight: FontWeight.w400,
                                                      fontSize: width >= 1201
                                                          ? 17 : width >= 601
                                                          ? 11 : width >= 400
                                                          ? 11: 10,
                                                )))),
                                            const SizedBox(height: 5),
                                            Visibility(
                                                maintainAnimation: true,
                                                maintainState: true,
                                                maintainSize: true,
                                                visible: _isHovering[1],
                                                child: Container(
                                                  height: 2,
                                                  width: 20,
                                                  color: Colors.black45,
                                                ))])),

                                  SizedBox(width: 10),
                                  InkWell(
                                      onHover: (value) {
                                        setState(() {
                                          value
                                              ? _isHovering[3] = true
                                              : _isHovering[3] = false;
                                        });},
                                      onTap: () {},
                                      child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            EntranceFader(
                                              duration: const Duration(milliseconds: 250),
                                              offset: const Offset(0, -10),
                                              delay: const Duration(seconds: 3),
                                              child: Flexible(
                                                  flex: 2,
                                                  child: Text('FAQS',
                                                      style: Theme.of(context).textTheme.headline1?.copyWith(
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: width >= 1201
                                                            ? 17 : width >= 601
                                                            ? 11 : width >= 400
                                                            ? 11: 10,
                                                      ))),
                                            ),
                                            const SizedBox(height: 5),
                                            Visibility(
                                                maintainAnimation: true,
                                                maintainState: true,
                                                maintainSize: true,
                                                visible: _isHovering[3],
                                                child: Container(
                                                  height: 2,
                                                  width: 20,
                                                  color: Colors.black45,
                                                ))])),
                                  SizedBox(width: 10),
                                  InkWell(
                                    onHover: (value) {
                                      setState(() {
                                        value
                                            ? _isHovering[4] = true
                                            : _isHovering[4] = false;
                                      });},
                                    onTap: () {},
                                        child: Center(
                                          heightFactor: 1,
                                         child: Container(
                                           alignment: Alignment.center,
                                            height: 30,
                                            width: 30,
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
                                              borderRadius: BorderRadius.circular(15),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black45.withOpacity(0.2),
                                                  offset: const Offset(
                                                    1.0, 1.0,
                                                  ), //Offset
                                                  blurRadius: 1.0,
                                                  spreadRadius: 1.0,), //BoxShadow
                                                BoxShadow(
                                                  color: Colors.white,
                                                  offset: const Offset(0.0, 0.0),
                                                  blurRadius: 0.0,
                                                  spreadRadius: 0.0,
                                                )]),
                                          child: IconButton(
                                            iconSize: 14,
                                            splashColor: Colors.pink,
                                            color:  themeProvider.getTheme ==
                                                darkTheme
                                                ? Colors.white.withOpacity(0.90)
                                                : Colors.black.withOpacity(0.90),
                                            icon: Icon(
                                              themeProvider.getTheme ==
                                                  darkTheme
                                                  ? Icons.dark_mode
                                                  : Icons.light_mode,
                                              // color: controller.textColor
                                            ),
                                            onPressed: () {
                                              themeProvider.changeTheme();
                                            }))))])]))))]))

              //////////// Large Screen /////////////
              : SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                    padding: EdgeInsets.all(2),
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              end: FractionalOffset.bottomRight,
                              begin: Alignment.bottomRight,
                              stops: [
                                0.1,
                                0.9
                              ],
                              colors: [
                                Theme.of(context).colorScheme.primary.withOpacity(0.60),
                                Theme.of(context).colorScheme.secondary.withOpacity(0.70),
                              ])),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.060,
                      child: Padding(
                          padding: EdgeInsets.all(5),
                          child: Row(
                            children: [
                              Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  children: [
                                    CachedNetworkImage(
                                      height: 30,
                                      width: 40,
                                      fit: BoxFit.contain,
                                      imageUrl:
                                      'https://i.postimg.cc/13gk3Q5d/red.png',
                                      progressIndicatorBuilder: (context, url,
                                          downloadProgress) =>
                                          Container(
                                              alignment: Alignment.topCenter,
                                              margin: EdgeInsets.only(top: 20),
                                              child: CircularProgressIndicator(
                                                backgroundColor: Colors.grey,
                                                color: Colors.purple,
                                                strokeWidth: 2,
                                              )),
                                      errorWidget: (context, url, error) =>
                                      const Icon(
                                        Icons.error,
                                        size: 100,
                                        color: Colors.red,
                                      ),
                                    ),
                                    Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          EntranceFader(
                                              duration: const Duration(milliseconds: 250),
                                              offset: const Offset(0, -10),
                                              delay: const Duration(seconds: 4),
                                              child:  Flexible(
                                                  flex: 1,
                                                  child: Text(
                                                      textScaleFactor: 1,
                                                      'SHOPIFY',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headline2))),
                                          Flexible(
                                              flex: 1,
                                              child: Text('STORE',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline3?.copyWith(
                                                    fontWeight: FontWeight.w200,
                                                    fontSize: width >= 1201
                                                        ? 17 : width >= 601
                                                        ? 11 : width >= 400
                                                        ? 9: 8,)))])]),
                              SizedBox(width: 90),
                              InkWell(
                                  onHover: (value) {
                                    setState(() {
                                      value
                                          ? _isHovering[0] = true
                                          : _isHovering[0] = false;
                                    });},
                                  onTap: () {},
                                  child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        EntranceFader(
                                            duration: const Duration(milliseconds: 250),
                                            offset: const Offset(0, -10),
                                            delay: const Duration(seconds: 3),
                                            child: Flexible(
                                                flex: 1,
                                                child: Text('Discover',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headline1))),
                                        const SizedBox(height: 5),
                                        Visibility(
                                            maintainAnimation: true,
                                            maintainState: true,
                                            maintainSize: true,
                                            visible: _isHovering[0],
                                            child: Container(
                                              height: 2,
                                              width: 20,
                                              color: Colors.black45,
                                            ))])),
                              SizedBox(width: 30),
                              InkWell(
                                  onHover: (value) {
                                    setState(() {
                                      value
                                          ? _isHovering[1] = true
                                          : _isHovering[1] = false;
                                    });},
                                  onTap: () {},
                                  child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        EntranceFader(
                                            duration: const Duration(milliseconds: 250),
                                            offset: const Offset(0, -10),
                                            delay: const Duration(seconds: 3),
                                            child: Flexible(
                                                flex: 1,
                                                child: Text('Categories',
                                                    style: Theme.of(context).textTheme.headline1))),
                                        const SizedBox(height: 5),
                                        Visibility(
                                            maintainAnimation: true,
                                            maintainState: true,
                                            maintainSize: true,
                                            visible: _isHovering[1],
                                            child: Container(
                                              height: 2,
                                              width: 20,
                                              color: Colors.black45,
                                            ))])),
                              SizedBox(width: 25),
                              InkWell(
                                  onHover: (value) {
                                    setState(() {
                                      value
                                          ? _isHovering[2] = true
                                          : _isHovering[2] = false;
                                    });
                                  },
                                  onTap: () {},
                                  child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        EntranceFader(
                                            duration: const Duration(milliseconds: 250),
                                            offset: const Offset(0, -10),
                                            delay: const Duration(seconds: 3),
                                            child:  Flexible(
                                                flex: 2,
                                                child: Text('Contact Us',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headline1))),
                                        const SizedBox(height: 5),
                                        Visibility(
                                            maintainAnimation: true,
                                            maintainState: true,
                                            maintainSize: true,
                                            visible: _isHovering[2],
                                            child: Container(
                                              height: 2,
                                              width: 20,
                                              color: Colors.black45,
                                            ))])),
                              SizedBox(width: 30),
                              Spacer(),
                              Row(
                                children: [
                                  InkWell(
                                      onHover: (value) {
                                        setState(() {
                                          value
                                              ? _isHovering[3] = true
                                              : _isHovering[3] = false;
                                        });},
                                      onTap: () {},
                                      child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            EntranceFader(
                                              duration: const Duration(milliseconds: 250),
                                              offset: const Offset(0, -10),
                                              delay: const Duration(seconds: 3),
                                              child: Flexible(
                                                  flex: 2,
                                                  child: Text('FAQS',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headline1)),
                                            ),
                                            const SizedBox(height: 5),
                                            Visibility(
                                                maintainAnimation: true,
                                                maintainState: true,
                                                maintainSize: true,
                                                visible: _isHovering[3],
                                                child: Container(
                                                  height: 2,
                                                  width: 20,
                                                  color: Colors.black45,
                                                ))])),
                                  SizedBox(width: 25),
                                  InkWell(
                                    onHover: (value) {
                                      setState(() {
                                        value
                                            ? _isHovering[4] = true
                                            : _isHovering[4] = false;
                                      });},
                                    onTap: () {},
                                    child: Center(
                                      heightFactor: 1,
                                      child: Container(
                                        alignment: Alignment.center,
                                        height: 30,
                                        width: 30,
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
                                          borderRadius: BorderRadius.circular(15),
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
                                            ), //BoxShadow
                                          ],
                                        ),
                                        child: IconButton(

                                          iconSize: 14,
                                          splashColor: Colors.pink,
                                          color:  themeProvider.getTheme ==
                                              darkTheme
                                              ? Colors.white.withOpacity(0.90)
                                              : Colors.black.withOpacity(0.90),
                                          icon: Icon(
                                            themeProvider.getTheme ==
                                                darkTheme
                                                ? Icons.dark_mode
                                                : Icons.light_mode,
                                            ),
                                          onPressed: () {
                                            themeProvider.changeTheme();
                                          }))))])]))))]));
        }));
  }
}
