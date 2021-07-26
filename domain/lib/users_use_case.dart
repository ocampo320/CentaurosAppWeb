import 'package:models/result.dart';
import 'package:models/user.dart';
mixin UserRepository {
  Future<Result<List<User>>> getUserList();
}
mixin UserUseCase {
  Future<Result<List<User>>> getUserList();
}

class UserUseCaseAdapter implements UserUseCase {
  final UserRepository userRepository;

  UserUseCaseAdapter(this.userRepository);

  @override
  Future<Result<List<User>>> getUserList() {
    return userRepository.getUserList();
  }
}
