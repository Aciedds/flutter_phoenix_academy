import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_phoenix_academy/config/state/data_state.dart';

class AuthRemote {
  final FirebaseAuth _auth;

  AuthRemote(this._auth);

  Future<DataState<UserCredential>> loginWithAuthEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return DataState.success(userCredential);
    } catch (e) {
      return DataState.error(message: "Error: e");
    }
  }

  Future<DataState<UserCredential>> registerWithAuthEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return DataState.success(userCredential);
    } catch (e) {
      return DataState.error(message: "Error: e");
    }
  }

  Future<DataState<bool>> logout() async {
    try {
      return await _auth.signOut().then((value) => DataState.success(true));
    } catch (e) {
      return DataState.error(message: "Error: e");
    }
  }

  Future<DataState<bool>> sendPasswordResetEmail(
      {required String email}) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return DataState.success(true);
    } catch (e) {
      return DataState.error(message: "Error: e");
    }
  }

  Future<DataState<bool>> sendEmailVerification() async {
    try {
      await _auth.currentUser!.sendEmailVerification();
      return DataState.success(true);
    } catch (e) {
      return DataState.error(message: "Error: e");
    }
  }

  Future<DataState<bool>> deleteUser() async {
    try {
      await _auth.currentUser!.delete();
      return DataState.success(true);
    } catch (e) {
      return DataState.error(message: "Error: e");
    }
  }

  Future<DataState<bool>> updateEmail({required String email}) async {
    try {
      await _auth.currentUser!.verifyBeforeUpdateEmail(email);
      return DataState.success(true);
    } catch (e) {
      return DataState.error(message: "Error: e");
    }
  }

  Future<DataState<bool>> updatePassword({required String password}) async {
    try {
      await _auth.currentUser!.updatePassword(password);
      return DataState.success(true);
    } catch (e) {
      return DataState.error(message: "Error: e");
    }
  }

  Future<DataState<bool>> updateDisplayName(
      {required String displayName}) async {
    try {
      await _auth.currentUser!.updateDisplayName(displayName);
      return DataState.success(true);
    } catch (e) {
      return DataState.error(message: "Error: e");
    }
  }

  Future<DataState<bool>> updatePhotoURL({required String photoURL}) async {
    try {
      await _auth.currentUser!.updatePhotoURL(photoURL);
      return DataState.success(true);
    } catch (e) {
      return DataState.error(message: "Error: e");
    }
  }

  DataState<User> getCurrentUserData() {
    try {
      if (_auth.currentUser == null) {
        return DataState.error(message: "Error: User is null");
      }
      return DataState.success(_auth.currentUser!);
    } catch (e) {
      return DataState.error(message: "Error: e");
    }
  }
}
