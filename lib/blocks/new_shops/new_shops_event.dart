part of 'new_shops_bloc.dart';

abstract class NewShopsEvent extends Equatable {
  const NewShopsEvent();
}

class GetNewShopsList extends NewShopsEvent {
  @override
  List<Object> get props => null;
}
