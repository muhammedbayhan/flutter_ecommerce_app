import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/constants/global_colors.dart';
import 'package:flutter_ecommerce_app/constants/page_padding.dart';
import 'package:flutter_ecommerce_app/routes/routes.dart';
import 'package:get/route_manager.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [

        Image.asset(
            "assets/welcome-bg.png",
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),

               Text(
                    "Ecommerce App",
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: GlobalColors.white),
                    textAlign: TextAlign.center,
                  ),
       
          Padding(
            padding: PagePadding.pagePadding,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: 
            
            [
                  ElevatedButton(
                onPressed: () {
                Get.toNamed(AppRoutes.login);
                },
                child: Text("Sign In"),
                style: ElevatedButton.styleFrom(backgroundColor: GlobalColors.black,shape: StadiumBorder()),
              ),
                  ElevatedButton(
                onPressed: () {
              Get.toNamed(AppRoutes.register);
                },
                child: Text("Sign Up"),
                style: ElevatedButton.styleFrom(elevation: 0,backgroundColor: GlobalColors.transparent,shape: StadiumBorder(side: BorderSide(color: GlobalColors.white,width: 2))),
              )
            ],),
          )

      ]),
    );
  }
}