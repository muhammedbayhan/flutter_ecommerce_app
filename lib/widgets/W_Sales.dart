import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/constants/global_colors.dart';

class W_Sales extends StatelessWidget {
   W_Sales({
    super.key,required this.imgUrl
  });
String imgUrl;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
      SizedBox(
      width: MediaQuery.of(context).size.width*0.8,
      height: MediaQuery.of(context).size.height*0.2,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
        child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10)),
          child: Image.asset(imgUrl,fit: BoxFit.cover,)),),),
        Positioned(
          left: 20,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
          Text("Get the special discount",style: TextStyle(color: GlobalColors.white),),
          Text("50%",style: Theme.of(context).textTheme.displaySmall!.copyWith(fontWeight: FontWeight.bold,color: GlobalColors.white),),
          Text("OFF",style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.bold,color: GlobalColors.white),),
          
          ],),
        )
    ],);
  }
}
