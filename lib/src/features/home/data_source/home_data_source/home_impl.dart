import 'package:code_base/src/core/data_source/remote/api_service/service/api_request.dart';
import 'package:code_base/src/core/data_source/remote/api_service/service/request_model/methods.dart';
import 'package:code_base/src/features/home/data_source/home_data_source/interface.dart';
import '../../../../core/data_source/remote/api_service/service/Api_constants.dart';
import '../../../../core/data_source/remote/api_service/service/Lang_methods.dart';
import '../../../../core/data_source/remote/api_service/service/request_model/headers.dart';
import '../../../../core/data_source/remote/api_service/service/request_model/request_model.dart';
import '../models/doctor_data.dart';

class HomeDataSourceImpl implements HomeDataSource{
  ApiService apiService;
  HomeDataSourceImpl(this.apiService);

  @override
  Future<List<DoctorInfo>> getHomeData()async{
    final homeResponse = await apiService.callApi(
        request: RequestModel(
            method: RequestMethod.get,
            endPoint: ApiConstants.home,
            headers: HeadersWithToken()
        )
    );

    final data= (homeResponse.data['doctors'] as List)
        .map((e) => DoctorInfo.fromJson(e))
        .toList();
    return data;
  }
}