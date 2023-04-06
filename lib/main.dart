import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:firebase_core/firebase_core.dart';
import 'pages/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyD707jLmgUIYauJEBJzldJ3TqxDtisE8oI",
        appId: "1:594222768920:android:2f2943a9dd269cf734f46d",
        messagingSenderId: "594222768920",
        projectId:"chargeplug-9e01c",
    )
  );
  runApp(LoginUiApp());
}

class LoginUiApp extends StatelessWidget {

  final Color _primaryColor = HexColor('#301c80');
  final Color _accentColor = HexColor('#cf88f2');

  LoginUiApp({Key? key}) : super(key: key);

  // Design color
  // Color _primaryColor= HexColor('#FFC867');
  // Color _accentColor= HexColor('#FF3CBD');

  // Our Logo Color
  // Color _primaryColor= HexColor('#D44CF6');
  // Color _accentColor= HexColor('#5E18C8');

  // Our Logo Blue Color
  //Color _primaryColor= HexColor('#651BD2');
  //Color _accentColor= HexColor('#320181');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ChargePlug',
      theme: ThemeData(
        primaryColor: _primaryColor,
        secondaryHeaderColor: _accentColor,
        scaffoldBackgroundColor: Colors.grey.shade100,
        primarySwatch: Colors.purple,
      ),
      home: const SplashScreen(title: 'ChargePlug-Application'),
    );
  }
}


