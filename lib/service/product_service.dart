import 'package:dio/dio.dart';
import 'package:flutter_ecommerce_app/models/product_model.dart';

class ProductService{

 Future<List<ProductModel>?> fetchProducts() async {
    final response = await Dio().get("https://dummyjson.com/products");

    if (response.statusCode == 200) {
      final _datas = response.data["products"];
      print(_datas);
      if (_datas is List) {
        return _datas.map((e) => ProductModel.fromJson(e)).toList();
      }
    }

    return null;
  }





}