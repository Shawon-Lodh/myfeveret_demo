import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myfeveret_demo/blocks/new_shops/new_shops_bloc.dart';
import 'package:myfeveret_demo/blocks/products/products_bloc.dart';
import 'package:myfeveret_demo/blocks/trending_products/trending_products_bloc.dart';
import 'package:myfeveret_demo/data/appTheme.dart';
import 'package:myfeveret_demo/models/products_model.dart';
import 'package:myfeveret_demo/screens/new_shops_section.dart';
import 'package:myfeveret_demo/screens/products_section.dart';
import 'package:myfeveret_demo/screens/trending_products_section.dart';

class BuildTrendingProducts extends StatelessWidget {
  final TrendingProductsBloc _trendingProductsBloc = TrendingProductsBloc();

  @override
  Widget build(BuildContext context) {
    _trendingProductsBloc.add(GetTrendingProductsList());
    return Container(
      margin: EdgeInsets.all(8.0),
      child: BlocProvider(
        create: (_) => _trendingProductsBloc,
        child: BlocListener<TrendingProductsBloc, TrendingProductsState>(
          listener: (context, state) {
            if (state is TrendingProductsError) {
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                ),
              );
            }
          },
          child: BlocBuilder<TrendingProductsBloc, TrendingProductsState>(
            builder: (context, state) {
              if (state is TrendingProductsInitial) {
                return loading;
              } else if (state is TrendingProductsLoading) {
                return loading;
              } else if (state is TrendingProductsLoaded) {
                return TrendingProductsSection(model: state.trendingProductsModel,);
              } else if (state is TrendingProductsError) {
                return Container();
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
