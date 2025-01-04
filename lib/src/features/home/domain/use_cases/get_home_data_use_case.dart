// import 'package:code_base/src/core/data_source/remote/api_service/service/error_handling/errors.dart';
// import 'package:code_base/src/features/home/data/data_source/models/doctor_data.dart';
// import 'package:code_base/src/features/home/data/repositories/home_repo/home_repo.dart';
// import 'package:code_base/src/features/home/domain/use_cases/generic_use_case.dart';
// import 'package:multiple_result/src/result.dart';
//
// class GetHomeDataUseCase implements UseCase<List<DoctorInfo>, NoParams>{
//
//   HomeRepo repo;
//   GetHomeDataUseCase(this.repo);
//
//   @override
//   Future<Result<List<DoctorInfo>, RemoteError>> call(NoParams param)async {
//     final result = await repo.getHomeData();
//     return result;
//   }
// }