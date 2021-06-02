import 'dart:convert';

import 'package:flutte_things_todo/models/user_list.dart';
import 'package:http/http.dart';

class ApiService {
  final String apiUrl = 'https://6087dddba64a30017425143.mockapi.io/api/todos';

  Future<List<UserList>> getUserList() async {
    Response res = await get(Uri.parse(apiUrl));
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<UserList> userList =
          body.map((dynamic item) => UserList.fromJson(item)).toList();
      return userList;
    } else {
      throw "Faild to Load USER list";
    }
  }

  Future<UserList> getUserListById(String id) async {
    Response res = await get(Uri.parse('$apiUrl/$id'));

    if (res.statusCode == 200) {
      return UserList.fromJson(json.decode(res.body));
    } else {
      throw Exception('Failed to load a Userlist');
    }
  }

  Future<UserList> createUserList(UserList userList) async {
    Map data = {
      'title': userList.title,
      'description': userList.description,
      'category': userList.category,
      'timestamp': userList.timestamp,
      'priority': userList.priority,
      'user_id': userList.id,
      'isCompleted': userList.isCompleted
    };

    final Response response =
        await post(Uri.parse(apiUrl), body: jsonEncode(data));
    if (response.statusCode == 200) {
      return UserList.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to post Userlist');
    }
  }

  Future<UserList> updateUserList(String id, UserList userList) async {
    Map data = {
      'title': userList.title,
      'description': userList.description,
      'category': userList.category,
      'timestamp': userList.timestamp,
      'priority': userList.priority,
      'user_id': userList.id,
      'isCompleted': userList.isCompleted
    };

    final Response response =
        await put(Uri.parse('$apiUrl/$id'), body: jsonEncode(data));
    if (response.statusCode == 200) {
      return UserList.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to Update UserList');
    }
  }

  Future<UserList> deleteUserList(String id) async {
    Response res = await delete(Uri.parse('$apiUrl/$id'));
    if (res.statusCode == 200) {
      print('UserList deleted ');
    } else {
      throw 'Failed to Deleted a UserList';
    }
  }
}
