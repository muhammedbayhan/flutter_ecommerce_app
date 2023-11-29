import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_ecommerce_app/constants/global_colors.dart';
import 'package:flutter_ecommerce_app/constants/page_padding.dart';
import 'package:flutter_ecommerce_app/service/firestore_service.dart';
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
        backgroundColor: GlobalColors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: GlobalColors.transparent,
              ),
              SizedBox(
                child: Image.network(
                  _homeViewModel
                      .products![_homeViewModel.selectIndex].images![0],
                  fit: BoxFit.cover,
                ),
                height: MediaQuery.of(context).size.height * 0.6,
              ),
              Positioned(
                bottom: 0,
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    child: Container(
                      color: GlobalColors.white,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.5,
                      child: Padding(
                        padding: PagePadding.pagePadding,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: SizedBox(
                                    width: 60,
                                    child: Divider(
                                      thickness: 3,
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    )),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    _homeViewModel
                                        .products![_homeViewModel.selectIndex]
                                        .title!,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                          "${_homeViewModel.products![_homeViewModel.selectIndex].price.toString()}\$ ",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineSmall!
                                              .copyWith(
                                                  fontWeight: FontWeight.bold,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .primary)),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                          Text(_homeViewModel
                                              .products![
                                                  _homeViewModel.selectIndex]
                                              .rating
                                              .toString()),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Text(_homeViewModel
                                  .products![_homeViewModel.selectIndex]
                                  .description
                                  .toString()),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  CircleAvatar(
                                      backgroundColor:Theme.of(context).colorScheme.primary,
                                          
                                      child: IconButton(
                                          onPressed: () {

                                            FirestoreService().addFavorites(_homeViewModel.selectIndex);
                                          },
                                          icon: Icon(
                                            Icons.favorite_border,
                                            color: GlobalColors.white
                                          ))),
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.75,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.05,
                                      child: ElevatedButton(
                                        onPressed: () {

                                            FirestoreService().addToCart(_homeViewModel.selectIndex,_homeViewModel.products![_homeViewModel.selectIndex].price!);


                                        },
                                        child: Text("ADD TO CART"),
                                        style: ElevatedButton.styleFrom(
                                            shape: StadiumBorder()),
                                      ))
                                ],
                              )
                            ]),
                      ),
                    )),
              )
            ],
          )
        ],
      ),
    );
  }
}
