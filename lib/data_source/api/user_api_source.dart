import 'dart:convert';

import 'package:centauros_app/utils/my_connectivity.dart';
import 'package:data/user_repository.dart';
import 'package:models/result.dart';
import 'package:models/user.dart';
import 'package:http/http.dart' as http;
import 'api_base_source.dart';

class UserApiSourceImpl extends ApiBaseSource implements UserApiSourcer {
  UserApiSourceImpl(
    String? baseUrl,
    MyConnectivity? connectivity, {
    http.Client? client,
    String? token,
  }) : super(
          baseUrl,
          client ?? http.Client(),
          connectivity,
          token,
        );

  @override
  Future<Result<List<User>>> getUser() async {
    var url = 'https://centauros.herokuapp.com/centauro/user/users';
    return await get<List<User>>(
      url,
      (value) {
        print('respuesta del api heroku ${value.toString()}');
        return (value as List).map((value) {
          return User.fromJson(
            value,
          );
        }).toList();
      },
    );
  }

  @override
  Future<Result<User>> getUserByCc(String cc) {
    var url = 'https://centauros.herokuapp.com/centauro/user/id/$cc';
    return get<User>(url, (value) {
      print("Datos de usuario $value");
      return User.fromJson(value);
    });
  }

  @override
  Future<Result<User>> addUser(User user) {
    var url = 'https://centauros.herokuapp.com/centauro/user/add';
    return post<User>(url, 
    user.toJson(),
    (value) {
      var response=User();
      print("Se guardo el usuario ${user.toJson()}");
      return response;
    });
    
  }
}
