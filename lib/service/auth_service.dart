import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

final userCollection=FirebaseFirestore.instance.collection("users");
final firebaseAuth=FirebaseAuth.instance;


Future<void>signIn({required String email,required String password})async{

try {
  final UserCredential userCredential= await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
if (userCredential.user!=null) {
  print("Login successful");
}
} on FirebaseAuthException catch (e) {
  print("----------SIGN IN ERROR----------")  ;
print(e.message);
print("---------------------------------");

}

}






Future<void>signUp({required String email,required String password})async{
try {
  final UserCredential userCredential= await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
if (userCredential.user!=null) {
  _registerUser(email: email, password: password, uid: userCredential.user!.uid);
    print("Register successful");

}

} on FirebaseAuthException catch (e) {
print("----------SIGN UP ERROR----------")  ;
print(e.message);
print("---------------------------------");

}


}




Future<void> _registerUser({required String email,required String password,required String uid})async{

await userCollection.doc(uid).set({
  "email":email,
  "password":password
});


}




}