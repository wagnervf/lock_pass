import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthServices {
  final FirebaseAuth _authInstance = Modular.get<FirebaseAuth>();
  final GoogleSignIn _googleSignIn = Modular.get<GoogleSignIn>();

  Future signInGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      final googleAuth =
          await googleUser?.authentication;

      if (googleUser == null) return null;

      final _credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      final userCredential = await _authInstance.signInWithCredential(
        _credential,
      );

      return userCredential;
    } on FirebaseAuthException catch (e) {
      print('Failed with error code: ${e.code}');
      print(e.message);
      return e;
    }
  }

  Future signOutGoogle() async {
    print('signOut');

    try {
      await _authInstance.signOut();
    } on FirebaseAuthException catch (e) {
      print('Failed with error code: ${e.code}');
      print(e.message);
      return e;
    }
  }

  Stream<User?> userStream() {
    return _authInstance.authStateChanges();
  }
}
