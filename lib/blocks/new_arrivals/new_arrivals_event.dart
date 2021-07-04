part of 'new_arrivals_bloc.dart';

abstract class NewArrivalsEvent extends Equatable {
  const NewArrivalsEvent();
}

class GetNewArrivalsList extends NewArrivalsEvent {
  @override
  List<Object> get props => null;
}
