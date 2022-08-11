import 'package:get_it/get_it.dart';
import 'package:prueba_leal/domain/model/port/in/login/login_use_case_port.dart';
import 'package:prueba_leal/domain/model/port/in/movies/movie_use_case_port.dart';
import 'package:prueba_leal/domain/model/port/out/login/login_repository_port.dart';
import 'package:prueba_leal/domain/model/port/out/movies/movie_repository_port.dart';
import 'package:prueba_leal/domain/use_case/login/login_use_case.dart';
import 'package:prueba_leal/domain/use_case/movies/movie_use_case.dart';
import 'package:prueba_leal/infrastructure/data/datasource/http_client.dart';
import 'package:prueba_leal/infrastructure/data/datasource/login/login_datasource.dart';
import 'package:prueba_leal/infrastructure/data/datasource/movies/rest_movie_datasource.dart';
import 'package:prueba_leal/infrastructure/data/datasource_port/login/login_datasource_port.dart';
import 'package:prueba_leal/infrastructure/data/datasource_port/movies/rest_movie_datasource_port.dart';
import 'package:prueba_leal/infrastructure/respository/login/login_repository.dart';
import 'package:prueba_leal/infrastructure/respository/movies/movie_repository.dart';
import 'package:prueba_leal/presentation/login/cubit/login_cubit.dart';
import 'package:prueba_leal/presentation/movies/home/cubit/home_cubit.dart';
import 'package:prueba_leal/presentation/movies/home/home_page.dart';

import '../presentation/login/login_page.dart';

final sl = GetIt.I;

void setupInjectionDependency() {
  ////////// Pages /////////////
  sl.registerFactory(() => HomePage(sl()));
  sl.registerFactory(() => LoginPage(sl()));

  ////////// Cubits /////////////
  sl.registerFactory<HomeCubit>(() => HomeCubit(sl()));
  sl.registerFactory<LoginCubit>(() => LoginCubit(sl()));

  ///////// Use cases //////////

  sl.registerLazySingleton<MovieUseCasePort>(() => MovieUseCase(sl()));
  sl.registerLazySingleton<LoginUseCasePort>(() => LoginUseCase(sl()));

  ////////// Repositories //////////

  sl.registerLazySingleton<MovieRepositoryPort>(() => MovieRepository(sl()));
  sl.registerLazySingleton<LoginRepositoryPort>(() => LoginRepository(sl()));

  ////////// Datasources //////////

  sl.registerLazySingleton<RestMovieDatasourcePort>(
      () => RestMovieDatasource(sl()));

  sl.registerLazySingleton<LoginDatasourcePort>(() => LoginDatasource());

  ////////// Http client //////////

  sl.registerLazySingleton<HttpClient>(() => HttpClient());
}
