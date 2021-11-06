import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:welcome/constants/constants.dart';
import 'package:welcome/models/halls.dart';

class HallProvider {
  Future<HallList> getHall() async {
    final response = await http.get(Uri.parse(Constants.apiUrl + 'halls'));
    if(response.statusCode == 200){
      return HallList.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Server not connected');
    }
  }
}
