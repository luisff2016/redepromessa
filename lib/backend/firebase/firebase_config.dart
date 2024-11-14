import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyACvk5x71soXTPNwb9Y2UThb7cTASfywGk",
            authDomain: "rede-promessa.firebaseapp.com",
            projectId: "rede-promessa",
            storageBucket: "rede-promessa.appspot.com",
            messagingSenderId: "964670440605",
            appId: "1:964670440605:web:ea3fdc22f0a44fb8788074"));
  } else {
    await Firebase.initializeApp();
  }
}
