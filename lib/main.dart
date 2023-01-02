import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:student_manager/responsive_handler.dart';
import 'package:url_strategy/url_strategy.dart';

// This part here connects the web app to the Firestore database.

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    setPathUrlStrategy();
    await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyAOPiXnDsFd7x89JmYUh1P80hF3kBbUcrg",
          authDomain: "tkdattendance-10957.firebaseapp.com",
          projectId: "tkdattendance-10957",
          storageBucket: "tkdattendance-10957.appspot.com",
          messagingSenderId: "928716689677",
          appId: "1:928716689677:web:3b21aa8e711c89e64ca044",
          measurementId: "G-51KV0NVG2S"),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  static const primaryColour = Color(0xFF003566);
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Taeguek Taekwondo Student Manager',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: responsiveHandler(),
    );
  }
}
