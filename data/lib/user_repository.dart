import 'package:domain/users_use_case.dart';
import 'package:models/user.dart';
import 'package:models/result.dart';

mixin UserApiSourcer {
  Future<Result<List<User>>> getUser ();
  Future<Result<User>> getUserByCc (String cc);
  Future<Result<User>> addUser(User user);

  Future<Result<User>>  deleteUser(String userIde);
}
 
class UserRepositoryAdatter implements UserRepository{

  final UserApiSourcer? userApiSourcer;

  UserRepositoryAdatter(this.userApiSourcer);

  @override
  Future<Result<List<User>>> getUserList() {
    return userApiSourcer!.getUser();
  }

  @override
  Future<Result<User>> getUserByCc(String cc) {
    return userApiSourcer!.getUserByCc(cc);
  }

  @override
  Future<Result<User>> addUser(User user) {
    return userApiSourcer!.addUser(user);
  }

  @override
  Future<Result<User>>  deleteUser(String userIde) {
   return userApiSourcer!.deleteUser(userIde);
  }

 

  

}