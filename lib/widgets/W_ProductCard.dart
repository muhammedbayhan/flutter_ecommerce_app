import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/routes/routes.dart';
import 'package:flutter_ecommerce_app/viewmodels/home_viewmodel.dart';
import 'package:get/get.dart';

class ProductCard extends StatelessWidget {
   ProductCard({
    super.key,required this.imgUrl,required this.productTitle,required this.price,required this.index,required this.brand
  });
      final HomeViewModel _homeViewModel = Get.put(HomeViewModel());
String imgUrl;
String productTitle;
String brand;
String price;
int index;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.all(Radius.circular(10))),
            child: ClipRRect(
              borderRadius:
                  BorderRadius.all(Radius.circular(10)),
              child: Image.network(
                imgUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),

     RichText(
    maxLines: 1,
    overflow: TextOverflow.ellipsis, // TextOverflow.clip // TextOverflow.fade
    text: TextSpan(
        text: '$brand ',
        style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),
        children: <TextSpan>[
            TextSpan(text: '$productTitle', style: DefaultTextStyle.of(context).style),
        ],
    ),
),
        Text(
          "$price\$",
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(fontWeight: FontWeight.bold),
        ),
       TextButton(onPressed: (){
_homeViewModel.selectIndex=index;
Get.toNamed(AppRoutes.productDetail);
        

       }, child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text("View Product"),Icon(Icons.arrow_right_alt_sharp)],))
      ],
    );
  }
}

