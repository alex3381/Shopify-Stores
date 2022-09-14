import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:provider/provider.dart';
import '../../../statemanagement/provider/theme_provider.dart';
import '../../../statemanagement/themes/theme.dart';


class BottomBarColumn  extends StatelessWidget {

   BottomBarColumn ({Key? key, required this.s1, required this.s2,required this.s3,   required this.iconData}) : super(key: key);

 final  IconData iconData;
  final String s1;
  final String s2;
  final String s3;





  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

        NeumorphicIcon(
          iconData,
          size: 28,
          style: NeumorphicStyle(
            shape: NeumorphicShape.convex,
            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(15)),
            depth: 3,
            lightSource: LightSource.topLeft,
            color:  themeProvider.getTheme == darkTheme
          ? Colors.pink.withOpacity(0.9)
              : Colors.red
          )),

          const SizedBox(
            height: 5,
          ),
          Text(
            s1,
            style: TextStyle(
              color: themeProvider.getTheme == darkTheme
            ? Colors.pink.withOpacity(0.9)
                : Colors.red,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            s2,
            style: TextStyle(
              color: themeProvider.getTheme == darkTheme
                  ? Colors.pink.withOpacity(0.9)
                  : Colors.red,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            s3,
            style: TextStyle(
              color: themeProvider.getTheme == darkTheme
                  ? Colors.pink.withOpacity(0.9)
                  : Colors.red,
              fontSize: 12,
            ))]));
  }
}
