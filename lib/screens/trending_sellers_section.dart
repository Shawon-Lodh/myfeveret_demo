import 'package:flutter/material.dart';
import 'package:myfeveret_demo/data/constants.dart';
import 'package:myfeveret_demo/models/new_shops_model.dart';
import 'package:myfeveret_demo/models/products_model.dart';
import 'package:myfeveret_demo/models/trending_products_model.dart';
import 'package:myfeveret_demo/models/trending_sellers_model.dart';
import 'package:myfeveret_demo/widgets/horizontal_scrolling_page.dart';

class TrendingSellersSection extends StatelessWidget {
  final TrendingSellersModel model;

  TrendingSellersSection({this.model});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 20,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        height: 200, //vary the full container height
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                    "Trending Sellers",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              flex: 10,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: model.allTrendingSellers.length,
                  itemBuilder: (context, index) {
                    return HorizontalScrollingPage(
                      pageName: HorizontalScrollingPageName.TrendingSellersPage,
                      logoUrl: model.allTrendingSellers[index].sellerProfilePhoto,
                    backgroundImageUrl: model.allTrendingSellers[index].sellerItemPhoto,
                    footerHeadline: model.allTrendingSellers[index].sellerName,);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
