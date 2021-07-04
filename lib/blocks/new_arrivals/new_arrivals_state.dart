part of 'new_arrivals_bloc.dart';

abstract class NewArrivalsState extends Equatable {
  const NewArrivalsState();
}

class NewArrivalsInitial extends NewArrivalsState {
  const NewArrivalsInitial();
  @override
  List<Object> get props => [];
}

class NewArrivalsLoading extends NewArrivalsState {
  const NewArrivalsLoading();
  @override
  List<Object> get props => null;
}

class NewArrivalsLoaded extends NewArrivalsState {
  final NewArrivalsModel newArrivalsModel;
  const NewArrivalsLoaded(this.newArrivalsModel);
  @override
  List<Object> get props => [NewArrivalsModel];
}

class NewArrivalsError extends NewArrivalsState {
  final String message;
  const NewArrivalsError(this.message);
  @override
  List<Object> get props => [message];
}
