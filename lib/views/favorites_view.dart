import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/service/auth_service.dart';
import 'package:flutter_ecommerce_app/service/firestore_service.dart';
import 'package:flutter_ecommerce_app/viewmodels/home_viewmodel.dart';
import 'package:get/get.dart';

class FavoritesView extends StatelessWidget {
  FavoritesView({super.key});
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final HomeViewModel _homeViewModel = Get.put(HomeViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(AuthService().firebaseAuth.currentUser!.uid)
            .collection('Favorites')
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }

          List<String> productIds = [];

          // Favorites koleksiyonundaki belgeleri döngü ile gez
          snapshot.data!.docs.forEach((doc) {
            // Her belge içindeki productId'yi al ve listeye ekle
            productIds.add(doc['productId'].toString());
          });

          // İşlem tamamlandığında listeyi göster
          return ListView.builder(
            itemCount: productIds.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  leading: ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: 50,
                      minHeight: 50,
                      maxWidth: 50,
                      maxHeight: 50,
                    ),
                    child: Image.network(
                        _homeViewModel
                            .products![int.parse(productIds[index])].thumbnail!,
                        fit: BoxFit.fill),
                  ),
                  trailing: IconButton(
                      onPressed: () {
                        FirestoreService()
                            .removeFavorite(productIds[index].toString());
                      },
                      icon: Icon(
                        Icons.delete,
                        color: Theme.of(context).colorScheme.primary,
                      )),
                  title: Text(_homeViewModel
                          .products![int.parse(productIds[index])].title!
                      //

                      ),
                  subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(_homeViewModel
                            .products![int.parse(productIds[index])]
                            .description!),
                        Text(_homeViewModel
                            .products![int.parse(productIds[index])].title!),
                      ]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
