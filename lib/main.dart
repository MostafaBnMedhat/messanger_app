import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:randomusers/providers/profile_provider.dart';
import 'package:randomusers/providers/user_provider.dart';
import 'package:randomusers/screens/user_home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => ProfileProvider()),
      ],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: UserHome(),
        ),
    );
  }
}

