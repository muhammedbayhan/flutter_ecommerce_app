import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/constants/global_colors.dart';
import 'package:flutter_ecommerce_app/views/cart_view.dart';
import 'package:flutter_ecommerce_app/views/favorites_view.dart';
import 'package:flutter_ecommerce_app/views/home_view.dart';
import 'package:flutter_ecommerce_app/views/profile_view.dart';
import 'package:flutter_ecommerce_app/widgets/W_Appbar.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class BaseScaffoldView extends StatefulWidget {
  const BaseScaffoldView({super.key});

  @override
  State<BaseScaffoldView> createState() => _BaseScaffoldViewState();
}

class _BaseScaffoldViewState extends State<BaseScaffoldView> {
  List<Widget> _buildScreens() {
    return [
      const HomeView(),
      const FavoritesView(),
      const CartView(),
      const ProfileView(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home_filled),
        activeColorPrimary: Theme.of(context).colorScheme.primary,
        inactiveColorPrimary: GlobalColors.lightGrey,
        activeColorSecondary: Colors.white
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.favorite),
        activeColorPrimary: Theme.of(context).colorScheme.primary,
        inactiveColorPrimary: GlobalColors.lightGrey,
        activeColorSecondary: Colors.white
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.shopping_cart),
        activeColorPrimary: Theme.of(context).colorScheme.primary,
        inactiveColorPrimary: GlobalColors.lightGrey,
        activeColorSecondary: Colors.white
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.person),
        activeColorPrimary: Theme.of(context).colorScheme.primary,
        inactiveColorPrimary: GlobalColors.lightGrey,
        activeColorSecondary: Colors.white
      ),
    ];
  }


  @override
  Widget build(BuildContext context) {

        return Scaffold(
          appBar: W_Appbar(),
          body: PersistentTabView(
            context,
                
            screens: _buildScreens(),
            items: _navBarsItems(),
            confineInSafeArea: true,
            backgroundColor: GlobalColors.white, // Default is Colors.white.
            handleAndroidBackButtonPress: true, // Default is true.
            resizeToAvoidBottomInset:
                true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
            stateManagement: true, // Default is true.
            hideNavigationBarWhenKeyboardShows:
                true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
            decoration: NavBarDecoration(
              borderRadius: BorderRadius.circular(10.0),
              colorBehindNavBar: GlobalColors.white,
            ),
            popAllScreensOnTapOfSelectedTab: true,
            popActionScreens: PopActionScreensType.all,
            itemAnimationProperties: const ItemAnimationProperties(
              // Navigation Bar's items animation properties.
              duration: Duration(milliseconds: 200),
              curve: Curves.ease,
            ),
            screenTransitionAnimation: const ScreenTransitionAnimation(
              // Screen transition animation on change of selected tab.
              animateTabTransition: true,
              curve: Curves.ease,
              duration: Duration(milliseconds: 200),
            ),
            navBarStyle: NavBarStyle.style7, //);
          ),
        );
  
    
  }
}
