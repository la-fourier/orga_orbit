import 'package:firebase_auth/firebase_auth.dart';

void signIn() async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: "email@example.com",
      password: "password",
    );
    User user = userCredential.user!;
    print('Signed in as: ${user.uid}');
  } catch (e) {
    print('Failed to sign in: $e');
  }
}

void checkSignIn() {
  FirebaseAuth auth = FirebaseAuth.instance;
  if (auth.currentUser != null) {
    print('User is signed in');
  } else {
    print('User is not signed in');
  }
}
