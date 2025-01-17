import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_phoenix_academy/firebase_options.dart';

class FirebaseServie {
  FirebaseServie._();

  static final _firebaseOption = DefaultFirebaseOptions.currentPlatform;
  static late final FirebaseApp _app;
  static late final FirebaseAuth _auth;
  static const bool _shouldUseFirebaseEmulator = false;

  static Future<void> init() async {
    _app = await Firebase.initializeApp(options: _firebaseOption);
    _auth = FirebaseAuth.instanceFor(app: _app);
    if (_shouldUseFirebaseEmulator) {
      await _auth.useAuthEmulator('localhost', 8080);
    }
  }
}
