import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_revision/user_model.dart';

CollectionReference userData = FirebaseFirestore.instance
    .collection('userData'); //from your firstore data base collection name

final getUserData = FutureProvider<QuerySnapshot>((ref) => userData
    .get()); //use FutureProvide.autoDisopse if you dont need to save the data in the Mobile cash

class SecondScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Container(
        child: Center(
          child: _buildUserData(ref),
        ),
      ),
    );
  }

  //this function willl return widget of data column
  Widget _buildUserData(WidgetRef ref) {
    final future = ref.watch(getUserData);
    return future.when(
      data: (QuerySnapshot value) {
        // Check if the document list is not empty
        if (value.docs.isNotEmpty) {
          // Safely cast the data to a Map<String, dynamic> and check for null
          final userData = value.docs[0].data() as Map<String, dynamic>?;

          if (userData != null) {
            // Create the UserModel from the map
            UserModel userModel = UserModel.fromMap(userData);
            // Do something with the userModel, such as returning a widget
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('User: ${userModel.name}'),
                Text('Email: ${userModel.email}'),
              ],
            );
          }
        }
        // Fallback if no documents are found or data is null
        return Text('No user data found');
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
