import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:partiu_app/Screens/Login_screen.dart';
import 'package:partiu_app/Screens/cadastro_screen.dart';
import 'package:partiu_app/Utils/Colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBtGpdR2oxb9vTOjhh03pJ3725MWUr8s_4",
            appId: "1:350280010111:web:c35e610e57c6036a3e724a",
            messagingSenderId: "350280010111",
            projectId: "partiu-fe924",
            storageBucket: "partiu-fe924.appspot.com"));
  } else {
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: '#PARTIU',
        theme:
            ThemeData.dark().copyWith(scaffoldBackgroundColor: mobileBackgroundColor),
        // home: const ResponsiveLayout(
        //   mobileScreenLayout: MobileScreenLayout(),
        //   webScreenLayout: WebScreenLayout(),
        // )
        home: const LoginScreen(),
        );
  }
}
