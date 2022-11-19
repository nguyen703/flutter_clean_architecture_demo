import 'package:advicer/0_data/datasources/advice_remote_datasource.dart';
import 'package:advicer/0_data/repositories/advice_repo_impl.dart';
import 'package:advicer/1_domain/repositories/advice_repo.dart';
import 'package:advicer/1_domain/usecases/advice_usecases.dart';
import 'package:advicer/2_application/pages/advice/bloc/advice_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

/// Service locator
final sl = GetIt.I;

Future<void> init() async {
  // Application layer
  sl.registerFactory(() => AdviceBloc(adviceUseCases: sl()));

  // Domain layer
  sl.registerFactory(() => AdviceUseCases(adviceRepo: sl()));

  // Data layer
  sl.registerFactory<AdviceRepo>(
      () => AdviceRepoImpl(adviceRemoteDatasource: sl()));
  sl.registerFactory<AdviceRemoteDatasource>(
      () => AdviceRemoteDatasourceImpl(client: sl()));

  // Externals
  sl.registerFactory(() => http.Client());
}
