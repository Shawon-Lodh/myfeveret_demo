import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:myfeveret_demo/data/constants.dart';
import 'package:myfeveret_demo/widgets/cached_image.dart';

class VerticalScrollingPageItem extends StatelessWidget {
  final String headerLogoUrl;
  final String headerTitle;
  final dynamic headerSubTitle;
  final String bodyText;
  final String bodyBackgroundImageUrl;
  final String footerFirstText;
  final String footerSecondText;
  final String footerThirdText;

  VerticalScrollingPageItem({this.headerLogoUrl = "",this.headerTitle = "",this.headerSubTitle,this.bodyText = "",this.bodyBackgroundImageUrl = "",this.footerFirstText = "",this.footerSecondText = "",this.footerThirdText = "",});

  String updateTimeMaking(List time){
    String finalTimeString = "";
    String timeDay = "Day(s)";
    String timeHour = "Hour(s)";
    String timeMinute = "Minute(s)";
    String timeFooter = "ago";

    if(time[0]!= 0 && time[1]!= 0 && time[2]!= 0) //1
      {
        finalTimeString = finalTimeString + time[0].toString() + " " + timeDay + " " + time[1].toString() + " " + timeHour + " " + time[2].toString() + " " + timeMinute + " " + timeFooter;
      }
    else if(time[0]!= 0 && time[1]!= 0 && time[2]== 0){  //2
        finalTimeString = finalTimeString + time[0].toString() + " " + timeDay + " " + time[1].toString() + " " + timeHour + " " + timeFooter;
      }
    else if(time[0]!= 0 && time[1]== 0 && time[2]!= 0){  //3
      finalTimeString = finalTimeString + time[0].toString() + " " + timeDay + " " + time[2].toString() + " " + timeMinute + " " + timeFooter;
      }
    else if(time[0]!= 0 && time[1]== 0 && time[2]== 0){  //4
      finalTimeString = finalTimeString + time[0].toString() + " " + timeDay+ " " + timeFooter;
      }
    else if(time[0]== 0 && time[1]!= 0 && time[2]!= 0){  //5
      finalTimeString = finalTimeString + time[1].toString() + " " + timeHour + " " + time[2].toString() + " " + timeMinute + " " + timeFooter;
    }
    else if(time[0]== 0 && time[1]!= 0 && time[2]== 0){  //6
      finalTimeString = finalTimeString + time[1].toString() + " " + timeHour + " " + timeFooter;
    }
    else if(time[0]== 0 && time[1]== 0 && time[2]!= 0){  //7
      finalTimeString = finalTimeString + time[2].toString() + " " + timeMinute + " " + timeFooter;
    }
    else if(time[0]== 0 && time[1]== 0 && time[2]== 0){  //8
      finalTimeString = "few seconds ago";
    }
    return finalTimeString;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 20,
      child: Container(
        height: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: headerLogoUrl!= null ? CachedImage(
                      width: 30,
                      height: 30,
                      imageUrl:
                          headerLogoUrl,
                      circleImage: true,
                    ) : Container(),
                  ),
                  Expanded(
                    flex: 8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          headerTitle == null ? "" : headerTitle,
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          headerSubTitle == null ? "" : (headerSubTitle is List ? updateTimeMaking(headerSubTitle) : headerSubTitle),
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black.withOpacity(0.3)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                margin: EdgeInsets.only(left: 10),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: MediaQuery.of(context).size.width,
                    maxWidth: MediaQuery.of(context).size.width,
                    minHeight: 30,
                    maxHeight: 40,
                  ),
                  child: AutoSizeText(
                    bodyText == null ? "" : bodyText,
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: bodyBackgroundImageUrl!= null ? CachedNetworkImage(
                  imageUrl:
                      bodyBackgroundImageUrl,
                  imageBuilder: (context, imageProvider) => Container(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ) : Container(),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.card_giftcard),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          headerSubTitle is List ? "BDT $footerFirstText" : footerFirstText,
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.list_outlined),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          headerSubTitle is List ? "$footerSecondText Available Stock" : footerSecondText,
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.shopping_cart),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "$footerThirdText Order(s)",
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10,child: Container(color: Colors.grey.withOpacity(0.2),),),
          ],
        ),
      ),
    );
  }
}
