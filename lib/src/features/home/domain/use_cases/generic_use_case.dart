import 'package:code_base/src/core/data_source/remote/api_service/service/error_handling/errors.dart';
import 'package:multiple_result/multiple_result.dart';

abstract interface class UseCase<T, E>{
  Future<Result<T, RemoteError>> call(E param);
}

class NoParams{}