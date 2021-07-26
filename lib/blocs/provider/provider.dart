import 'bloc.dart';
import 'bloc_cache.dart';

class Provider {
  static Bloc? of<T extends Bloc>(T Function() instance) {
    return BlocCache.getBlocInstance(T.toString(), instance);
  }

  static void dispose<T extends Bloc>() {
    BlocCache.dispose(T.toString());
  }
}