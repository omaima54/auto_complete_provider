
import 'package:auto_complete_provider/models/user_models.dart';
import 'package:http/http.dart';

class UsersApi{

  final Client _client = Client();

  Future<List<Users>> fetchusers() async {
    var uri = Uri.parse("https://jsonplaceholder.typicode.com/users");
    Response response= await _client.get(uri);

    if(response.statusCode==200){
      print('goood');
      return  usersFromJson(response.body);

    }
    print('not goood');

    return List.empty();

  }
 

  }
 








