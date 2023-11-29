import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_ecommerce_app/service/auth_service.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    Future<void> addToCart(int productId,int price) async {
    try {
      await _firestore.collection("users").doc(AuthService().firebaseAuth.currentUser!.uid).collection('Cart').doc(productId.toString()).set({
        'productId': productId,
        'price':price
      });
    } catch (e) {
      print('Hata: $e');
    }
  }

    Future<void> removeFromCart(String favoriteDocumentId) async {
  try {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    DocumentReference userDocumentRef = firestore.collection('users').doc(AuthService().firebaseAuth.currentUser!.uid);

    CollectionReference favoritesCollectionRef = userDocumentRef.collection('Cart');

    await favoritesCollectionRef.doc(favoriteDocumentId).delete();

    print('Belge başarıyla silindi.');
  } catch (e) {
    print('Hata oluştu: $e');
  }
}





  Future<void> addFavorites(int productId) async {
    try {
      await _firestore.collection("users").doc(AuthService().firebaseAuth.currentUser!.uid).collection('Favorites').doc(productId.toString()).set({
        'productId': productId,
      });
    } catch (e) {
      print('Hata: $e');
    }
  }


  Future<void> removeFavorite(String favoriteDocumentId) async {
  try {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    DocumentReference userDocumentRef = firestore.collection('users').doc(AuthService().firebaseAuth.currentUser!.uid);

    CollectionReference favoritesCollectionRef = userDocumentRef.collection('Favorites');

    await favoritesCollectionRef.doc(favoriteDocumentId).delete();

    print('Belge başarıyla silindi.');
  } catch (e) {
    print('Hata oluştu: $e');
  }
}
}


