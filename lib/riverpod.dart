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
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    //SnackBar(content: Text("$nama - $email")),
                    content: Text("Submit sukses !"),
                  ),
                );
              },
              child: Text("Submit"),
            ),
            SizedBox(height: 10),
            Text("Nama: $nama"),
            Text("Email: $email"),
          ],
        ),
      ),
    );
  }
}