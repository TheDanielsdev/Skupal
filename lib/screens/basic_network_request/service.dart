import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:skupal/screens/basic_network_request/mode.dart';

Future<List<GetUsers>> getUsers() async {
  String url = 'http://jsonplaceholder.typicode.com/users';

  final res = await http
      .get(Uri.parse(url), headers: {"Content-type": "application/json"});
  List jsonResponse = json.decode(res.body);

  return jsonResponse.map((e) => new GetUsers.fromJson(e)).toList();
}
