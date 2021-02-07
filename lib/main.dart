import 'package:chatApp/screens/chat_screen.dart';
import 'package:chatApp/screens/login_screen.dart';
import 'package:chatApp/screens/registration_screen.dart';
import 'package:chatApp/screens/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
   runApp(ChatApp());
}

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          // ignore: deprecated_member_use
          body1: TextStyle(color: Colors.black54),
        ),
      ),
     initialRoute: WelcomeScreen.id,
     routes: {
       WelcomeScreen.id: (context) => WelcomeScreen(),
       LoginScreen.id: (context) => LoginScreen(),
       RegistrationScreen.id: (context) => RegistrationScreen(),
       ChatScreen.id: (context) => ChatScreen(),
     },
    );
  }
}