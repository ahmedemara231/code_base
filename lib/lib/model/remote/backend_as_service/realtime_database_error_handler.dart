import 'package:code_base/lib/model/remote/firebase_error_handler.dart';
import 'package:firebase_core/firebase_core.dart';

// class StoreErrorCode {
//   static const String unavailable = 'No internet connection, please try again later';
//   static const String permissionDenied = 'You do not have permission to perform this operation';
//   static const String resourceExhausted = 'please try again later';
//   static const String aborted = 'Operation aborted, please try again.';
//   static const String defaultError = 'can\'t make changes, please try again later';
// }

class RealTimeErrorHandler extends FirebaseErrorHandler {
  RealTimeErrorHandler(super.errorMessage);
  factory RealTimeErrorHandler.handle(FirebaseException e){
    String? errorMsg;
    switch (e.code) {
      case 'database/permission-denied':
        errorMsg = 'Check the permission rules';

      case 'database/network-error':
        errorMsg = 'Check your internet connection';

      case 'database/timeout':
        errorMsg = 'Timeout, Check your internet connection';

      default:
        errorMsg = 'Try Again Later';
    }
    return RealTimeErrorHandler(
        errorMsg
    );
  }
}