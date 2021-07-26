import 'package:domain/users_use_case.dart';
import 'package:models/user.dart';
import 'package:models/result.dart';

mixin UserApiSourcer {
  Future<Result<List<User>>> getUser ();
}
 
class UserRepositoryAdatter implements UserRepository{

  final UserApiSourcer? userApiSourcer;

  UserRepositoryAdatter(this.userApiSourcer);

  @override
  Future<Result<List<User>>> getUserList() {
    return userApiSourcer!.getUser();
  }

  

}