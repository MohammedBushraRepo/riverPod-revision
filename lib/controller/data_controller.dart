import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_revision/model/data_model.dart';

final getDataFuture =
    ChangeNotifierProvider<GetDataFromApi>((ref) => GetDataFromApi());

class GetDataFromApi extends ChangeNotifier {
  GetDataFromApi() {
    //call getData in the first instance
    getData();
  }

  List<DataModel> listDataModel = [];

  Future getData() async {
    listDataModel = [];
    try {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

      //print(response.body);
      var data = jsonDecode(response.body);
      for (int i = 0; i < data.length; i++) {
        listDataModel.add(DataModel.fromMap(data[i]));
      }
    } catch (e) {
      print(e.toString());
    }

    notifyListeners();
  }
}
