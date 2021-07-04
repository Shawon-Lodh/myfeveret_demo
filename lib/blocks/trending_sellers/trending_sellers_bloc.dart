import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:myfeveret_demo/models/products_model.dart';
import 'package:myfeveret_demo/models/trending_products_model.dart';
import 'package:myfeveret_demo/models/trending_sellers_model.dart';
import 'package:myfeveret_demo/utils/api_repository.dart';

part 'trending_sellers_event.dart';
part 'trending_sellers_state.dart';


class TrendingSellersBloc extends Bloc<TrendingSellersEvent, TrendingSellersState> {
  final ApiRepository _apiRepository = ApiRepository();


  @override
  TrendingSellersState get initialState => TrendingSellersInitial();

  @override
  Stream<TrendingSellersState> mapEventToState(
      TrendingSellersEvent event,
      ) async* {
    if (event is GetTrendingSellersList) {
      try {
        yield TrendingSellersLoading();
        final mList = await _apiRepository.fetchTrendingSellersList();
        yield TrendingSellersLoaded(mList);
        if (mList.error != null) {
          yield TrendingSellersError(mList.error);
        }
      } on NetworkError {
        yield TrendingSellersError("Failed to fetch data. is your device online?");
      }
    }
  }
}
