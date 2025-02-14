import 'package:code_base/src/core/helpers/base_widgets/toast.dart';
import 'package:permission_handler/permission_handler.dart';
import '../models/permession_process_model.dart';

class AppPermission{
  static late Permission permission;

  static Future<void> check(PermissionProcessModel processModel)async {
    switch(processModel.permissionClient) {
      case PermissionClient.camera:
        permission = Permission.camera;

      case PermissionClient.storage:
        permission = Permission.storage;

      case PermissionClient.contacts:
        permission = Permission.contacts;

      case PermissionClient.notification:
        permission = Permission.notification;

      case PermissionClient.location:
        permission = Permission.location;
    }

    await askForPermission(
        onPermissionGranted: processModel.onPermissionGranted,
        onPermissionDenied: processModel.onPermissionDenied
    );
  }

  static Future<void> askForPermission({
    required Function() onPermissionGranted,
    required Function() onPermissionDenied,
    String? messageOnDenied,
  })async {
    bool status = await permission.status.isGranted;
    if(!status) {
      PermissionStatus status = await permission.request();
      switch(status) {
        case PermissionStatus.granted:
          onPermissionGranted();

        default:
          onPermissionDenied();
          if(messageOnDenied != null) {
            AppToast.show(msg: messageOnDenied);
          }
          openAppSettings();
      }
    }
    else{
      onPermissionGranted();
    }
  }
}