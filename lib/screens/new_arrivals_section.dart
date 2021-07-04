import 'package:flutter/material.dart';
import 'package:myfeveret_demo/data/constants.dart';
import 'package:myfeveret_demo/models/new_arrivals_model.dart';
import 'package:myfeveret_demo/widgets/horizontal_scrolling_page.dart';

class NewArrivalsSection extends StatelessWidget {
  final NewArrivalsModel model;

  NewArrivalsSection({this.model});

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
                  "New Arrivals",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              flex: 10,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: model.allNewArrivals.length,
                  itemBuilder: (context, index) {
                    return HorizontalScrollingPage(
                      pageName: HorizontalScrollingPageName.NewArrivalsPage,
                      backgroundImageUrl: model.allNewArrivals[index].productImage,
                      footerHeadline: model.allNewArrivals[index].productName,
                      footerText: model.allNewArrivals[index].shortDetails,);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
