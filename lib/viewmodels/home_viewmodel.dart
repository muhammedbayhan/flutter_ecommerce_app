import 'package:flutter_ecommerce_app/models/product_model.dart';
import 'package:flutter_ecommerce_app/service/product_service.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController{
    @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchData();
  }
 
  List<ProductModel>? products = <ProductModel>[].obs;



 final ProductService _productService=ProductService();

 Future<void>fetchData()async{
products=await _productService.fetchProducts();



 }

 int selectIndex=0;
}