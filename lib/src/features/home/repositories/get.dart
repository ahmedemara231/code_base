import 'package:code_base/src/core/data_source/remote/api_service/extensions/future.dart';
import 'package:code_base/src/features/home/data_source/home_impl.dart';
import 'package:code_base/src/features/home/models/doctor_data.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../core/data_source/remote/api_service/service/error_handling/errors.dart';

class HomeGetRepo{
  HomeDataSourceImpl homeDataSourceImpl;
  HomeGetRepo(this.homeDataSourceImpl);
  Future<Result<List<DoctorInfo>, RemoteError>> getHomeData()async{
    return await homeDataSourceImpl
        .getHomeData()
        .handleApiCalls();
  }
}