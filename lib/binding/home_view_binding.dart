import 'package:flutter_ecommerce_app/viewmodels/home_viewmodel.dart';
import 'package:get/get.dart';

class HomeViewBindings extends Bindings {
  @override
  void dependencies() {
Get.put(HomeViewModel());

  }


  
}