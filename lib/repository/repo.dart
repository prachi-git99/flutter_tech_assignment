import 'dart:convert';
import 'package:flutter_tech_assignment/utilities/urls.dart';
import 'package:http/http.dart';
import '../model/user_model.dart';

class UserRepository {
  String userUrl = ApiUrl.getContactList;

  Future<List<UserModel>> getUsers() async {
    Response response = await get(Uri.parse(userUrl));

    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['data'];
      return result.map((e) => UserModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
