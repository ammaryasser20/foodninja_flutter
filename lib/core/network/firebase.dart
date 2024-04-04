import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FireBaseServices {
  Future<bool> uploadImage({required File file, required int id}) async {
    try {
      final storageRef =
          FirebaseStorage.instance.ref("$id/profile_image/$id.jpg");
      await storageRef.putFile(file);
      return true;
    } catch (error) {
      return false;
    }
  }

  Future<String?> downloadImage({required int id}) async {
    try {
      final storageRef =
          FirebaseStorage.instance.ref("$id/profile_image/$id.jpg");
      final downloaded = await storageRef.getDownloadURL();
      return downloaded;
    } catch (error) {
      return null;
    }
  }

  Future<List<dynamic>?> getFavorites(int userID) async {
    final getRef = await FirebaseFirestore.instance
        .collection("user")
        .doc('$userID')
        .get();
    if (getRef.data() != null) {
      final data = getRef.data()!["Favorites"];
      return data;
    }
    return null;
  }

  Future<void> addFavorites(int userID, int foodId) async {
    try {
      await FirebaseFirestore.instance.collection("user").doc('$userID').set({
        "Favorites": FieldValue.arrayUnion(
          [foodId],
        )
      }, SetOptions(merge: true));
    } catch (e) {
      throw "error in server";
    }
  }

  Future<void> removeFavorites(int userID, int foodId) async {
    try {
      await FirebaseFirestore.instance
          .collection("user")
          .doc('$userID')
          .update({
        "Favorites": FieldValue.arrayRemove(
          [foodId],
        )
      });
    } catch (e) {
      throw "error in server";
    }
  }

  Future<void> addPayment(int userID, List<String> paymentWays) async {
    try {
      await FirebaseFirestore.instance.collection("user").doc('$userID').set({
        "Payments": paymentWays,
      }, SetOptions(merge: true));
    } catch (e) {
      throw "error in server";
    }
  }
  
}
