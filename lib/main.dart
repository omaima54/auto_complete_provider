
import 'package:auto_complete_provider/adress_screen.dart';
import 'package:auto_complete_provider/provider/user_prov.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create:(context)=> UsersProvider(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AdressScreen(),
      ),
    );
  }
}
