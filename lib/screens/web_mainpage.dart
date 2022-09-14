import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../responsive_ui/responsive_widget.dart';
import '../statemanagement/provider/theme_provider.dart';
import '../statemanagement/themes/theme.dart';
import '../widgets/reuseableWidgets/carousel/carousel.dart';
import '../widgets/reuseableWidgets/firsttile.dart';
import '../widgets/reuseableWidgets/footer/footer.dart';
import '../widgets/reuseableWidgets/thirdtile.dart';
import '../widgets/web_tab_screen_widgets/firstbackground_splashscreen.dart';
import '../widgets/web_tab_screen_widgets/flash_sales_tile.dart';
import '../widgets/web_tab_screen_widgets/secondbackground_imageslider.dart';
import '../widgets/web_tab_screen_widgets/smallImagepreview_web.dart';
import '../widgets/web_tab_screen_widgets/tabbar_widget.dart';



class WebMainPage extends StatefulWidget {
  const WebMainPage({Key? key,}) : super(key: key);
  @override
  State<WebMainPage> createState() => _WebMainPageState();
}

class _WebMainPageState extends State<WebMainPage> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    return Consumer<ThemeProvider>(
        builder: (context, ThemeProvider themeNotifier, child) {
     return PreferredSize(
          preferredSize: Size(screenSize.width, 1000),
       child: SafeArea(
            child: Padding(
                padding:  EdgeInsets.all(MediaQuery.of(context).size.width / 40),
                child: IntrinsicHeight(
                  child: Stack(
                      children: [
                        ResponsiveWidget.isSmallScreen(context)
                        ?  Container(
                    height: 900,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(10),
                        bottom: Radius.circular(10),
                      ),
                          color:  themeProvider.getTheme == darkTheme
                              ? Colors.grey.withOpacity(0.90)
                              : Colors.red,
                    ))

                   : Container(
                        height: 900,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(10),
                              bottom: Radius.circular(10),
                            ),
                          gradient: LinearGradient(
                              end: FractionalOffset.bottomRight,
                              begin: Alignment.bottomRight,
                              stops: [0.1, 0.9],
                            colors: [
                              Theme.of(context).colorScheme.primary .withOpacity(0.9),
                              Theme.of(context).colorScheme.secondary .withOpacity(0.9)
                            ]))),
                    Padding(
                        padding:  EdgeInsets.all(MediaQuery.of(context).size.width / 40),
                        child: Container(
                            width: double.maxFinite,
                            height: double.maxFinite,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Scaffold(
                              backgroundColor: themeProvider.getTheme == darkTheme
                                  ? Colors.black38.withOpacity(0.2)
                                  : Colors.white,
                              extendBodyBehindAppBar: true,
                              resizeToAvoidBottomInset: true,
                              body: CustomScrollView(
                                slivers: <Widget>[
                                  SliverAppBar(
                                    automaticallyImplyLeading: true,
                                    backgroundColor: Colors.transparent,
                                    // expandedHeight: -20,
                                    forceElevated: true,
                                    floating: true,
                                    pinned: true,
                                    elevation: 0,
                                    snap: true,
                                    centerTitle: false,
                                    stretch: true,
                                    flexibleSpace: FlexibleSpaceBar(
                                      collapseMode: CollapseMode.pin,
                                      background: Stack(
                                        clipBehavior: Clip.hardEdge,
                                        fit: StackFit.expand,
                                        children: <Widget>[
                                          TopBarContents(),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SliverList(
                                    delegate: SliverChildListDelegate([
                                      Container(
                                          child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                    width: MediaQuery.of(context).size.width,
                                                    child: Column(
                                                      children: [
                                                        FirstBackground(screenSize: screenSize,),
                                                        SizedBox(height: 7),
                                                        FirstTile(),
                                                      ])),

                                                ////////////////// Second Background //////////////

                                                Column(
                                                  mainAxisSize: MainAxisSize.min,
                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    SecondBackground(),
                                                    SizedBox(height:12),
                                                    FlashSales(),
                                                    SizedBox(height: 12),
                                                     SmallImageWeb (),
                                                    ThirdTile(),
                                                    Carousel(),
                                                    Divider(thickness: 1.5),
                                                    Footer(),
                                                  ])])
                                      )]),),],)
                              ,))),
                      ]),
                ))));});
  }
}
