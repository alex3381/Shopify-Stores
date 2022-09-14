import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../responsive_ui/responsive_widget.dart';
import '../../statemanagement/provider/theme_provider.dart';
import '../../statemanagement/themes/theme.dart';
import 'animation/fadein_animation.dart';

class FirstTile extends StatelessWidget {
  const FirstTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: false);

    return  ResponsiveWidget.isSmallScreen(context)
             ? Padding(
        padding: EdgeInsets.all(6),
        child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Center(
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
                     child: EntranceFader(
                          duration: const Duration(milliseconds: 250),
                          offset: const Offset(0, -10),
                          delay: const Duration(seconds: 3),
                          child: Padding(
                              padding: EdgeInsets.all(1.0),
                    child: Text('Collections',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.headline2?.copyWith(fontSize: 8, fontWeight: FontWeight.w200
                    )))))),
                 Center(
                  heightFactor: 1,
                  child: Container(
                    alignment: Alignment.center,
                    height: 30,
                    width: 70,
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
                   child:   EntranceFader(
                          duration: const Duration(milliseconds: 250),
                          offset: const Offset(0, -10),
                          delay: const Duration(seconds: 3),
                          child: Padding(
                              padding: EdgeInsets.all(1.0),
                    child: Text('See All',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.headline2?.copyWith(fontSize: 8, fontWeight: FontWeight.w200)
                    )))))])))
     : Padding(
        padding: EdgeInsets.all(6),
        child: Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
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
   child: EntranceFader(
    duration: const Duration(milliseconds: 250),
    offset: const Offset(0, -10),
    delay: const Duration(seconds: 3),
    child: Padding(
    padding: EdgeInsets.all(1.0),
                child: Text('Collections',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.headline2?.copyWith(fontSize: 14, fontWeight: FontWeight.w200),
              ))))),
            Center(
              heightFactor: 1,
              child: Container(
                alignment: Alignment.center,
                height: 30,
                width: 70,
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
    child:EntranceFader(
    duration: const Duration(milliseconds: 250),
    offset: const Offset(0, -10),
    delay: const Duration(seconds: 3),
    child: Padding(
    padding: EdgeInsets.all(1.0),
                child: Text('See All',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.headline2?.copyWith(fontSize: 14, fontWeight: FontWeight.w200),
              )))))])));
  }
}
