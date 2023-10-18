import 'dart:io';

import 'package:e_commerce/config/services/auth_service.dart';
import 'package:firebase_storage/firebase_storage.dart';

final FirebaseStorage storage = FirebaseStorage.instance;
final AuthService _authService = AuthService();
Future<bool> uploadImage(File image) async {
  final String nameFile = image.path.split("/").last;
  final Reference ref = storage.ref().child("images").child(nameFile);
  final UploadTask uploadTask = ref.putFile(image);

  final TaskSnapshot snapshot = await uploadTask.whenComplete(() => true);
  print(snapshot);
  final String url = await snapshot.ref.getDownloadURL();
  print(url);
  if (snapshot.state == TaskState.success) {
    _authService.photoUser(url);
    return true;
  } else {
    return false;
  }
}
