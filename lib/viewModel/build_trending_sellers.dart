import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myfeveret_demo/blocks/new_shops/new_shops_bloc.dart';
import 'package:myfeveret_demo/blocks/products/products_bloc.dart';
import 'package:myfeveret_demo/blocks/trending_products/trending_products_bloc.dart';
import 'package:myfeveret_demo/blocks/trending_sellers/trending_sellers_bloc.dart';
import 'package:myfeveret_demo/data/appTheme.dart';
import 'package:myfeveret_demo/models/products_model.dart';
import 'package:myfeveret_demo/screens/new_shops_section.dart';
import 'package:myfeveret_demo/screens/products_section.dart';
import 'package:myfeveret_demo/screens/trending_sellers_section.dart';

class BuildTrendingSellers extends StatelessWidget {
  final TrendingSellersBloc _trendingSellersBloc = TrendingSellersBloc();

  @override
  Widget build(BuildContext context) {
    _trendingSellersBloc.add(GetTrendingSellersList());
    return Container(
      margin: EdgeInsets.all(8.0),
      child: BlocProvider(
        create: (_) => _trendingSellersBloc,
        child: BlocListener<TrendingSellersBloc, TrendingSellersState>(
          listener: (context, state) {
            if (state is TrendingSellersError) {
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                ),
              );
            }
          },
          child: BlocBuilder<TrendingSellersBloc, TrendingSellersState>(
            builder: (context, state) {
              if (state is TrendingSellersInitial) {
                return loading;
              } else if (state is TrendingSellersLoading) {
                return loading;
              } else if (state is TrendingSellersLoaded) {
                return TrendingSellersSection(model: state.trendingSellersModel,);
              } else if (state is TrendingSellersError) {
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
