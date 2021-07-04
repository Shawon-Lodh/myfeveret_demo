import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:myfeveret_demo/models/new_shops_model.dart';
import 'package:myfeveret_demo/utils/api_repository.dart';

part 'new_shops_event.dart';
part 'new_shops_state.dart';


class NewShopsBloc extends Bloc<NewShopsEvent, NewShopsState> {
  final ApiRepository _apiRepository = ApiRepository();


  @override
  NewShopsState get initialState => NewShopsInitial();

  @override
  Stream<NewShopsState> mapEventToState(
      NewShopsEvent event,
      ) async* {
    if (event is GetNewShopsList) {
      try {
        yield NewShopsLoading();
        final mList = await _apiRepository.fetchNewShopsList();
        yield NewShopsLoaded(mList);
        if (mList.error != null) {
          yield NewShopsError(mList.error);
        }
      } on NetworkError {
        yield NewShopsError("Failed to fetch data. is your device online?");
      }
    }
  }
}
