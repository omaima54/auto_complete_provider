
import 'package:auto_complete_provider/models/user_models.dart';
import 'package:auto_complete_provider/services/user_api.dart';
import 'package:flutter/cupertino.dart';


class UsersProvider with ChangeNotifier {
  List<Users> _usersModel =<Users>[];
  final UsersApi _usersApi = UsersApi();
  List<Users> get user => _usersModel;
  set user(List<Users> userList) {
    _usersModel = userList;
    notifyListeners();
  }

  Future<List<Users>> fetchUser() async {
    return user = await _usersApi.fetchusers();
  }
}




