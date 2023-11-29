import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/constants/global_colors.dart';
import 'package:flutter_ecommerce_app/service/auth_service.dart';

class W_Appbar extends StatelessWidget implements PreferredSizeWidget {
  W_Appbar({Key? key, })
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: GlobalColors.transparent,
      elevation: 0,
      leading: 
      
       Column(
        mainAxisAlignment: MainAxisAlignment.center,
         children: [
           CircleAvatar(
            radius: 16,
            child: Text(AuthService().firebaseAuth.currentUser!.email![0],style: TextStyle(color: Colors.white),),backgroundColor: Theme.of(context).colorScheme.primary,)
         ],
       ),
    
    actions: [IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart,color: Theme.of(context).colorScheme.primary,))],
  
      centerTitle: true,
    );
  }
}
