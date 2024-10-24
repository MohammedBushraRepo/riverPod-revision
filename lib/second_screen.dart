import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_revision/user_model.dart';

final cityProvider = StateProvider<String?>((ref) => 'Canada');

final weatherProvider = StateProvider<String>((ref) {
  final city = ref.watch(cityProvider.notifier);
  return city.state == 'Canada'
      ? '24'
      : city.state == 'Sudan'
          ? '50'
          : city.state == 'Qatar'
              ? '30'
              : 'null';
});

class SecondScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final city = ref.watch(cityProvider.notifier);
    final weather = ref.watch(weatherProvider.notifier);

    return Scaffold(
      body: Container(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton(
                value: city.state,
                items: [
                  DropdownMenuItem(
                    child: Text('Canada'),
                    value: 'Canada',
                  ),
                  DropdownMenuItem(
                    child: Text('Sudan'),
                    value: 'Sudan',
                  ),
                  DropdownMenuItem(
                    child: Text('Qatar'),
                    value: 'Qatar',
                  ),
                ],
                onChanged: (value) {
                  if (value != null) {
                    ref.read(cityProvider.notifier).state = value;
                  }
                }),
            Text(
              weather.state,
              style: TextStyle(fontSize: 40, color: Colors.amber),
            ),
          ],
        )),
      ),
    );
  }

  // //this function willl return widget of data column
  // Widget _getUserDataStream(WidgetRef ref) {
  //   final stream = ref.watch(getUserDataStram);
  //   return stream.when(
  //     data: (QuerySnapshot value) {
  //       // Check if the document list is not empty
  //       if (value.docs.isNotEmpty) {
  //         // Ensure the data is correctly accessed from the first document
  //         Map<String, dynamic>? data =
  //             value.docs[0].data() as Map<String, dynamic>?;

  //         if (data != null) {
  //           UserModel userData = UserModel.fromMap(data);
  //           // Continue with your logic
  //           print(userData.toMap());
  //           return Column(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: [
  //               Text(userData.name.toString()),
  //               Text(userData.email.toString())
  //             ],
  //           );
  //         }
  //       }
  //       return Text('No Data Found');
  //     },
  //     error: (value, stack) => Text('Error'),
  //     loading: () {
  //       return CircularProgressIndicator();
  //     },
  //   );
  // }

//  Widget _buildUserData(WidgetRef ref) {
//     final future = ref.watch(getUserData);
//     return future.when(
//         data: (QuerySnapshot value) {
//           return Text(value.docs[0].data()['email']);
//         },
//         error: (value, stack) => Text('error'),
//         loading: () {
//           return CircularProgressIndicator();
//         });
//   }
}
