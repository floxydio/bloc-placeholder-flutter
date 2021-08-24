import 'package:blocApi/Models/User_models.dart';
import 'package:dio/dio.dart';

class ApiService {
  var dio = Dio();

  Future<List<UserModel>> getUser() async {
    try {
      var response =
          await dio.get("https://jsonplaceholder.typicode.com/users");
      print(response.data);

      if (response.statusCode == 200) {
        var resbody = response.data as List;
        var getdataUser = resbody.map((e) => UserModel.fromJson(e)).toList();
        return getdataUser;
      }
    } catch (e) {
      throw Exception("Error di $e");
    }
  }
}
