import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myfeveret_demo/blocks/new_shops/new_shops_bloc.dart';
import 'package:myfeveret_demo/blocks/products/products_bloc.dart';
import 'package:myfeveret_demo/data/appTheme.dart';
import 'package:myfeveret_demo/models/products_model.dart';
import 'package:myfeveret_demo/screens/new_shops_section.dart';
import 'package:myfeveret_demo/screens/products_section.dart';

class BuildProducts extends StatelessWidget {
  final ProductsBloc _productsBloc = ProductsBloc();
  final String section;
  BuildProducts({this.section});

  @override
  Widget build(BuildContext context) {
    _productsBloc.add(GetProductsList());
    return Container(
      margin: EdgeInsets.all(8.0),
      child: BlocProvider(
        create: (_) => _productsBloc,
        child: BlocListener<ProductsBloc, ProductsState>(
          listener: (context, state) {
            if (state is ProductsError) {
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                ),
              );
            }
          },
          child: BlocBuilder<ProductsBloc, ProductsState>(
            builder: (context, state) {
              if (state is ProductsInitial) {
                return loading;
              } else if (state is ProductsLoading) {
                return loading;
              } else if (state is ProductsLoaded) {
                return ProductsSection(section: section,model: state.productsModel,);
              } else if (state is ProductsError) {
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
