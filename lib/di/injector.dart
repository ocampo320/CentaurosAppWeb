import 'package:centauros_app/di/repository_injector.dart';
import 'package:domain/users_use_case.dart';

class Injector {
  static Injector? _singleton;

  factory Injector() {
    if (_singleton == null) {
      _singleton = Injector._();
    }
    return _singleton!;
  }

  Injector._();


  UserUseCase providePurchaseOrderUseCase() {
    return UserUseCaseAdapter(
      RepositoryInjector().providePurchaseOrderRepository(),
    );
  }

 
}
