import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:myfeveret_demo/data/constants.dart';

class CachedImage extends StatelessWidget {
  final pageName;
  final double width;
  final double height;
  final String imageUrl;
  final bool circleImage;

  CachedImage(
      {this.width,
      this.height,
      this.imageUrl,
      this.circleImage,
      this.pageName = "default"});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) => Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: (!circleImage && pageName != "default")
              ? (pageName == HorizontalScrollingPageName.TrendingSellersPage
                  ? BorderRadius.all(Radius.circular(10))
                  : BorderRadius.only(
                      topRight: Radius.circular(10),
                      topLeft: Radius.circular(10),
                    ))
              : null,
          shape: circleImage ? BoxShape.circle : BoxShape.rectangle,
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      placeholder: (context, url) => CircularProgressIndicator(),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}
