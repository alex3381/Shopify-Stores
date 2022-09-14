import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shop_outlets/widgets/web_tab_screen_widgets/smallImage_background.dart';
import '../../responsive_ui/responsive_widget.dart';
import '../../statemanagement/models/product_model.dart';
import '../../statemanagement/provider/productprovider.dart';
import '../../statemanagement/provider/theme_provider.dart';
import '../../statemanagement/themes/theme.dart';
import '../mobile_screen_widgets/smallimagepreview_mobile.dart';
import '../reuseableWidgets/countdowntimers.dart';

class SmallImageWeb extends StatefulWidget {
  const SmallImageWeb({Key? key}) : super(key: key);
  @override
  State<SmallImageWeb> createState() => _SmallImageWebState();
}
class _SmallImageWebState extends State<SmallImageWeb> {
  @override
  Widget build(BuildContext context) {
    ProductProvider products = Provider.of<ProductProvider>(context, listen: false);
    var screenSize = MediaQuery.of(context).size;
    return PreferredSize(
        preferredSize: Size(screenSize.width, 1000),
           child: Stack(
                      children: [
                        SmallImageBackground(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SizedBox(height: 20),
                                  CountDownTimer(),
                                  SizedBox(height: 30),
                                  SingleChildScrollView(
                                      child:  ResponsiveWidget.isSmallScreen(context)

                                      ? SmallImagePreviewMobile()
                                          :Container(
                                          height: 370,
                                          child: ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              itemCount:
                                                  products.productsCounts,
                                              physics:
                                                  const AlwaysScrollableScrollPhysics(),
                                              // cacheExtent: 2,
                                              itemBuilder: (BuildContext context, int index) {
                                                return Padding(
                                                  padding: new EdgeInsets.all(20.0),
                                                  child: ProductTile(productsIndex: index),
                                                );})))])])
    );
  }
}

