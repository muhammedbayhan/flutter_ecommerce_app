import 'package:flutter_ecommerce_app/binding/home_view_binding.dart';
import 'package:flutter_ecommerce_app/views/base/base_scaffold.dart';
import 'package:flutter_ecommerce_app/views/home_view.dart';
import 'package:flutter_ecommerce_app/views/login_view.dart';
import 'package:flutter_ecommerce_app/views/product_detail_view.dart';
import 'package:flutter_ecommerce_app/views/register_view.dart';
import 'package:flutter_ecommerce_app/views/welcome_view.dart';
import 'package:get/route_manager.dart';


class AppRoutes {
  static const String welcome = "/";
  static const String login = "/login";
  static const String register = "/register";
  static const String home = "/home";
  static const String productDetail = "/productDetail";


  static List<GetPage> routes =[


            GetPage(
          name: welcome,
          page: () => WelcomeView(),
                transitionDuration: Duration(milliseconds: 250)

        ),
          GetPage(
          name: login,
          page: () => LoginView(),
                transitionDuration: Duration(milliseconds: 250)

        ),
          GetPage(
          name: register,
          page: () => RegisterView(),
                transitionDuration: Duration(milliseconds: 250),
               

        ),

             GetPage(
          name: home,
          page: () => BaseScaffoldView(),
                transitionDuration: Duration(milliseconds: 250),
                 binding: HomeViewBindings(),

        ),


               GetPage(
          name: productDetail,
          page: () => ProductDetailView(),
                transitionDuration: Duration(milliseconds: 250)

        ),
  ];
}
