import 'package:code_base/src/core/data_source/remote/api_service/extensions/future.dart';
import 'package:multiple_result/multiple_result.dart';
import '../../../../core/data_source/remote/api_service/service/error_handling/errors.dart';
import '../../data_source/home_data_source/interface.dart';
import '../../data_source/models/doctor_data.dart';
import 'home_repo.dart';

class HomeRepoImpl implements HomeRepo{
  HomeDataSource homeDataSource;
  HomeRepoImpl(this.homeDataSource);

  @override
  Future<Result<List<DoctorInfo>, RemoteError>> getHomeData()async {
      return await homeDataSource
          .getHomeData()
          .handleApiCalls();
  }
}