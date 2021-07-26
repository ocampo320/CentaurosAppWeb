

import 'package:centauros_app/app/settings/application.dart';
import 'package:centauros_app/data_source/api/user_api_source.dart';
import 'package:centauros_app/utils/my_connectivity.dart';
import 'package:centauros_app/utils/my_connectivity_impl.dart';
import 'package:data/user_repository.dart';

class DataSourceInjector {
  static DataSourceInjector? _singleton;
  MyConnectivity? _myConnectivity;

  factory DataSourceInjector() {
    if (_singleton == null) {
      _singleton = DataSourceInjector._();
    }
    return _singleton!;
  }

  DataSourceInjector._() {
    _myConnectivity = MyConnectivityImpl();
  }

  

  UserApiSourcer providePurchaseOrderApiSource() {
    return UserApiSourceImpl(
      Application().appSettings?.apiUrl,
      _myConnectivity,
      token: Application().token,
    );
  }

 
}
