import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:myfeveret_demo/models/products_model.dart';
import 'package:myfeveret_demo/utils/api_repository.dart';

part 'products_event.dart';
part 'products_state.dart';


class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ApiRepository _apiRepository = ApiRepository();


  @override
  ProductsState get initialState => ProductsInitial();

  @override
  Stream<ProductsState> mapEventToState(
      ProductsEvent event,
      ) async* {
    if (event is GetProductsList) {
      try {
        yield ProductsLoading();
        final mList = await _apiRepository.fetchProductsList();
        yield ProductsLoaded(mList);
        if (mList.error != null) {
          yield ProductsError(mList.error);
        }
      } on NetworkError {
        yield ProductsError("Failed to fetch data. is your device online?");
      }
    }
  }
}
