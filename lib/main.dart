import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskk/auth/auth_service.dart';
import 'package:taskk/screens/splashScreen.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyCLcjAtmcDlkPBbVCCK7JfVm7t3mVw8W0o",
      authDomain: "task-app-99ee0.firebaseapp.com",
      projectId: "task-app-99ee0",
      storageBucket: "task-app-99ee0.appspot.com",
      messagingSenderId: "911976925555",
      appId: "1:911976925555:android:7055ddbea87a2fe344dd06",
    ),
  );
  runApp(
    ChangeNotifierProvider(
      create: (context) => AuthService(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Splash(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
