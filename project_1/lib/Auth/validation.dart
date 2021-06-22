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
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool("isLogged", true);
      if (!user.emailVerified) {
        await user.sendEmailVerification();
      }
    }
  }

  void signInWithEmailAndPass(String email, String pass) async {
    await Firebase.initializeApp();
    try {
      final User? user =
          (await _auth.signInWithEmailAndPassword(email: email, password: pass))
              .user;
      if (!user!.emailVerified) {
        await user.sendEmailVerification();
      }
      // Get.to(HomeScreen());
      print(user.uid + "this is unique id ");
    } catch (e) {
      print('This is errrrroooorrr $e');
    }
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
