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

final nameProvider = Provider<String>((ref) => 'Mohamed');

class HomeView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef watch) {
    final name = watch.watch(nameProvider);

    return Scaffold(
      body: Center(
        child: Container(
          child: Text(name),
        ),
      ),
    );
  }
}
