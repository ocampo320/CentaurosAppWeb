import 'package:centauros_app/blocs/provider/bloc.dart';
import 'package:centauros_app/data_source/api/user_api_source.dart';
import 'package:domain/users_use_case.dart';
import 'package:models/user.dart';
import 'package:models/result.dart';
import 'package:rxdart/rxdart.dart';

class UserBloc with Bloc {
  final UserUseCase _userUseCase;
  UserApiSourceImpl? apiSourceImpl;

  final _userSubject = BehaviorSubject<List<User>>();

  ValueStream<List<User>> get profile => _userSubject.stream;

  UserBloc(this._userUseCase);

  Future<Result<List<User>>> getUser() {
    var result = _userUseCase.getUserList();
    result.then((value) {
      _userSubject.value = value.data!;
    });

    return result;
  }

  @override
  void dispouse() {
    _userSubject.close();
  }
}
