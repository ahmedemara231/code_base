import 'package:code_base/lib/model/remote/api_service/service/request_model/request_model.dart';
import 'package:dio/dio.dart';

abstract class ApiService {
  Future<Response> callApi({
    required RequestModel request,
  });
}