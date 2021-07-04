import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:myfeveret_demo/models/new_arrivals_model.dart';
import 'package:myfeveret_demo/utils/api_repository.dart';

part 'new_arrivals_event.dart';
part 'new_arrivals_state.dart';


class NewArrivalsBloc extends Bloc<NewArrivalsEvent, NewArrivalsState> {
  final ApiRepository _apiRepository = ApiRepository();


  @override
  NewArrivalsState get initialState => NewArrivalsInitial();

  @override
  Stream<NewArrivalsState> mapEventToState(
      NewArrivalsEvent event,
      ) async* {
    if (event is GetNewArrivalsList) {
      try {
        yield NewArrivalsLoading();
        final mList = await _apiRepository.fetchNewArrivalsList();
        yield NewArrivalsLoaded(mList);
        if (mList.error != null) {
          yield NewArrivalsError(mList.error);
        }
      } on NetworkError {
        yield NewArrivalsError("Failed to fetch data. is your device online?");
      }
    }
  }
}
