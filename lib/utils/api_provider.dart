import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:myfeveret_demo/models/new_arrivals_model.dart';
import 'package:myfeveret_demo/models/new_shops_model.dart';
import 'package:myfeveret_demo/models/products_model.dart';
import 'package:myfeveret_demo/models/trending_products_model.dart';
import 'package:myfeveret_demo/models/trending_sellers_model.dart';
import 'package:myfeveret_demo/utils/check_network_status.dart';
import 'package:path_provider/path_provider.dart';
import 'package:myfeveret_demo/data/constants.dart';

class ApiProvider {
  final Dio _dio = Dio();
  String networkConnected = 'not connected';

  ApiProvider(){
    CheckNetWorkStatus().testNetworkStatus().then((networkConnectionStatus) => {
      networkConnected = networkConnectionStatus,
    });
  }

  Future<NewArrivalsModel> fetchNewArrivalsData() async {
    try {
      String fileName = "newArrivals.json";
      var dir = await getTemporaryDirectory();

      File file = new File(dir.path + "/" + fileName);
      if (file.existsSync() && networkConnected == 'not connected') {
        print("Loading from cache");
        return NewArrivalsModel.makeListAllNewArrivals(
            json.decode(file.readAsStringSync()));
        // return NewArrivalsModel.makeListAllNewArrivals(file.readAsStringSync());
      } else {
        print("Loading from API");
        Response newArrivalsNetworkResponse =
            await _dio.get(new_arrivals_api_url);
        file.writeAsStringSync(json.encode(newArrivalsNetworkResponse.data),
            flush: true, mode: FileMode.write);
        return NewArrivalsModel.makeListAllNewArrivals(
            newArrivalsNetworkResponse.data);
      }
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return NewArrivalsModel.withError("Data not found / Connection issue");
    }
  }

  Future<NewShopsModel> fetchNewShopsData() async {
    try {
      String fileName = "newShops.json";
      var dir = await getTemporaryDirectory();

      File file = new File(dir.path + "/" + fileName);
      if (file.existsSync() && networkConnected == 'not connected') {
        print("Loading from cache");
        return NewShopsModel.makeListAllNewShops(
            json.decode(file.readAsStringSync()));
      } else {
        print("Loading from API");
        Response newShopsNetworkResponse = await _dio.get(new_shops_api_url);
        file.writeAsStringSync(json.encode(newShopsNetworkResponse.data),
            flush: true, mode: FileMode.write);
        return NewShopsModel.makeListAllNewShops(newShopsNetworkResponse.data);
      }
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return NewShopsModel.withError("Data not found / Connection issue");
    }
  }

  Future<ProductsModel> fetchProductsData() async {
    try {
      String fileName = "products.json";
      var dir = await getTemporaryDirectory();

      File file = new File(dir.path + "/" + fileName);
      if (file.existsSync() && networkConnected == 'not connected') {
        print("Loading from cache");
        return ProductsModel.makeListAllProducts(
            json.decode(file.readAsStringSync()));
      } else {
        print("Loading from API");
        Response productsNetworkResponse = await _dio.get(products_api_url);
        file.writeAsStringSync(json.encode(productsNetworkResponse.data),
            flush: true, mode: FileMode.write);
        return ProductsModel.makeListAllProducts(productsNetworkResponse.data);
      }
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return ProductsModel.withError("Data not found / Connection issue");
    }
  }

  Future<TrendingProductsModel> fetchTrendingProductsData() async {
    try {
      String fileName = "trendingProducts.json";
      var dir = await getTemporaryDirectory();

      File file = new File(dir.path + "/" + fileName);
      if (file.existsSync() && networkConnected == 'not connected') {
        print("Loading from cache");
        return TrendingProductsModel.makeListAllTrendingProducts(
            json.decode(file.readAsStringSync()));
      } else {
        print("Loading from API");
        Response trendingProductsNetworkResponse = await _dio.get(trending_products_api_url);
        file.writeAsStringSync(json.encode(trendingProductsNetworkResponse.data),
            flush: true, mode: FileMode.write);
        return TrendingProductsModel.makeListAllTrendingProducts(trendingProductsNetworkResponse.data);
      }
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return TrendingProductsModel.withError("Data not found / Connection issue");
    }
  }

  Future<TrendingSellersModel> fetchTrendingSellersData() async {
    try {
      String fileName = "trendingSellers.json";
      var dir = await getTemporaryDirectory();

      File file = new File(dir.path + "/" + fileName);
      if (file.existsSync() && networkConnected == 'not connected') {
        print("Loading from cache");
        return TrendingSellersModel.makeListAllTrendingSellers(
            json.decode(file.readAsStringSync()));
      } else {
        print("Loading from API");
        Response trendingSellersNetworkResponse = await _dio.get(trending_sellers_api_url);
        file.writeAsStringSync(json.encode(trendingSellersNetworkResponse.data),
            flush: true, mode: FileMode.write);
        return TrendingSellersModel.makeListAllTrendingSellers(trendingSellersNetworkResponse.data);
      }
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return TrendingSellersModel.withError("Data not found / Connection issue");
    }
  }
}
