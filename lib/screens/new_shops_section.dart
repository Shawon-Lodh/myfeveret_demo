import 'package:flutter/material.dart';
import 'package:myfeveret_demo/models/new_shops_model.dart';
import 'package:myfeveret_demo/widgets/vertical_scrolling_page_item.dart';

class NewShopsSection extends StatelessWidget {
  final NewShopsModel model;

  NewShopsSection({this.model});

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
              "New Shops",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: model.allNewShops.length,
            itemBuilder: (context, index) {
              String a = model.allNewShops[index].city;
              String b = model.allNewShops[index].country;
              return VerticalScrollingPageItem(
                headerLogoUrl: model.allNewShops[index].sellerProfilePhoto,
                headerTitle: model.allNewShops[index].sellerName,
                headerSubTitle: "${model.allNewShops[index].city} ${model.allNewShops[index].country}",
                bodyText: model.allNewShops[index].aboutCompany,
                bodyBackgroundImageUrl: model.allNewShops[index].sellerItemPhoto,
                footerFirstText: model.allNewShops[index].highestDiscountPercent == 0 ? "NO Sale" : "${model.allNewShops[index].highestDiscountPercent.toString()} % SALE",
                footerSecondText: model.allNewShops[index].allowCOD == 0 ? "Online Payment" : "Allows COD",
                footerThirdText: model.allNewShops[index].orderQty.toString(),
              );
            }),
      ],
    );
  }
}
