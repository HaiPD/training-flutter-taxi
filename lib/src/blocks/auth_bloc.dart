import 'dart:async';
import 'package:taxi_app/src/firebase/firebase_auth.dart';

class AuthBloc {
  var _fireBase = new FireBaseAuth();

  StreamController _nameController = new StreamController();
  StreamController _emailController = new StreamController();
  StreamController _passController = new StreamController();
  StreamController _phoneController = new StreamController();

  Stream get nameStream => _nameController.stream;
  Stream get emailStream => _emailController.stream;
  Stream get passStream => _passController.stream;
  Stream get phoneStream => _phoneController.stream;

  bool isValid(String name, String email, String pass, String phone) {
    if (name == null || name.length == 0) {
      _nameController.sink.addError("Name is required");
      return false;
    }
    _nameController.sink.add("");

    if (phone == null || phone.length == 0) {
      _phoneController.sink.addError("Phone is required");
      return false;
    }
    _phoneController.sink.add("");

    if (email == null || email.length == 0) {
      _emailController.sink.addError("Email is required");
      return false;
    }
    _emailController.sink.add("");

    if (pass == null || pass.length == 0) {
      _passController.sink.addError("Password is required");
      return false;
    }
    _passController.sink.add("");

    return true;
  }

  void signUp(String email, String pass, String name, String phone,
      Function onSuccess) {
    _fireBase.signUp(email, pass, name, phone, onSuccess);
  }

  void dispose() {
    _nameController.close();
    _emailController.close();
    _passController.close();
    _phoneController.close();
  }
}
