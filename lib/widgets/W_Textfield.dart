import 'package:flutter/material.dart';

class W_Textfield extends StatelessWidget {
   W_Textfield({
    super.key,
    required this.controller,this.obscureText=false, this.hintText="",
  });

  final TextEditingController controller;
  bool obscureText;
  String hintText;
 
  
  @override
  Widget build(BuildContext context) {
    return TextField(
      
      obscureText: obscureText,
      controller: controller,
      decoration:  InputDecoration(
       
        hintText: hintText,
         hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(color: Theme.of(context).colorScheme.primary),
                  isDense: true,                       

          border: const OutlineInputBorder(
              borderRadius:
                  BorderRadius.all(Radius.circular(10)))),
    );
  }
}