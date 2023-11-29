import 'package:flutter/material.dart';

class W_CategoryCard extends StatelessWidget {
   W_CategoryCard({
    super.key,required this.categoryName
  });
String categoryName;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 115,
      child: Card(
        child: Center(child: Text(categoryName)),
      ),
    );
  }
}
