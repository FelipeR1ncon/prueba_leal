import 'package:get_it/get_it.dart';
import 'package:prueba_leal/domain/model/port/in/movies/movie_use_case_port.dart';
import 'package:prueba_leal/domain/model/port/out/movies/movie_repository_port.dart';
import 'package:prueba_leal/domain/use_case/movies/movie_use_case.dart';
import 'package:prueba_leal/infrastructure/data/datasource/http_client.dart';
import 'package:prueba_leal/infrastructure/data/datasource/movies/rest_movie_datasource.dart';
import 'package:prueba_leal/infrastructure/data/datasource_port/movies/rest_movie_datasource_port.dart';
import 'package:prueba_leal/infrastructure/respository/movies/movie_repository.dart';
import 'package:prueba_leal/presentation/movies/home/features/Home/presentation/movies/pages/home/cubit/home_cubit.dart';
import 'package:prueba_leal/presentation/movies/home/features/Home/presentation/movies/pages/home/home_page.dart';

final sl = GetIt.I;

void setupInjectionDependency() {
  ////////// Pages /////////////
  sl.registerFactory(() => HomePage(sl()));

  ////////// Cubits /////////////
  sl.registerFactory<HomeCubit>(() => HomeCubit(sl()));

  ///////// Use cases //////////

  sl.registerLazySingleton<MovieUseCasePort>(() => MovieUseCase(sl()));

  ////////// Repositories //////////

  sl.registerLazySingleton<MovieRepositoryPort>(() => MovieRepository(sl()));

  ////////// Datasource //////////

  sl.registerLazySingleton<RestMovieDatasourcePort>(
      () => RestMovieDatasource(sl()));

  ////////// Http client //////////

  sl.registerLazySingleton<HttpClient>(() => HttpClient());
}
