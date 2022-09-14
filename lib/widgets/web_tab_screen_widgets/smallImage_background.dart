import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../responsive_ui/responsive_widget.dart';
import '../../statemanagement/provider/theme_provider.dart';



class SmallImageBackground extends StatelessWidget {
  const SmallImageBackground({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    return ResponsiveWidget.isSmallScreen(context)

      ? Container(
        height: 400,
        width: double.infinity,
        child:Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2.0),
                      gradient: LinearGradient(
                        end: FractionalOffset.bottomRight,
                        begin: Alignment.bottomRight,
                        stops: [
                          0.1,
                          0.9
                        ],
                        colors: [
                          Theme.of(context).colorScheme.primary.withOpacity(0.32),
                          Theme.of(context).colorScheme.secondary.withOpacity(0.39)
                        ],),),)),
              Expanded(
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2.0),
                        gradient: LinearGradient(
                          end: FractionalOffset.bottomRight,
                          begin: Alignment.bottomRight,
                          stops: [
                            0.1,
                            0.9
                          ],
                          colors: [
                            Theme.of(context).colorScheme.primary.withOpacity(0.70),
                            Theme.of(context).colorScheme.secondary.withOpacity(0.77)
                          ],

                        ),

                      ))
              )]))

        :Container(
      height: 630,
     width: double.infinity,
    child:Row(
      crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(2.0),
      gradient: LinearGradient(
        end: FractionalOffset.bottomRight,
        begin: Alignment.bottomRight,
        stops: [
          0.1,
          0.9
        ],
        colors: [
          Theme.of(context).colorScheme.primary.withOpacity(0.32),
          Theme.of(context).colorScheme.secondary.withOpacity(0.39)
        ],),),)),
          Expanded(
              child: Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(2.0),
    gradient: LinearGradient(
    end: FractionalOffset.bottomRight,
    begin: Alignment.bottomRight,
    stops: [0.1, 0.9],
    colors: [
    Theme.of(context).colorScheme.primary.withOpacity(0.70),
    Theme.of(context).colorScheme.secondary.withOpacity(0.77)
    ],),)))]));
    }}
