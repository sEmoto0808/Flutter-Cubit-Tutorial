import 'dart:convert';

import 'package:cubit_tutorial/model/data_model.dart';
import 'package:http/http.dart' as http;

class DataServices {
  final baseUrl = 'http://mark.bslmeiyu.com/api';

  Future<List<DataModel>> getInfo() async {
    const apiUrl = '/getplaces';

    try {
      http.Response res = await http.get(Uri.parse(baseUrl + apiUrl));

      if (res.statusCode == 200) {
        List<dynamic> list = json.decode(res.body);
        return list.map((e) => DataModel.fromJson(e)).toList(growable: false);
      }
      return <DataModel>[];
    } catch (e) {
      print(e);
      return <DataModel>[];
    }
  }
}
