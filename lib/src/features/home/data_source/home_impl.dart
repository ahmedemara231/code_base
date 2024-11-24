import 'package:code_base/src/core/data_source/remote/api_service/service/api_request.dart';
import '../../../core/data_source/remote/api_service/service/Api_constants.dart';
import '../../../core/data_source/remote/api_service/service/Lang_methods.dart';
import '../../../core/data_source/remote/api_service/service/request_model/headers.dart';
import '../../../core/data_source/remote/api_service/service/request_model/request_model.dart';
import 'models/doctor_data.dart';

class HomeDataSourceImpl{
  ApiService apiService;
  HomeDataSourceImpl(this.apiService);

  Future<List<DoctorInfo>> getHomeData()async{
    final homeResponse = await apiService.callApi(
        request: RequestModel(
            method: Methods.GET,
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