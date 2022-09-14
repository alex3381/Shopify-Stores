import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../statemanagement/provider/theme_provider.dart';
import '../../../statemanagement/themes/theme.dart';

class InfoText extends StatelessWidget{
  final String type;
  final String text;
  InfoText({required this.type, required this.text,});
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    return

      Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$type: ',
          style: TextStyle(
            color: themeProvider.getTheme == darkTheme
                ? Colors.pink.withOpacity(0.9)
                : Colors.red,
                   fontSize: 12,
          ),
        ),
        Flexible(
          child: Text(
            text,
            style: TextStyle(
              color: themeProvider.getTheme == darkTheme
                  ? Colors.pink.withOpacity(0.9)
                  : Colors.red,
              fontSize: 12,
            )))],
    );
  }
}
