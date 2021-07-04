import 'package:myfeveret_demo/models/new_arrivals_model.dart';
import 'package:myfeveret_demo/models/new_shops_model.dart';
import 'package:myfeveret_demo/models/products_model.dart';
import 'package:myfeveret_demo/models/trending_products_model.dart';
import 'package:myfeveret_demo/models/trending_sellers_model.dart';

import 'api_provider.dart';

class ApiRepository {
  final _provider = ApiProvider();

  Future<NewArrivalsModel> fetchNewArrivalsList() {
    return _provider.fetchNewArrivalsData();
  }
  Future<NewShopsModel> fetchNewShopsList() {
    return _provider.fetchNewShopsData();
  }
  Future<ProductsModel> fetchProductsList() {
    return _provider.fetchProductsData();
  }
  Future<TrendingProductsModel> fetchTrendingProductsList() {
    return _provider.fetchTrendingProductsData();
  }
  Future<TrendingSellersModel> fetchTrendingSellersList() {
    return _provider.fetchTrendingSellersData();
  }
}

class NetworkError extends Error {}
