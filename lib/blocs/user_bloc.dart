import 'dart:math';

import 'package:centauros_app/blocs/provider/bloc.dart';
import 'package:centauros_app/data_source/api/user_api_source.dart';
import 'package:domain/users_use_case.dart';

import 'package:models/user.dart';
import 'package:models/result.dart';
import 'package:rxdart/rxdart.dart';

class UserBloc with Bloc {
  final UserUseCase _userUseCase;
  UserApiSourceImpl? apiSourceImpl;

  User? userSingleton;

  final _userListSubject = BehaviorSubject<List<User>>();
  final _userSubject = BehaviorSubject<User>();

  ValueStream<List<User>> get listUserData => _userListSubject.stream;
  ValueStream<User> get userData => _userSubject.stream;

  Sink<User> get userSink => _userSubject.sink;

  UserBloc(this._userUseCase) {
    userSingleton=User();
    isDataUser = false;
  }

  bool isDataUser = false;

  Future<Result<List<User>>> getUser() async {


    var result = _userUseCase.getUserList();
    result.then((value) {
      _userListSubject.value = value.data!;
    });

    return result;
  }

  Future<Result<User>> getUserByCc(String id) {
    var result = _userUseCase.getUserByCc(id);
    result.then((value) {
      _userSubject.value = value.data!;
      isDataUser=true;
    });
    return result;
  }




  Future<Result<User>> mapToUser(User? user) {
        var rng = new Random();
        userSingleton!.idClient=rng.nextInt(1);
    var result= _userUseCase.addUser(user!);
    result.then((value) {
     if(value.status==Status.success){
       print("Se guardo completo ${value.data!.toJson()}");
     }else{
       print("No Se guardo $result");

     }

    });
    return result;
    
  }

  @override
  void dispouse() {
    _userListSubject.close();
    _userSubject.close();
  }
}
