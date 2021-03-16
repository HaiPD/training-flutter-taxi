import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class FireBaseAuth {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void signUp(String email, String pass, String name, String phone,
      Function onSuccess) {
    _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: pass)
        .then((value) {
      _createUser(value.user.uid, name, phone, onSuccess);
    }).catchError((err) {
      print(err);
    });
  }

  void _createUser(
      String userId, String name, String phone, Function onSuccess) {
    var user = {"name": name, "phone": phone};
    var ref = FirebaseDatabase.instance.reference().child("users");
    ref.child(userId).set(user).then((value) {
      onSuccess();
    }).catchError((err) {});
  }
}
