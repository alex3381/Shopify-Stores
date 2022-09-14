import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../statemanagement/provider/theme_provider.dart';
import '../../statemanagement/themes/theme.dart';

class ThirdTile extends StatelessWidget {
  const ThirdTile({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(
        context, listen: false);
    double width = MediaQuery
        .of(context).size.width;
    return Padding(padding: EdgeInsets.all(10),
        child: Container(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: themeProvider.getTheme == darkTheme
                                ? Colors.black54.withOpacity(0.5)
                                : Colors.red.withOpacity(0.5),
                            width: 1.0,
                            style: BorderStyle.solid
                        )
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(1.0),
                      child: Text(
                        'Collections',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme
                            .of(context)
                            .textTheme
                            .headlineLarge
                            ?.copyWith(
                            fontSize: width >= 1201
                                ? 12 : width >= 601 ? 10
                                : width >= 400
                                ? 10 : 10,
                            color: themeProvider.getTheme == darkTheme
                                ? Colors.black54.withOpacity(0.7)
                                : Colors.red.withOpacity(0.7),
                            fontWeight: FontWeight.w900,
                            letterSpacing: 0.5),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        // color: Colors.pink,
                        border: Border.all(
                            color: themeProvider.getTheme == darkTheme
                                ? Colors.black54.withOpacity(0.5)
                                : Colors.red.withOpacity(0.5),
                            width: 1.0,
                            style: BorderStyle.solid
                        )),
                    child: Padding(
                      padding: EdgeInsets.all(1.0),
                      child: Text(
                        'See All',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme
                            .of(context)
                            .textTheme
                            .headlineLarge
                            ?.copyWith(
                            fontSize: width >= 1201 ? 12
                                : width >= 601 ? 10
                                : width >= 400 ? 10 : 10,
                            color: themeProvider.getTheme == darkTheme
                                ? Colors.black54.withOpacity(0.7)
                                : Colors.red.withOpacity(0.7),
                            fontWeight: FontWeight.w900,
                            letterSpacing: 0.5),
                      ),
                    ),
                  )
                ])));
  }}