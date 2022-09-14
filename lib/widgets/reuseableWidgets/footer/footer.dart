
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:provider/provider.dart';
import 'package:shop_outlets/widgets/reuseableWidgets/social_media_icons/socialmediaicons.dart';
import '../../../constant.dart';
import '../../../responsive_ui/responsive_widget.dart';
import '../../../statemanagement/provider/theme_provider.dart';
import '../Clipper_and Others/custom-clippath.dart';
import 'bottomfooter_column.dart';
import 'infotext.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.all(5),
      child:ResponsiveWidget.isSmallScreen(context)
          ? Container(
        height: 280,
        width: double.infinity,
       child: Stack(
          children:[
            MyWaveClipper(),

      Column(
        children: [
          SizedBox(height: 20),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BottomBarColumn(
                iconData: Icons.call,
                s1: 'Contact Us',
                s2: 'Orders/Shipping',
                s3: 'Exclusive Services',

              ),
              BottomBarColumn(
                iconData: Icons.layers,
                s1: 'Payment',
                s2: 'Cookie Policy',
                s3: 'Cancellation',

                // s3: 'FAQ',
              ),
              BottomBarColumn(
                iconData: Icons.facebook,
                s1: 'Twitter',
                s2: 'Facebook',
                s3: 'YouTube',
                // heading:'Instagramme' ,
              ),
            ],
          ),
          Container(
            color: Colors.blueGrey,
            width: double.maxFinite,
            height: 1,
          ),
          const SizedBox(height: 20),
          InfoText(
            type: 'Email',
            text: 'alex.fatogun@gmail.com',
          ),
          const SizedBox(height: 5),
          InfoText(
            type: 'Address',
            text: 'No 13, Christ Avenue, Lekki Phase 1, Lagos - Nigeria',


          ),
          const SizedBox(height: 20),
          Container(
            color: Colors.blueGrey,
            width: double.maxFinite,
            height: 1,
          ),
          const SizedBox(height: 20),
          Text(
            'Copyright © 2022 | FATOGUN ALEX',
            style: TextStyle(
              color: Colors.blueGrey[300],
              fontSize: 14,
            ),
          ),
        ],
      )
      ]))
            ////////  Big screen  ////////////////////

          : Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
               BottomBarColumn(
                 iconData: Icons.call,
                s1: 'Contact Us',
                s2: 'Orders/Shipping',
                 s3: 'Exclusive Services',
              ),
               BottomBarColumn(
                 iconData: Icons.layers,
                s1: 'Payment',
                s2: 'Cookie Policy',
                 s3: 'Cancellation',
              ),
               BottomBarColumn(
                 iconData: Icons.location_on,
                s1: 'Store Locator',
                s2: 'Customer Service',
                s3: 'Nigeria | EN (₦)',

              ),
              Container(
                color: Colors.blueGrey,
                width: 2,
                height: 150,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: List.generate(
                      kSocialIcons.length,
                          (index) =>
                          SocialMediaIconButton(
                            icon: kSocialIcons[index],
                          ),
                    ),
                  ),
                  InfoText(
                    type: 'Email',
                    text: 'alex.fatogun@yahoo.com',
                  ),
                  const SizedBox(height: 5),
                  InfoText(
                    type: 'Address',
                    text: 'No 13A, Christ Avenue, Lekki Phase 1, Lagos',
                  ),

                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: const Color(0xFF162A49),
              width: double.maxFinite,
              height: 1,
            )),
          const SizedBox(height: 20),
          Text(
            'Copyright © 2022 | FATOGUN ALEX',
            style: TextStyle(
              color: Colors.blueGrey[300],
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
