import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDyPpojK1y_4VUWClU_WEtEHnR9WxsuVGU",
            authDomain: "rescue-pets-308102.firebaseapp.com",
            projectId: "rescue-pets-308102",
            storageBucket: "rescue-pets-308102.appspot.com",
            messagingSenderId: "209326240548",
            appId: "1:209326240548:web:71972381a6ca8850b979b1"));
  } else {
    await Firebase.initializeApp();
  }
}
