import 'package:code_base/src/core/helpers/app_widgets/error_builder/screen.dart';
import 'package:code_base/src/features/home/blocs/home/state.dart';
import 'package:flutter/material.dart';

class StateHandler extends StatefulWidget {
  const StateHandler({super.key,
    this.loadingWidget,
    this.errorWidget,
    required this.successWidget,
    required this.asyncCall,
    this.onError,
    this.errorMsg,
    this.onLoading,
    this.onSuccess,
    required this.currentState
  });

  final void Function() asyncCall;
  final States currentState;
  final Widget? loadingWidget;
  final Widget? errorWidget;
  final String? errorMsg;
  final Widget successWidget;

  final Function()? onLoading;
  final Function(String error)? onError;
  final Function()? onSuccess;


  @override
  State<StateHandler> createState() => _StateHandlerState();
}

class _StateHandlerState extends State<StateHandler> {

  @override
  void initState() {
    widget.asyncCall.call();
    super.initState();
  }

  Widget get _loading{
    widget.onLoading?.call();
    return widget.loadingWidget ??
        const Center(child: CircularProgressIndicator());
  }

  Widget _error(String error){
    widget.onError?.call(error);
    return widget.errorWidget ??
        ErrorBuilder(
          msg: error,
          onPressed: () => widget.asyncCall.call()
        );
  }

  Widget get _success{
    widget.onSuccess?.call();
    return widget.successWidget;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.currentState == States.homeDataLoading? _loading :
      widget.currentState == States.homeDataError?
      _error(widget.errorMsg?? 'error') : _success
    );
  }
}
