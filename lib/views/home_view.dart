import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/constants/global_colors.dart';
import 'package:flutter_ecommerce_app/constants/page_padding.dart';
import 'package:flutter_ecommerce_app/service/product_service.dart';
import 'package:flutter_ecommerce_app/viewmodels/home_viewmodel.dart';
import 'package:flutter_ecommerce_app/widgets/W_CategoryCard.dart';
import 'package:flutter_ecommerce_app/widgets/W_ProductCard.dart';
import 'package:flutter_ecommerce_app/widgets/W_Sales.dart';
import 'package:flutter_ecommerce_app/widgets/W_Textfield.dart';
import 'package:get/get.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  TextEditingController _searchController = TextEditingController();

  final HomeViewModel _homeViewModel = Get.put(HomeViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Padding(
      padding: PagePadding.pagePadding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
                child: W_Textfield(
                  controller: _searchController,
                  hintText: "Search...",
                )),
          ),
          Expanded(
            flex: 3,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: [
                W_Sales(
                  imgUrl: "assets/pencilbox.png",
                ),
                W_Sales(
                  imgUrl: "assets/phone.png",
                ),
              ]),
            ),
          ),
          Text(
            "Category",
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          Expanded(
            flex: 1,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * .05,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: _homeViewModel.products!.length,
                itemBuilder: (BuildContext context, int index) =>
                    W_CategoryCard(
                        categoryName: _homeViewModel.products![index].category!),
              ),
            ),
          ),
          Text("Recend product",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontWeight: FontWeight.bold)),
          Expanded(
              flex: 5,
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5,
                      childAspectRatio: 3 / 4),
                  itemCount: _homeViewModel.products!.length,
                  itemBuilder: (context, index) {
                    return ProductCard(
                      imgUrl: _homeViewModel.products![index].thumbnail!,
                      productTitle: _homeViewModel.products![index].title!,
                      price: _homeViewModel.products![index].price.toString(),
                      index: index,
                    );
                  })),
        ],
      ),
    ));
  }
}
