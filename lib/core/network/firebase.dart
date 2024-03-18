import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class FireBaseServices {
  static Future<bool> uploadImage({required File file, required int id}) async {
    try {
      final storageRef =
          FirebaseStorage.instance.ref("$id/profile_image/$id.jpg");
      await storageRef.putFile(file);
      return true;
    } catch (error) {
      return false;
    }
  }
}
