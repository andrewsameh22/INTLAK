import 'package:flutter/material.dart';
import 'package:task/presentation/screens/1.dart';
import 'package:task/presentation/screens/12_1st%20law%20of%20motion.dart';
import 'package:task/presentation/screens/12_chapter.dart';
import 'package:task/presentation/screens/45_choose_level.dart';
import 'package:task/presentation/screens/AndroidLarg-32.dart';

import 'presentation/on_boarding/on_boarding_screen.dart';
import 'presentation/screens/3_personal_infotmation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Chapter()
        // home: ScreenAndroidLarg32()
//             registrationButton(
//             text: 'Sign up with Facebook',
//             context: context,
// imagePath: 'assets/images/Facebook F.png',
//             onTap: () {},
//           ),

        );
  }
}
