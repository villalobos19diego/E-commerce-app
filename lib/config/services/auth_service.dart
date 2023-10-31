import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  bool isSigned = FirebaseAuth.instance.currentUser != null;

  Future<bool> loginHandlerEmail(
      BuildContext context, String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        if (kDebugMode) {
          print(e.code);
        }
      }
      if (e.code == "INVALID_LOGIN_CREDENTIALS") {
        dialogError(context, "Contraseña o Email No son correctas");
      }
      if (e.code == "user-not-found") {
        dialogError(context, "Usuario no encontrado");
      }
      if (e.code == "wrong-password") {
        dialogError(context, "La contraseña no es correcto");
      }
      if (e.code == "operation-not-allowed") {
        dialogError(context,
            "El tipo de autenticación proporcionado no está permitido.");
      }
      if (e.code == "invalid-email") {
        dialogError(
            context, "El correo electrónico proporcionado no es válido.");
      }
      if (e.code == "too-many-requests") {
        dialogError(context,
            "Se han realizado demasiados intentos de inicio de sesión.");
      }
      if (e.code == "network-request-failed") {
        dialogError(context,
            "Se ha producido un error de red durante la solicitud de inicio de sesión.");
      }
    }
    return false;
  }

  Future<bool> signUpHandlerEmail(
      BuildContext context, String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      if (kDebugMode) {
        print(e.code);
      }
      if (e.code == "email-already-in-use") {
        dialogError(context,
            "${email} \n El correo electrónico proporcionado ya está en uso por otro usuario");
      }
      if (e.code == "operation-not-allowed") {
        dialogError(context,
            "El tipo de autenticación proporcionado no está permitido.");
      }
      if (e.code == "invalid-email") {
        dialogError(
            context, "El correo electrónico proporcionado no es válido.");
      }
      if (e.code == "too-many-requests") {
        dialogError(context,
            "Se han realizado demasiados intentos de inicio de sesión.");
      }
      if (e.code == "network-request-failed") {
        dialogError(context,
            "Se ha producido un error de red durante la solicitud de inicio de sesión.");
      }
    }
    return false;
  }

  Future<void> signInHandler() async {
    try {
      GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser != null) {
        GoogleSignInAuthentication? googleAuth =
            await googleUser.authentication;
        AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        await _auth.signInWithCredential(credential);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> logout() async {
    if (isSigned) {
      await FirebaseAuth.instance.signOut();
      await _googleSignIn.signOut();
    }
  }

  Future<void> photoUser(String imageURL) async {
    if (isSigned) {
      await _auth.currentUser!.updatePhotoURL(imageURL);
      print(_auth.currentUser!.photoURL.toString());
    }
  }

  String? getPhoto() {
    final photo = FirebaseAuth.instance.currentUser?.photoURL;
    if (photo != null) {
      return photo;
    }else{
      return null;
    }
    
  }

  String? getEmail() {
    return FirebaseAuth.instance.currentUser!.email;
  }

  String? getUsername() {
    return FirebaseAuth.instance.currentUser!.displayName;
  }

  Widget isSignedIn(Widget widgetTrue, Widget widgetFalse) {
    if (isSigned) {
      return widgetTrue;
    }
    return widgetFalse;
  }

  Future<dynamic> dialogError(BuildContext context, String e) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(e),
          actions: [
            TextButton(
              child: const Text('Aceptar'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
