
import 'package:auto_complete_provider/provider/user_prov.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';




class Repository{
  Future<void> fetchUsers(BuildContext context)async{
    UsersProvider usersProvider =Provider.of(context,listen:false);
    await usersProvider.fetchUser();
  }
  

}