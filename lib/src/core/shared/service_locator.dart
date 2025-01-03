import 'package:code_base/src/features/home/data_source/home_data_source/home_impl.dart';
import 'package:get_it/get_it.dart';
import '../../features/home/blocs/home/cubit.dart';
import '../../features/home/repositories/home_repo/home_repo_impl.dart';
import '../data_source/remote/api_service/service/dio_connection.dart';

class ServiceLocator{
  final _getIt = GetIt.instance;

  void setUpBlocs(){
    _getIt.registerLazySingleton<HomeCubit>(() => HomeCubit(
        HomeRepoImpl(
            HomeDataSourceImpl(
                DioConnection.getInstance(),
            )
        ),));
  }
}