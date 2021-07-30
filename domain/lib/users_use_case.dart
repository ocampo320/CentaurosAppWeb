import 'package:models/result.dart';
import 'package:models/user.dart';

mixin UserRepository {
  Future<Result<List<User>>> getUserList();
  Future<Result<User>> getUserByCc(String cc);
  Future<Result<User>> addUser(User user);
  Future<Result<User>> deleteUser(String userIde);
}
mixin UserUseCase {
  Future<Result<List<User>>> getUserList();
  Future<Result<User>> getUserByCc(String cc);
  Future<Result<User>> addUser(User user);
 Future<Result<User>>  deleteUser(String userIde);


}

class UserUseCaseAdapter implements UserUseCase {
  final UserRepository userRepository;

  UserUseCaseAdapter(this.userRepository);

  @override
  Future<Result<List<User>>> getUserList() {
    return userRepository.getUserList();
  }

  @override
  Future<Result<User>> getUserByCc(String cc) {
    return userRepository.getUserByCc(cc);
  }

  @override
  Future<Result<User>> addUser(User user) {
    return userRepository.addUser(user);
  }

  @override
   Future<Result<User>>  deleteUser(String userIde) {
    return userRepository.deleteUser(userIde);
  }
}
