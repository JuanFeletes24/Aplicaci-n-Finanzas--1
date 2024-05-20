import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happybills_branch_juanrojas/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:happybills_branch_juanrojas/screen/auth/welcome_screen.dart';

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
                outline: Colors.grey)),
        home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
          if (state.status == AuthenticationStatus.authenticated) {
            return const HomeScreen();
          } else {
            return const WelcomeScreen();
          }
        }));
  }
}
