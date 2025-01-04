import 'package:multiple_result/multiple_result.dart';
import '../../../../../core/data_source/remote/api_service/service/error_handling/errors.dart';
import '../../data_source/models/doctor_data.dart';

abstract interface class HomeRepo{
  Future<Result<List<DoctorInfo>, RemoteError>> getHomeData();
}