import 'dart:convert';

import 'package:apiapp/model/user_model.dart';
import 'package:http/http.dart' as http;

class APiGet {
  List<Datum> getUser = [];
  Future<List<Datum>> getData() async {
    final response =
        await http.get(Uri.parse('https://reqres.in/api/users?page=2'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      List dataMain = data['data'];

      getUser = dataMain.map((e) => Datum.fromJson(e)).toList();
    }
    return getUser;
  }
}
