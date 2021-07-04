import 'package:flutter/material.dart';
import 'package:myfeveret_demo/viewModel/build_new_arrivals.dart';
import 'package:myfeveret_demo/viewModel/build_new_shops.dart';

import 'package:myfeveret_demo/viewModel/build_products.dart';
import 'package:myfeveret_demo/viewModel/build_trending_products.dart';
import 'package:myfeveret_demo/viewModel/build_trending_sellers.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,title: Text('MyFeveret Demo')),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            BuildTrendingSellers(),
            BuildTrendingProducts(),
            BuildProducts(section: "first",),
            BuildNewArrivals(),
            BuildProducts(section: "second",),
            BuildNewShops(),
            BuildProducts(section: "rest",),
          ],
        ),
      ),
    );
  }
}
