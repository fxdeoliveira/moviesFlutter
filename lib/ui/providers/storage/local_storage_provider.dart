import 'package:cinemapedia/data-access/repositories/local_storage_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data-access/services/local_db.dart';

final localStorageProvider = Provider((ref) {
  return LocalStorageRepositoryImpl(LocalDB());
});


