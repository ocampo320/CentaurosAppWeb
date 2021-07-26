import 'package:data/user_repository.dart';
import 'package:domain/users_use_case.dart';

import 'data_source_injector.dart';

class RepositoryInjector {
  static RepositoryInjector? _singleton;

  factory RepositoryInjector() {
    if (_singleton == null) {
      _singleton = RepositoryInjector._();
    }
    return _singleton!;
  }

  RepositoryInjector._();


  UserRepository providePurchaseOrderRepository() {
    return UserRepositoryAdatter(
      DataSourceInjector().providePurchaseOrderApiSource(),
    );
  }


}
