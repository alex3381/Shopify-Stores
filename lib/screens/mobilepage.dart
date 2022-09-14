import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:panorama/panorama.dart';
import 'package:provider/provider.dart';
import '../statemanagement/provider/theme_provider.dart';
import '../widgets/web_tab_screen_widgets/tabbar_widget.dart';

class MobileHomePage extends StatefulWidget {
  const MobileHomePage({Key? key}) : super(key: key);
  @override
  State<MobileHomePage> createState() => _MobileHomePageState();
}
class _MobileHomePageState extends State<MobileHomePage> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: false);
    return Consumer<ThemeProvider>(
        builder: (context, ThemeProvider themeNotifier, child)
    {
      return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                  floating: false,
                  pinned: false,
                  expandedHeight: 200,
                  flexibleSpace: FlexibleSpaceBar(
                    title: TopBarContents(),
                    background: Panorama(
                        animSpeed: 6.0,
                        animReverse: true,
                        interactive: true,
                        zoom: 1,
                        hotspots: [
                          Hotspot(
                            latitude: -15.0,
                            longitude: -129.0,
                            width: 30,
                            height: 75,
                          ),
                        ],
                        child: Image.asset("assets/carousel/terraces.jpeg",
                          filterQuality: FilterQuality.high,
                          scale: 0.1,)),
                  )),
              SliverFillRemaining(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(' The Value is',
                        style: TextStyle(fontSize: 25,
                            fontWeight: FontWeight.w500
                        ),),
                      SizedBox(height: 10),
                      Text('10',
                        style: TextStyle(fontSize: 25,
                            fontWeight: FontWeight.w500),)
                    ],
                  )))],)
      );
    });
  }}