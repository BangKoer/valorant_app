import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:valorant_app/firebase_options.dart';
import 'package:valorant_app/pages/home.dart';
import 'package:valorant_app/pages/login.dart';
import 'package:valorant_app/pages/register.dart';
import 'package:valorant_app/services/firebase_authController.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final authController = FirebaseAuthController();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: authController.authStatus,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            return MaterialApp(
              title: 'Flutter Demo',
              home: snapshot.data != null ? Home() : LoginPage(),
            );
          }
          return Loading();
        });
  }
}

class Loading extends StatelessWidget {
  const Loading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
