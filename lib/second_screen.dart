import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_revision/user_model.dart';

CollectionReference userData = FirebaseFirestore.instance
    .collection('userData'); //from your firstore data base collection name

// final getUserData = FutureProvider<QuerySnapshot>((ref) => userData
//     .get()); //use FutureProvide.autoDisopse if you dont need to save the data in the Mobile cash

//creating StreamProvider
// final getUserDataStram = StreamProvider<String>((ref) => Stream.periodic(
//       Duration(milliseconds: 100),
//       (value) => '$value',
//     ));
// to get Stram from firsbase
final getUserDataStram =
    StreamProvider<QuerySnapshot>((ref) => userData.snapshots());

class SecondScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Container(
        child: Center(
          child: _getUserDataStream(ref),
        ),
      ),
    );
  }

  //this function willl return widget of data column
  Widget _getUserDataStream(WidgetRef ref) {
    final stream = ref.watch(getUserDataStram);
    return stream.when(
      data: (QuerySnapshot value) {
        // Check if the document list is not empty
        if (value.docs.isNotEmpty) {
          // Ensure the data is correctly accessed from the first document
          Map<String, dynamic>? data =
              value.docs[0].data() as Map<String, dynamic>?;

          if (data != null) {
            UserModel userData = UserModel.fromMap(data);
            // Continue with your logic
            print(userData.toMap());
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(userData.name.toString()),
                Text(userData.email.toString())
              ],
            );
          }
        }
        return Text('No Data Found');
      },
      error: (value, stack) => Text('Error'),
      loading: () {
        return CircularProgressIndicator();
      },
    );
  }

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
