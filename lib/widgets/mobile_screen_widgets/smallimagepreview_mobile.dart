import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../statemanagement/models/product_model.dart';
import '../../statemanagement/provider/productprovider.dart';
import '../../statemanagement/provider/theme_provider.dart';
import '../../statemanagement/themes/theme.dart';

class SmallImagePreviewMobile extends StatefulWidget {
  const SmallImagePreviewMobile({Key? key}) : super(key: key);
  @override
  State<SmallImagePreviewMobile> createState() => _SmallImagePreviewMobileState();
}
class _SmallImagePreviewMobileState extends State<SmallImagePreviewMobile> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    ProductProvider products = Provider.of<ProductProvider>(context, listen: false);
    return Container(
      height: 285,
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,

        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: products.productsCounts,
            physics: const AlwaysScrollableScrollPhysics(),
            cacheExtent: 2,
            itemBuilder: (BuildContext context, int index) {
              return

                Padding(
                padding: new EdgeInsets.all(11.0),
                child: ProductTileMobile(productsIndex: index),
              );}
        ));
  }
}


class ProductTileMobile extends StatefulWidget {
   ProductTileMobile({Key? key, required this.productsIndex}) : super(key: key);
  final int productsIndex;
  @override
  State<ProductTileMobile> createState() => _ProductTileMobileState();
}
class _ProductTileMobileState extends State<ProductTileMobile> {
  int selectedImage = 0;
  Duration defaultDuration = Duration(milliseconds: 350);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Consumer<ProductProvider>(builder: (context, products, child) {
      Products product = products.products[widget.productsIndex];
      ThemeProvider themeProvider = Provider.of<ThemeProvider>(context, listen: false);

      return Container(
              height: 160,
          alignment: Alignment.center,

          decoration: BoxDecoration(
            color: themeProvider.getTheme == darkTheme
                ? Colors.black45.withOpacity(0.1)
                : Colors.white.withOpacity(0.5),
            border: Border.all(
              color: themeProvider.getTheme == darkTheme
                  ? (Colors.black45.withOpacity(0.2)) // Colors.black54
                  : Colors.red.shade100,
              width: 0.5,
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
              ), //BoxShadow
            ],
          ),
          child: Stack(
              children: [
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(left:31,top:8, ),
                          child: Hero(
                              tag: product.id.toString(),
                              child: Align(
                                  alignment: Alignment.center,
                              child: Container(
                                  width: 90,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: themeProvider.getTheme == darkTheme
                                        ? Colors.grey.withOpacity(0.1)
                                        : Colors.red.withOpacity(0.2),
                                    image: DecorationImage(

                                      alignment: Alignment.bottomCenter,
                                      filterQuality: FilterQuality.high,
                                      image:
                                      AssetImage(product.images[selectedImage],
                                      ),
                                      fit: BoxFit.contain,),
                                    border: Border.all(
                                      color: themeProvider.getTheme == darkTheme
                                          ? Colors.black54
                                          : Colors.red,
                                      width: 0.3,
                                    ),
                                    borderRadius: BorderRadius.circular(7),
                                    shape: BoxShape.rectangle,
                                  ))))),
                      SizedBox(height: 7),
                      Container(
                        padding: EdgeInsets.only(right: 7.0, left: 15, bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ...List.generate(product.images.length,
                                    (index) => buildSmallProductPreviewMobile(index)),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 3,
                      ),
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
                                                    fontSize: 7,)
                                              ),)),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        RichText(
                                            text: TextSpan(
                                                text: '\$${product.price.toString()}',
                                                style: GoogleFonts.electrolize(
                                                  color: Colors.black,
                                                  textStyle: Theme.of(context)
                                                      .textTheme
                                                      .headline1
                                                      ?.copyWith(
                                                      fontWeight: FontWeight.w300,
                                                      fontSize: 7),
                                                ),
                                                children: <InlineSpan>[
                                                  WidgetSpan(
                                                      alignment: PlaceholderAlignment.baseline,
                                                      baseline: TextBaseline.alphabetic,
                                                      child: SizedBox(width: 1.3)),
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
                                                              fontSize: 4,
                                                          )))]))]),
                                  SizedBox(height: 3),
                                  Padding(
                                      padding: EdgeInsets.only(left: 18),
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
                                                fontSize:7,),
                                          ))),
                                  SizedBox(height: 7),
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
                                                itemSize: 7,
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
                                      SizedBox(width: 35),
                                      Container(
                                          height: 15,
                                          width: 15,
                                          decoration: BoxDecoration(
                                              color: Colors.black,
                                              borderRadius: BorderRadius.circular(8)),
                                          child: Icon(
                                            Icons.shopping_cart_checkout_sharp,
                                            size: 8,
                                            color: Colors.orange,
                                          )),
                                    ],
                                  ),
                                  SizedBox(height: 7),
                                  Padding(
                                      padding: EdgeInsets.only(left: 11),
                                      child: Container(
                                          width: 70,
                                          height: 21,
                                          alignment: Alignment.center,

                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5),
                                            color: themeProvider.getTheme == darkTheme
                                                ? Colors.white.withOpacity(0.8)
                                                : Colors.red.withOpacity(0.85),
                                          ),
                                          child: Text(
                                            'SHOP NOW',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline1
                                                ?.copyWith(
                                                fontSize: 7,
                                                color: themeProvider.getTheme == darkTheme
                                                    ? Colors.pink.withOpacity(0.8)
                                                    : Colors.black,
                                                fontWeight: FontWeight.w900,
                                                letterSpacing: 0.5),
                                          )))])])])]));});}


GestureDetector buildSmallProductPreviewMobile(int index) {
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
          height: 43,
          width: 38,
          decoration: BoxDecoration(

              color: themeProvider.getTheme == darkTheme
                  ? Colors.black45.withOpacity(0.1)
                  : Colors.red.withOpacity(0.2),
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                color: themeProvider.getTheme == darkTheme
                    ? Colors.black45.withOpacity(0.1)
                    : Colors.redAccent.withOpacity(0.5),
                width: 0.5,
              ),
              image: DecorationImage(
                alignment:Alignment.bottomCenter,
                scale: 1,
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
