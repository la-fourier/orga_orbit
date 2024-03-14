import 'package:firebase_auth/firebase_auth.dart';

Future<String> saveLogin(String email, String password) async {
  try {
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    User user = userCredential.user!;
    print(user);
    return "success";
  } catch (e) {
    print(e);
    return e.toString();
  }
}

// signup

//sso

// 2fauth
