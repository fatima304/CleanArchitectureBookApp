import 'api_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:clean_bookly_app/features/home/domain/repos/home_repo_impl.dart';
import 'package:clean_bookly_app/features/home/data/data_sources/local_data_source/home_local_data_source_impl.dart';
import 'package:clean_bookly_app/features/home/data/data_sources/remote_data_source/home_remote_data_source_impl.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(
    ApiService(
      Dio(),
    ),
  );
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      HomeLocalDataSourceImpl(),
      HomeRemoteDataSourceImpl(
        getIt.get<ApiService>(),
      ),
    ),
  );
}
