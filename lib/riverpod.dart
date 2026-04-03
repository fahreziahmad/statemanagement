import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//PROVIDER
final namaProvider = StateProvider<String>((ref) => "");
final emailProvider = StateProvider<String>((ref) => "");

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FormPage(),
    );
  }
}
