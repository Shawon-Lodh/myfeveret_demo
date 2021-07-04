part of 'products_bloc.dart';

abstract class ProductsState extends Equatable {
  const ProductsState();
}

class ProductsInitial extends ProductsState {
  const ProductsInitial();
  @override
  List<Object> get props => [];
}

class ProductsLoading extends ProductsState {
  const ProductsLoading();
  @override
  List<Object> get props => null;
}

class ProductsLoaded extends ProductsState {
  final ProductsModel productsModel;
  const ProductsLoaded(this.productsModel);
  @override
  List<Object> get props => [productsModel];
}

class ProductsError extends ProductsState {
  final String message;
  const ProductsError(this.message);
  @override
  List<Object> get props => [message];
}
