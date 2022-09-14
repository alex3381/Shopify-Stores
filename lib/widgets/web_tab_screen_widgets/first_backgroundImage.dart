import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../constant.dart';

class FirstBackGroundImage extends StatelessWidget {
   FirstBackGroundImage({Key? key}) : super(key: key);
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return SizedBox(
        height: screenSize.height * 0.34,
        width: screenSize.width,
      child:Stack(
      children: [
      FutureBuilder(
      future:
      Future.delayed(Duration(milliseconds: 1500 * _index)),
    builder: (ctx, timer) =>
        CachedNetworkImage(
            height: 600,
            width: double.infinity,
            imageUrl:firstbackground [_index % firstbackground.length],
            colorBlendMode: BlendMode.colorBurn,
            color: Color(0xFF18FFFF).withOpacity(0.3),
            imageBuilder: (
                context,
                imageProvider) =>
            Container(
              height: 600,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                ),
              ),
            ),
            key: UniqueKey(),
            placeholder: (context, url) => Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 20),
              width: 20,
              height: 200,
            ),
            errorWidget: (context, url, error) =>
            const Icon(
              Icons.error,
              size: 100,
              color: Colors.red,
            )),
      )],
    ));
  }
}
