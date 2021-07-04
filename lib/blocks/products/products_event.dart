part of 'products_bloc.dart';

abstract class ProductsEvent extends Equatable {
  const ProductsEvent();
}

class GetProductsList extends ProductsEvent {
  @override
  List<Object> get props => null;
}
