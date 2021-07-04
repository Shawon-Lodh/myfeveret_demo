part of 'new_shops_bloc.dart';

abstract class NewShopsState extends Equatable {
  const NewShopsState();
}

class NewShopsInitial extends NewShopsState {
  const NewShopsInitial();
  @override
  List<Object> get props => [];
}

class NewShopsLoading extends NewShopsState {
  const NewShopsLoading();
  @override
  List<Object> get props => null;
}

class NewShopsLoaded extends NewShopsState {
  final NewShopsModel newShopsModel;
  const NewShopsLoaded(this.newShopsModel);
  @override
  List<Object> get props => [NewShopsModel];
}

class NewShopsError extends NewShopsState {
  final String message;
  const NewShopsError(this.message);
  @override
  List<Object> get props => [message];
}
