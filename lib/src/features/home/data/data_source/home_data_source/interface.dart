import '../models/doctor_data.dart';

abstract interface class HomeDataSource{
  Future<List<DoctorInfo>> getHomeData();
}