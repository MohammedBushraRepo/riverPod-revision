import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
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
        child: Consumer(
          builder: (context, ref, child) => Container(
            child: Text(
              ref.watch(nameProvider).toString(),
              style: TextStyle(fontSize: 50),
            ),
          ),
        ),
      ),
      floatingActionButton: Consumer(
        builder: (context, ref, child) => FloatingActionButton(onPressed: () {
          ref.watch(nameProvider.notifier).state++;
        }),
      ),
    );
  }
}
