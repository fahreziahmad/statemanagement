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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FormPage(),
    );
  }
}

//UI
class FormPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nama = ref.watch(namaProvider);
    final email = ref.watch(emailProvider);

    return Scaffold(
      appBar: AppBar(title: Text("Form Riverpod")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: "Nama"),
              onChanged: (value) =>
                  ref.read(namaProvider.notifier).state = value,
            ),
            TextField(
              decoration: InputDecoration(labelText: "Email"),
              onChanged: (value) =>
                  ref.read(emailProvider.notifier).state = value,
            ),
           