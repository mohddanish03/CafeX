import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class validationModel {
  final _auth = FirebaseAuth.instance;

  void signUp(String email, String password) async {
    await Firebase.initializeApp();
    final User? user = (await _auth.createUserWithEmailAndPassword(
            email: email, password: password))
        .user;
    if (user != null) {
      if (!user.emailVerified) {
        await user.sendEmailVerification();
      }
    }
  }

  Future<User> handleSignInEmail(String email, String password) async {
    await Firebase.initializeApp();
    UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    final User user = result.user!;
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.setBool('IsLogged', true);
    await user.sendEmailVerification();
    print(user.displayName);
    return user;
  }

  Future getCurrentUser() async {
    User _user = await FirebaseAuth.instance.currentUser!;
    print("User: ${_user.displayName ?? "None"}");
    return _user;
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  validateName(String fullname) {
    if (fullname.isEmpty) {
      return 'Enter your name';
    }
    return null;
  }

  String? validateEmail(String value) {
    Pattern pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = new RegExp(pattern.toString());
    if (!regex.hasMatch(value))
      return 'Enter a valid email address';
    else
      return null;
  }

  String? confirmPassword(String password, String passCon) {
    if (password.isEmpty) return 'Please Comfirm Password';
    if (password != passCon) return 'Password Do not match';
    return null;
  }
}
