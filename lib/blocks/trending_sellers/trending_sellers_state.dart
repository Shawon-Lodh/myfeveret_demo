part of 'trending_sellers_bloc.dart';

abstract class TrendingSellersState extends Equatable {
  const TrendingSellersState();
}

class TrendingSellersInitial extends TrendingSellersState {
  const TrendingSellersInitial();
  @override
  List<Object> get props => [];
}

class TrendingSellersLoading extends TrendingSellersState {
  const TrendingSellersLoading();
  @override
  List<Object> get props => null;
}

class TrendingSellersLoaded extends TrendingSellersState {
  final TrendingSellersModel trendingSellersModel;
  const TrendingSellersLoaded(this.trendingSellersModel);
  @override
  List<Object> get props => [trendingSellersModel];
}

class TrendingSellersError extends TrendingSellersState {
  final String message;
  const TrendingSellersError(this.message);
  @override
  List<Object> get props => [message];
}
