part of 'trending_products_bloc.dart';

abstract class TrendingProductsState extends Equatable {
  const TrendingProductsState();
}

class TrendingProductsInitial extends TrendingProductsState {
  const TrendingProductsInitial();
  @override
  List<Object> get props => [];
}

class TrendingProductsLoading extends TrendingProductsState {
  const TrendingProductsLoading();
  @override
  List<Object> get props => null;
}

class TrendingProductsLoaded extends TrendingProductsState {
  final TrendingProductsModel trendingProductsModel;
  const TrendingProductsLoaded(this.trendingProductsModel);
  @override
  List<Object> get props => [trendingProductsModel];
}

class TrendingProductsError extends TrendingProductsState {
  final String message;
  const TrendingProductsError(this.message);
  @override
  List<Object> get props => [message];
}
