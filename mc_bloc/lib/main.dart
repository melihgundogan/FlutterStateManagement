import 'package:flutter/material.dart';
import 'package:mc_bloc/view/home_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'view/users_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const UserView(),
    );
  }
}


