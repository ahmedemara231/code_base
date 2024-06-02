import 'package:code_base/view_model/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeStates>
{
  HomeCubit() : super(HomeInitialState());
  factory HomeCubit.getInstance(context) => BlocProvider.of(context);
}