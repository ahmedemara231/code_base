import 'package:code_base/model/remote/api_service/service/request_models/download_request_model.dart';
import 'package:code_base/model/remote/api_service/service/request_models/request_model.dart';
import 'package:dio/dio.dart';
import 'package:multiple_result/multiple_result.dart';
import 'error_handling/errors.dart';

abstract class ApiService
{
  Future<Result<Response,CustomError>> callApi({
    required RequestModel request,
  });

  Future<Result<Response,CustomError>> downloadFromApi({
    required DownloadModel request,
  });
}