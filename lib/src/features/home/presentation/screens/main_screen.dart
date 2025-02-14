import 'package:code_base/src/core/helpers/base_widgets/error/error_builder.dart';
import 'package:code_base/src/core/helpers/base_widgets/image_handler.dart';
import 'package:code_base/src/core/helpers/base_widgets/text.dart';
import 'package:code_base/src/features/state_handler/handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../blocs/home/cubit.dart';
import '../blocs/home/state.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
          create: (context) => GetIt.instance.get<HomeCubit>(),
          child: _HomeImpl2()
    );
  }
}

class _HomeImpl2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return StateHandler(
            asyncCall: () => context.read<HomeCubit>().getData(),
            successWidget: Center(child: AppText(text: 'Test')),
            // ListView.builder(
            //     itemCount: state.homeData!.length,
            //     itemBuilder: (context, index) => ListTile(
            //           leading: NetworkImageHandler(
            //               url: state.homeData![index].photo
            //           ),
            //           title: AppText(text: state.homeData![index].name),
            //           subtitle: AppText(text: state.homeData![index].description),
            //         ),
            //   ),
            currentState: state.currentState?? States.homeInitial,
            errorMsg: state.errorMsg,
          );
        },
      ),
    );
  }
}

class _HomeImpl extends StatelessWidget {
  const _HomeImpl({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          switch (state.currentState) {
            case States.homeDataLoading:
              return const Center(child: CircularProgressIndicator());
            case States.homeDataError:
              return ErrorBuilder(
                  msg: state.errorMsg!, onPressed: () =>
                  context.read<HomeCubit>().getHomeData()
              );
            default:
              return ListView.builder(
                itemCount: state.homeData!.length,
                itemBuilder: (context, index) =>
                    ListTile(
                      leading: NetworkImageHandler(
                          url: state.homeData![index].photo),
                      title: AppText(text: state.homeData![index].name),
                      subtitle: AppText(
                          text: state.homeData![index].description),
                    ),
              );
          }
        },
      ),
    );
  }
}
