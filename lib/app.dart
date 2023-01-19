import 'package:flutter/material.dart';
import 'package:serv5_task/view/screens/log_in_screen.dart';

class AlbumsApp extends StatelessWidget {
  const AlbumsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Albums',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const LogInScreen(),
    );
  }
}
