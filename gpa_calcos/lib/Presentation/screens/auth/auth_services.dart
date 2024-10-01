import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:gpa_calcos/Presentation/Custom/files/Toast/showtoast.dart';

class AuthService {
  final _auth = FirebaseAuth.instance;
  Future<User?> createUserWithEmailAndPAssword(
      String email, String password) async {
    try {
      final cred = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return cred.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        showToast(message: "The email address alre ady in use");
      } else {
        showToast(message: "An error occurred. ${e.code}");
      }
    }
    return null;
  }

  Future<User?> logInWithEmailAndPAssword(String email, String password) async {
    try {
      final cred = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return cred.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user_not_found' || e.code == 'wrong-password') {
        showToast(message: 'Invalid email or password');
      } else {
        showToast(message: "An error occurred. ${e.code}");
      }
    }
    return null;
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } on FirebaseAuthException catch (e) {
      showToast(message: "Something went wrong ${e.code}");
    }
  }

  final GoogleSignIn _googleSignIn = GoogleSignIn();
  Future<UserCredential?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleUser.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );
        final userCredential = await _auth.signInWithCredential(credential);
        return userCredential;
      }
    }
  
    catch (e) {
      if (e is PlatformException) {
        if (e.code == 'sign_in_failed') {
          // Handle specific sign-in failure

          showToast(message: 'Sign-in failed. Please try again.');
        } else if (e.code == 'sign_in_cancelled') {
          // Handle sign-in cancellation

          showToast(message: 'Sign-in cancelled.');
        }
      }
    }

    return null;
  }

  void showLoginErrorSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }
}
