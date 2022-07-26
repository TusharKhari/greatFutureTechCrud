import 'dart:convert';

import 'package:http/http.dart' as http;

class CrudServices {
  var createDataStatus;
  Future<void> createData(String title, String body, String userId) async {
    try {
      http.Response res = await http.post(
          Uri.parse("https://jsonplaceholder.typicode.com/posts"),
          body: jsonEncode({
            "title": title,
            "body": body,
            "userId": userId,
          }));
      createDataStatus = res.statusCode.toString();
      //  print('res  ' + res.statusCode.toString());

    } catch (e) {
      //  print(e);
    }
  }

  var putDataStatus;
  Future<void> putData(
    String title,
    String body,
    String id,
  ) async {
    try {
      http.Response res = await http.put(
          Uri.parse("https://jsonplaceholder.typicode.com/posts/$id"),
          body: jsonEncode({
            "title": title,
            "body": body,
          }));
      // print('res  ' + res.statusCode.toString());
      putDataStatus = res.statusCode.toString();
    } catch (e) {
      //  print(e);
    }
  }

  var deleteDataStatus;
  Future<void> deleteDate(String id) async {
    try {
      http.Response res = await http.delete(
        Uri.parse("https://jsonplaceholder.typicode.com/posts/$id"),
      );
      // print('res  ' + res.statusCode.toString());
      deleteDataStatus = res.statusCode.toString();
    } catch (e) {
      // print(e);
    }
  }

  var data;
  Future<void> getData() async {
    final res =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if (res.statusCode == 200) {
      data = jsonDecode(res.body.toString());
      // print(data);
      // print(res.statusCode);
    }
  }
}
