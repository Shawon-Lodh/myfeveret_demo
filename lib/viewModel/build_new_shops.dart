import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myfeveret_demo/blocks/new_shops/new_shops_bloc.dart';
import 'package:myfeveret_demo/data/appTheme.dart';
import 'package:myfeveret_demo/screens/new_shops_section.dart';

class BuildNewShops extends StatelessWidget {
  final NewShopsBloc _newShopsBloc = NewShopsBloc();

  @override
  Widget build(BuildContext context) {
    _newShopsBloc.add(GetNewShopsList());
    return Container(
      margin: EdgeInsets.all(8.0),
      child: BlocProvider(
        create: (_) => _newShopsBloc,
        child: BlocListener<NewShopsBloc, NewShopsState>(
          listener: (context, state) {
            if (state is NewShopsError) {
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                ),
              );
            }
          },
          child: BlocBuilder<NewShopsBloc, NewShopsState>(
            builder: (context, state) {
              if (state is NewShopsInitial) {
                return loading;
              } else if (state is NewShopsLoading) {
                return loading;
              } else if (state is NewShopsLoaded) {
                return NewShopsSection(model: state.newShopsModel,);
              } else if (state is NewShopsError) {
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

