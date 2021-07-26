
import 'dart:collection';

import 'bloc.dart';

class BlocCache {
  HashMap<String, Bloc> blocs = HashMap<String, Bloc>();

  static final BlocCache _cache = BlocCache._internal();

  factory BlocCache() {
    return _cache;
  }

  BlocCache._internal();

  static Bloc getBlocInstance(String blocKey, Function instance) {
    var bloc = BlocCache._cache.blocs[blocKey];

    if (bloc != null) {
      return bloc;
    }

    bloc = instance();
    BlocCache._cache.blocs[blocKey] = bloc!;

    return bloc;
  }

  static void dispose(String blocKey) async {
    BlocCache._cache.blocs[blocKey]?.dispouse();

    BlocCache._cache.blocs.removeWhere((key, bloc) => blocKey == key);
  }
}
