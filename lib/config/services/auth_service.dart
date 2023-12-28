import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  bool isSigned = FirebaseAuth.instance.currentUser != null;


  

 Future<void> updateEmailWithVerification(String newEmail ) async {
    try {
      // Verifica si el nuevo correo electrónico es válido
      if (!isValidEmail(newEmail)) {
        Fluttertoast.showToast(
          msg: 'Correo electrónico no válido',
          backgroundColor: Colors.red,
        );
        return;
      }

      // Reautentica al usuario antes de cambiar el correo electrónico
      await _auth.currentUser!.reauthenticateWithCredential(
        EmailAuthProvider.credential(email: _auth.currentUser!.email!, password: ''),
      );

      // Actualiza el correo electrónico
      await _auth.currentUser!.updateEmail(newEmail);

      // Muestra el mensaje de éxito después de la actualización exitosa
      Fluttertoast.showToast(
        msg: 'Se ha enviado un mensaje a tu bandeja de correo para verificar el cambio',
        backgroundColor: Colors.green,
      );
    } on FirebaseAuthException catch (e) {
      // Muestra mensajes de error específicos según el código de error
      if (e.code == "requires-recent-login") {
        Fluttertoast.showToast(
          msg: 'Esta operación requiere una autenticación reciente. Inicia sesión nuevamente.',
          backgroundColor: Colors.red,
        );
      } else if (e.code == "invalid-email") {
        Fluttertoast.showToast(
          msg: 'El correo electrónico proporcionado no es válido.',
          backgroundColor: Colors.red,
        );
      } else if (e.code == "user-mismatch") {
        Fluttertoast.showToast(
          msg: 'La reautenticación no coincide con el usuario actual.',
          backgroundColor: Colors.red,
        );
      } else if (e.code == "user-not-found") {
        Fluttertoast.showToast(
          msg: 'Usuario no encontrado.',
          backgroundColor: Colors.red,
        );
      } else if (e.code == "wrong-password") {
        Fluttertoast.showToast(
          msg: 'La contraseña no es correcta.',
          backgroundColor: Colors.red,
        );
      } else {
        // Maneja otros códigos de error aquí según sea necesario
        Fluttertoast.showToast(
          msg: 'Error al cambiar el correo: ${e.message}',
          backgroundColor: Colors.red,
        );
      }

      if (kDebugMode) {
        print(e);
      }
    }
  }

  bool isValidEmail(String email) {
    // Agrega aquí tu lógica para validar el formato del correo electrónico
    // Puedes usar expresiones regulares u otras técnicas según tus requisitos
    return true; // Ejemplo: siempre válido por ahora
  }
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
        dialogError(context, "Contraseña o email no son correctas");
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
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {postDetailsToFirestore(email)});
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
        await _auth
            .signInWithCredential(credential)
            .then((value) async => postDetailsToFirestore(googleUser.email));
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
    } else {
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

  postDetailsToFirestore(String email) async {
    String rool = "usuario";
    var user = _auth.currentUser;
    final docRef =
        FirebaseFirestore.instance.collection('users').doc(user!.uid);
    final documentSnapshot = await docRef.get();
    if (!documentSnapshot.exists) {
      CollectionReference ref = FirebaseFirestore.instance.collection('users');
      ref.doc(user.uid).set({'email': email, 'rool': rool});
    }
  }

  Future<bool> rolUser() async {
    var user = _auth.currentUser;
    final docRef =
        FirebaseFirestore.instance.collection('users').doc(user!.uid);
    final documentSnapshot = await docRef.get();
    if (documentSnapshot.get('rool') == "admin") {
      return true;
    }
    return false;
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
