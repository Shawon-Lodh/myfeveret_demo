part of 'trending_products_bloc.dart';

abstract class TrendingProductsEvent extends Equatable {
  const TrendingProductsEvent();
}

class GetTrendingProductsList extends TrendingProductsEvent {
  @override
  List<Object> get props => null;
}
