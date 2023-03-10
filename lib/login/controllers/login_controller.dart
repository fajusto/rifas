import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_controller.g.dart';

class LoginController = _LoginController with _$LoginController;

abstract class _LoginController with Store {

  @observable
  User? user;

  @action
  Future<String?> signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("token", await user!.getIdToken());
      return user!.uid;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      return null;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  @action
  Future<bool?> checkAuth() async {
    FirebaseAuth auth = FirebaseAuth.instance;

    // Check if user is already signed in
    if (auth.currentUser != null) {
      return true;
    } else {
      return false;
    }
  }

  @action
  Future<bool?> logout() async {
    FirebaseAuth auth = FirebaseAuth.instance;

    auth.signOut();
  }

}