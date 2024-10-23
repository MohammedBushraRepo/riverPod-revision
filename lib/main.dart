import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_revision/second_screen.dart';

void main() {
   WidgetsFlutterBinding.ensureInitialized();
     Firebase.initializeApp();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'river_pod',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeView(),
    );
  }
}

final nameProvider = StateProvider<int>((ref) => 0);

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final name = watch.watch(nameProvider);

    return Scaffold(
      body: Center(
        child: Container(),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SecondScreen()));
      }),
    );
  }
}
