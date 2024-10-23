import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dataProvider = FutureProvider((ref) => fetchData());

Future<String> fetchData() async {
  await Future.delayed(Duration(seconds: 5));
  return 'Mohamed Bushra AL Makkana';
}

class SecondScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(dataProvider);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          child: data.when(
            data: (String value) => Text(value),
            error: (error, stack) => const Text('Error'),
            loading: () => const CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
