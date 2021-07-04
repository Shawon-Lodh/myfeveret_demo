import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:myfeveret_demo/data/constants.dart';
import 'package:myfeveret_demo/widgets/cached_image.dart';

class HorizontalScrollingPage extends StatelessWidget {
  final HorizontalScrollingPageName pageName;
  final String logoUrl;
  final String backgroundImageUrl;
  final String footerHeadline;
  final String footerText;

  HorizontalScrollingPage({this.pageName,this.logoUrl,this.backgroundImageUrl,this.footerHeadline="",this.footerText=""});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.01),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.25,
        child: pageName ==
            HorizontalScrollingPageName.TrendingSellersPage
            ? Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius:
                BorderRadius.all(Radius.circular(20)),
              ),
              child: backgroundImageUrl!=null ? CachedImage(
                pageName: pageName,
                width: MediaQuery.of(context).size.width *
                    0.25,
                height: 200,
                imageUrl:
                backgroundImageUrl,
                circleImage: false,
              ): Container(),
            ),
            Column(
              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: logoUrl!= null ? CachedImage(
                    pageName: pageName,
                    width: 30,
                    height: 30,
                    imageUrl:
                    logoUrl,
                    circleImage: true,
                  ): Container(),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: MediaQuery.of(context)
                          .size
                          .width *
                          0.35,
                      maxWidth: MediaQuery.of(context)
                          .size
                          .width *
                          0.35,
                      minHeight: 30,
                      maxHeight: 100,
                    ),
                    child: AutoSizeText(
                      footerHeadline,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        )
            : Material(
          elevation: 3,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                  Radius.circular(20)),
            ),
            child: Column(
              children: [
                Expanded(
                  flex: 8,
                  child: Container(
                    child: CachedImage(
                      pageName: pageName,
                      width:
                      MediaQuery.of(context).size.width *
                          0.25,
                      height: 200,
                      imageUrl:
                      backgroundImageUrl,
                      circleImage: false,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    footerHeadline,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    footerText,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 10,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
