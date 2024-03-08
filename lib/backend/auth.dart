import 'package:firebase_auth/firebase_auth.dart';

Future<int> saveLogin(String email, String password) async {
  try {
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    User user = userCredential.user!;
    return 0;
  } catch (e) {
    print("e");
    return 1;
  }
}

// signup

//sso

// 2fauth