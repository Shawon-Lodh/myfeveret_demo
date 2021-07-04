import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:myfeveret_demo/models/products_model.dart';
import 'package:myfeveret_demo/models/trending_products_model.dart';
import 'package:myfeveret_demo/utils/api_repository.dart';

part 'trending_products_event.dart';
part 'trending_products_state.dart';


class TrendingProductsBloc extends Bloc<TrendingProductsEvent, TrendingProductsState> {
  final ApiRepository _apiRepository = ApiRepository();


  @override
  TrendingProductsState get initialState => TrendingProductsInitial();

  @override
  Stream<TrendingProductsState> mapEventToState(
      TrendingProductsEvent event,
      ) async* {
    if (event is GetTrendingProductsList) {
      try {
        yield TrendingProductsLoading();
        final mList = await _apiRepository.fetchTrendingProductsList();
        yield TrendingProductsLoaded(mList);
        if (mList.error != null) {
          yield TrendingProductsError(mList.error);
        }
      } on NetworkError {
        yield TrendingProductsError("Failed to fetch data. is your device online?");
      }
    }
  }
}
