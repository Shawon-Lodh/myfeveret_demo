part of 'trending_sellers_bloc.dart';

abstract class TrendingSellersEvent extends Equatable {
  const TrendingSellersEvent();
}

class GetTrendingSellersList extends TrendingSellersEvent {
  @override
  List<Object> get props => null;
}
