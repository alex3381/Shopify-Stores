import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:provider/provider.dart';

import '../../../statemanagement/provider/theme_provider.dart';
import '../../../statemanagement/themes/theme.dart';




class SignatureDesign extends StatelessWidget {
  SignatureDesign({Key? key, required this.height}) : super(key: key);
  late double height;

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider =
    Provider.of<ThemeProvider>(context, listen: false);
return Padding(
    padding: const EdgeInsets.all(5),

  // child:Neumorphic(
  //               style: NeumorphicStyle(
  //                 shape: NeumorphicShape.concave,
  //                 boxShape:
  //                 NeumorphicBoxShape.roundRect(BorderRadius.circular(20)),
  //                 depth: 7,
  //                 lightSource: LightSource.bottom,
  //                 color: themeProvider
  //                     .getTheme == darkTheme
  //                     ? Colors.pink.withOpacity(0.8)
  //                     : Colors.white.withOpacity(0.9)
  //                     .withOpacity(0.8),
  //               ),


                // child: Padding(
                //     padding: const EdgeInsets.all(4),

                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Text("< ",
                        //     textAlign: TextAlign.center,
                        //     style: Theme.of(context).textTheme.bodyText1),

                    Container(
                    decoration: BoxDecoration(
                    color: themeProvider.getTheme == darkTheme
                    ? Colors.black45.withOpacity(0.1)
        : Colors.red.withOpacity(0.9),
    border: Border.all(
    color: themeProvider.getTheme == darkTheme
    ? (Colors.black45.withOpacity(0.2)) // Colors.black54
        : Colors.red.shade100,
    width: 0.2,
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
    )]),
                      child:  const Text(
                          "Alexander!!!",
                          style: TextStyle(
                            fontFamily: "Agustina",
                            fontSize: 17,
                            color: Colors.black,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 4.5,
                          ),
                        )),
                        // Text(
                        //     MediaQuery.of(context).size.width >= 1000
                        //         ? " />\t\t"
                        //         : " />",
                        //     textAlign: TextAlign.center,
                        //     style: Theme.of(context).textTheme.bodyText1)
                      ],
                    ));
    // ));
  }
}
