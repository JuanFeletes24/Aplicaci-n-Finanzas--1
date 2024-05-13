import 'package:flutter/material.dart';

import 'screen/views/home_screen.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Happy Bills",
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          background: Colors.white,
          onBackground: Colors.black,
          primary: Colors.blue,
          secondary: Color.fromARGB(255, 89, 135, 214),
          tertiary: Colors.blueGrey,
          outline: Colors.grey
        )
      ),
      home: HomeScreen(),
    );
  }
}