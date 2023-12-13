import 'package:camera/camera.dart';
import 'package:chat_app/Newscreen/Landing_screen.dart';
import 'package:chat_app/screens/Homescreen.dart';
import 'package:chat_app/screens/camera_screen.dart';
import 'package:chat_app/screens/login_screen.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();

  runApp(myapp());
}

class myapp extends StatelessWidget {
  const myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "OpenSans",
        primarySwatch: Colors.teal,
        // scaffoldBackgroundColor: Color.fromARGB(255, 228, 241, 239),
      ),

      // darkTheme: ThemeData(brightness: Brightness.dark),
      home: LandingScreen(),
    );
  }
}
