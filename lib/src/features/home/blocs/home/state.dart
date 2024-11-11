import 'package:code_base/src/features/home/models/doctor_data.dart';
import 'package:equatable/equatable.dart';

enum States {homeInitial, homeDataLoading, homeDataSuccess, homeDataError}
class HomeState extends Equatable
{
  final States? currentState;
  final List<DoctorInfo>? homeData;
  final String? errorMsg;

  const HomeState({
    this.currentState,
    this.homeData,
    this.errorMsg
  });

  factory HomeState.initial(){
    return const HomeState(
        currentState : States.homeInitial,
        homeData : [],
        errorMsg : ''
    );
  }

  HomeState copyWith({
    required States state,
    dynamic homeData, String? errorMessage
  })
  {
    return HomeState(
      currentState: state,
      homeData: homeData?? this.homeData,
      errorMsg: errorMessage?? errorMsg,
    );
  }

  @override
  List<Object?> get props => [currentState, homeData, errorMsg];
}