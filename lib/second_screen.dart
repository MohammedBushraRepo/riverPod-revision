import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final dataProvider = FutureProvider((ref) => fetchData()); //use FutureProvide.autoDisopse if you dont need to save the data in the Mobile cash  

Future<String> fetchData() async {
  // await Future.delayed(Duration(seconds: 5));
  String url = 'https://jsonplaceholder.typicode.com/posts';
  // Convert the String to a Uri
  Uri uri = Uri.parse(url);

  // Now use the Uri in the request
  var response = await http.get(uri);
  //decode the json data
  var data = await jsonDecode(response.body);

  //print(data[0]['body']);
  return data[0]['body'];
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
