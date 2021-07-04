import 'package:flutter/material.dart';
import 'package:myfeveret_demo/models/new_shops_model.dart';
import 'package:myfeveret_demo/models/products_model.dart';
import 'package:myfeveret_demo/utils/update_time.dart';
import 'package:myfeveret_demo/widgets/vertical_scrolling_page_item.dart';

class ProductsSection extends StatelessWidget {
  final String section;
  final ProductsModel model;

  ProductsSection({this.model,this.section});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.white,
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              "Products",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: model.allProducts.length,
            itemBuilder: (context, index) {
              if(section == "first"){
                if (index < 3) {
                  return buildVerticalScrollingPageItem(index);
                } else {

                }
              }else if(section == "second"){
                if (index >2 && index<6) {
                  return buildVerticalScrollingPageItem(index);
                } else {

                }
              }else if(section == "rest"){
                if (index<6) {

                } else {
                  return buildVerticalScrollingPageItem(index);
                }
              }
              return Container();
            }),
      ],
    );
  }

  VerticalScrollingPageItem buildVerticalScrollingPageItem(int index) {
    return VerticalScrollingPageItem(
            headerLogoUrl: model.allProducts[index].companyLogo,
            headerTitle: model.allProducts[index].companyName,
            headerSubTitle: UpdateTime().checkForUpdateTime(DateTime.parse(model.allProducts[index].storyTime.replaceAll("T", " ").replaceAll("Z", ""))),
            bodyText: model.allProducts[index].story,
            bodyBackgroundImageUrl: model.allProducts[index].storyImage,
            footerFirstText: model.allProducts[index].unitPrice.toString(),
            footerSecondText:
                model.allProducts[index].availableStock.toString(),
            footerThirdText: model.allProducts[index].orderQty.toString(),
          );
  }
}
