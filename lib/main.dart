import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:happybills_branch_juanrojas/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:happybills_branch_juanrojas/simple_bloc_observer.dart';
import 'package:user_repository/user_repository.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = SimpleBlocObserver();
  runApp(MyApp(FirebaseUserRepo()));
}
