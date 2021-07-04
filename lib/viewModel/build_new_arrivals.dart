import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myfeveret_demo/blocks/new_arrivals/new_arrivals_bloc.dart';
import 'package:myfeveret_demo/data/appTheme.dart';
import 'package:myfeveret_demo/screens/new_arrivals_section.dart';

class BuildNewArrivals extends StatelessWidget {
  final NewArrivalsBloc _newArrivalsBloc = NewArrivalsBloc();

  @override
  Widget build(BuildContext context) {
    _newArrivalsBloc.add(GetNewArrivalsList());
    return Container(
      margin: EdgeInsets.all(8.0),
      child: BlocProvider(
        create: (_) => _newArrivalsBloc,
        child: BlocListener<NewArrivalsBloc, NewArrivalsState>(
          listener: (context, state) {
            if (state is NewArrivalsError) {
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                ),
              );
            }
          },
          child: BlocBuilder<NewArrivalsBloc, NewArrivalsState>(
            builder: (context, state) {
              if (state is NewArrivalsInitial) {
                return loading;
              } else if (state is NewArrivalsLoading) {
                return loading;
              } else if (state is NewArrivalsLoaded) {
                return NewArrivalsSection(model: state.newArrivalsModel,);
              } else if (state is NewArrivalsError) {
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
