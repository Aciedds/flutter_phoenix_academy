import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_phoenix_academy/config/state/data_state.dart';

class UserRemote {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore;

  UserRemote(this._firestore, this._firebaseAuth);

  Future<DataState<bool>> addUserData({
    required Map<String, dynamic> data,
  }) async {
    try {
      await _firestore
          .collection("users")
          .doc(_firebaseAuth.currentUser!.uid)
          .set(data);
      return DataState.success(true);
    } catch (e) {
      return DataState.error(message: "Error: e");
    }
  }



  Future<DataState<bool>> updateUser({
    required Map<String, dynamic> data,
  }) async {
    try {
      await _firestore
          .collection("users")
          .doc(_firebaseAuth.currentUser!.uid)
          .update(data);
      return DataState.success(true);
    } catch (e) {
      return DataState.error(message: "Error: e");
    }
  }

  Future<DataState<bool>> deleteUser() async {
    try {
      await _firebaseAuth.currentUser!.delete();
      return DataState.success(true);
    } catch (e) {
      return DataState.error(message: "Error: e");
    }
  }
}
