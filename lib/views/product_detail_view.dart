import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_ecommerce_app/constants/global_colors.dart';
import 'package:flutter_ecommerce_app/viewmodels/home_viewmodel.dart';
import 'package:get/get.dart';

class ProductDetailView extends StatelessWidget {
  ProductDetailView({super.key});
  final HomeViewModel _homeViewModel = Get.put(HomeViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       extendBodyBehindAppBar: true,
      appBar: AppBar(
        
        actions: [Padding(
          padding: const EdgeInsets.only(right:12),
          child: CircleAvatar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            radius: 17,
            child: Icon(Icons.favorite,color: GlobalColors.white,)),
        )],
        backgroundColor: GlobalColors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
      ),
      body:Column(
        children: [
        Stack(
          children: [
Container(height: MediaQuery.of(context).size.height,width: MediaQuery.of(context).size.width,color: GlobalColors.transparent,),
SizedBox(child: Image.network( _homeViewModel.products![_homeViewModel.selectIndex].images![0],fit: BoxFit.cover,),height: MediaQuery.of(context).size.height*0.6,),
Positioned(bottom: 0,child: ClipRRect(
  borderRadius: BorderRadius.all(Radius.circular(20)),
  child: Container(color: GlobalColors.white,width:  MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height*0.5,)))


        ],)



        ],
      ),
    );
  }
}
