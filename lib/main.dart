import 'package:ecommerce_app/firebase_options.dart';
import 'package:ecommerce_app/pages/home.dart';
import 'package:ecommerce_app/pages/login.dart';
import 'package:ecommerce_app/pages/register.dart';
import 'package:ecommerce_app/provider/cart.dart';
import 'package:ecommerce_app/test/test_home.dart';
import 'package:ecommerce_app/test/test_login.dart';
import 'package:ecommerce_app/test/test_provider/test_cart.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const EcommerceApp());
}

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) {
            return Cart();
          },
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) {
            return TestCart();
          },
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Ecommerce App',
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Home();
              } else {
                return Login();
              }
            }),
      ),
    );
  }
}
