import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_getx_template/app/common/util/utils.dart';
import 'package:get/get.dart';

typedef CloseDialog = void Function();

abstract class LoadingDialog {
  static CloseDialog? _loadingDialog;

  static CloseDialog _showLoadingDialog() {
    Get.printInfo(info: 'initialized loading');
    Utils.loadingDialog();
    // EasyLoading.dismiss();
    return Utils.closeDialog;
  }

  static void showLoadingDialog() {
    _loadingDialog = _showLoadingDialog();
    Get.printInfo(info: 'start loading');
  }

  static void closeLoadingDialog() {
    Get.printInfo(info: 'close loading');
    _loadingDialog?.call();
  }
}