class ProductTile extends StatefulWidget {
  final int productsIndex;
  ProductTile({Key? key, required this.productsIndex}) : super(key: key);
  @override
  State<ProductTile> createState() => _ProductTileState();
}
class _ProductTileState extends State<ProductTile> {
  int selectedImage = 0;
  Duration defaultDuration = Duration(milliseconds: 350);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Consumer<ProductProvider>(builder: (context, products, child) {
      Products product = products.products[widget.productsIndex];
      ThemeProvider themeProvider = Provider.of<ThemeProvider>(context, listen: false);
      return Container(
                   decoration: BoxDecoration(
            color: themeProvider.getTheme == darkTheme
                ? Colors.black45.withOpacity(0.1)
                : Colors.white.withOpacity(0.5),
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
          child: Stack(
              children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                    padding: EdgeInsets.only(left:13, top: 20, bottom: 10, right: 12),
                    child: Hero(
                        tag: product.id.toString(),
                        child: Container(
                            width: 130,
                            height: 130,
                            decoration: BoxDecoration(

                              color: themeProvider.getTheme == darkTheme
                                  ? Colors.grey.withOpacity(0.1)
                                  : Colors.redAccent.withOpacity(0.1),
                              image: DecorationImage(
                                alignment: Alignment.bottomCenter,
                                image:
                                    AssetImage(product.images[selectedImage]),
                                fit: BoxFit.contain,
                              ),
                              border: Border.all(
                                color: themeProvider.getTheme == darkTheme
                                    ? Colors.black54
                                    : Colors.red,
                                width: 0.2,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            )))),
                SizedBox(height: 9),
                Container(
                  padding:
                      new EdgeInsets.only( left: 12, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...List.generate(product.images.length,
                          (index) => buildSmallProductPreview(index)),
                    ],),),
                SizedBox(height: 7,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                                padding: EdgeInsets.only(left: 18),
                                child: Text(
                                  product.title,
                                  style: GoogleFonts.electrolize(
                                    color: Colors.black,
                                    textStyle: Theme.of(context)
                                        .textTheme
                                        .headline1
                                        ?.copyWith(
                                            fontWeight: FontWeight.w200,
                                            fontSize: width >= 1201
                                                ? 12
                                                : width >= 601
                                                    ? 12
                                                    : width >= 400
                                                        ? 16
                                                        : 14),
                                  ),)),
                            SizedBox(width: 14,),
                            RichText(
                                text: TextSpan(
                                    text: '\$${product.price.toString()}',
                                    style: GoogleFonts.electrolize(
                                      color: Colors.black,
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .headline1
                                          ?.copyWith(
                                              fontWeight: FontWeight.w200,
                                              fontSize: width >= 1201
                                                  ? 12
                                                  : width >= 601
                                                      ? 12
                                                      : width >= 400 ? 16 : 14)),
                                    children: <InlineSpan>[
                                  WidgetSpan(
                                      alignment: PlaceholderAlignment.baseline,
                                      baseline: TextBaseline.alphabetic,
                                      child: SizedBox(width: 4)),
                                  TextSpan(
                                    text: '\$${product.old_price.toString()}',
                                    style: GoogleFonts.electrolize(
                                      color: Colors.orange,
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .headline1
                                          ?.copyWith(
                                              fontWeight: FontWeight.w200,
                                              decoration:
                                                  TextDecoration.lineThrough,
                                              fontSize: width >= 1201
                                                  ? 7
                                                  : width >= 601
                                                      ? 7
                                                      : width >= 400
                                                          ? 7
                                                          : 7
                                      )))]))]
                        ),
                        SizedBox(height: 5),
                        Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text(
                              'Three Sides',
                              style: GoogleFonts.electrolize(
                                color: Colors.black,
                                textStyle: Theme.of(context)
                                    .textTheme
                                    .headline1
                                    ?.copyWith(
                                        fontWeight: FontWeight.w200,
                                        decoration: TextDecoration.none,
                                        fontSize: width >= 1201
                                            ? 10
                                            : width >= 601
                                                ? 7
                                                : width >= 400
                                                    ? 10
                                                    : 10),
                              ))),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                                padding: EdgeInsets.only(left: 14),
                                child: Container(
                                    height: 10,
                                    child: RatingBar.builder(
                                      unratedColor: Colors.blueGrey,
                                      itemSize: 11,
                                      initialRating: 3,
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      itemPadding:
                                          EdgeInsets.symmetric(horizontal: 4.0),
                                      itemBuilder: (context, _) => Icon(
                                        Icons.star,
                                        color: Colors.orange,
                                      ),
                                      onRatingUpdate: (rating) {
                                        print(rating);
                                      },
                                    ))),
                            SizedBox(width: 10),
                            Container(
                                height: 18,
                                width: 18,
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(12)),
                                child: Icon(
                                  Icons.shopping_cart_checkout_sharp,
                                  size: 8,
                                  color: Colors.orange,
                                )),
                          ],
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: EdgeInsets.only(left: 11),
                          child: Container(
                            width: 70,
                            alignment: Alignment.center,
                            height: 20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: themeProvider.getTheme == darkTheme
                                  ? Colors.white.withOpacity(0.8)
                                  : Colors.red.withOpacity(0.85),
                            ),
                            child: Text(
                              'SHOP NOW',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1
                                  ?.copyWith(
                                      fontSize: width >= 1201
                                          ? 8
                                          : width >= 601
                                              ? 8
                                              : width >= 400
                                                  ? 6
                                                  : 5,
                                      color: themeProvider.getTheme == darkTheme
                                          ? Colors.pink.withOpacity(0.8)
                                          : Colors.black
                                              .withOpacity(0.9),
                                      fontWeight: FontWeight.w900,
                                      letterSpacing: 0.5),
                            )))])])])]));});}

  GestureDetector buildSmallProductPreview(int index) {
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: false);
    return GestureDetector(onTap: () {
      setState(() {
        selectedImage = index;
      });
    }, child: Consumer<ProductProvider>(builder: (context, products, child) {
      Products product = products.products[widget.productsIndex];

      return Center(
          child: AnimatedContainer(
        alignment: Alignment.center,
        curve: Curves.easeIn,
        clipBehavior: Clip.antiAlias,
        duration: defaultDuration,
        margin: EdgeInsets.only(right: 5),
        padding: EdgeInsets.only(bottom: 5),
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            color: themeProvider.getTheme == darkTheme
                ? Colors.black45.withOpacity(0.1)
                : Colors.red.withOpacity(0.1),
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
              color: themeProvider.getTheme == darkTheme
                  ? Colors.black45.withOpacity(0.4)
                  : Colors.redAccent.withOpacity(0.4),
              width: 0.6,
            ),
            image: DecorationImage(
              scale: 1.5,
              filterQuality: FilterQuality.high,
              image: AssetImage(
                product.images[index],
              ),
              fit: BoxFit.contain,
            )),
      ));
    }));
  }
}
