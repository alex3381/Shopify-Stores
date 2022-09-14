import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../statemanagement/provider/theme_provider.dart';
import '../../../statemanagement/themes/theme.dart';

class SocialMediaIconButton extends StatelessWidget {
  final String icon;
  const SocialMediaIconButton({Key? key,  required this.icon,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context, listen: false);

    return Align(
      alignment: Alignment.topLeft,
      child: IconButton(
        icon: Image.network(icon,
          color: themeProvider.getTheme ==
              darkTheme
              ? Colors.pink.withOpacity(0.9)
              :  Colors.red,
        ),
        iconSize: 7,
        onPressed: () {  },
      ),
    );
  }
}
