import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_getx_template/app/common/util/exports.dart';
import 'package:flutter_getx_template/app/data/api_helper.dart';
import 'package:flutter_getx_template/app/data/api_helper_impl.dart';
import 'package:flutter_getx_template/app/data/interface_controller/api_interface_controller.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_error_widget.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

abstract class Initializer {
  static void init(
    VoidCallback runApp,
  ) {
    ErrorWidget.builder = (errorDetails) {
      return CustomErrorWidget(
        message: errorDetails.exceptionAsString(),
      );
    };

    runZonedGuarded(() async {
      WidgetsFlutterBinding.ensureInitialized();
      FlutterError.onError = (details) {
        FlutterError.dumpErrorToConsole(details);
        Get.printInfo(info: details.stack.toString());
      };

      await _initServices();
      runApp();
      // configLoading();
    }, (error, stack) {
      Get.printInfo(info: 'runZonedGuarded: ${error.toString()}');
    });
  }

  static configLoading() {
    EasyLoading.instance
      ..indicatorType = EasyLoadingIndicatorType.threeBounce
      ..loadingStyle = EasyLoadingStyle.custom
      ..indicatorSize = 45.0
      ..radius = 10.0
      ..progressColor = Colors.yellow
      ..backgroundColor = AppColors.black.withOpacity(0.5)
      ..indicatorColor = hexToColor('#64DEE0')
      ..textColor = hexToColor('#64DEE0')
      ..maskColor = Colors.red
      ..userInteractions = false
      ..dismissOnTap = false
      ..animationStyle = EasyLoadingAnimationStyle.scale;
  }

  static Future<void> _initServices() async {
    try {
      await _initStorage();
      _initScreenPreference();
    } catch (err) {
      rethrow;
    }
  }

  static Future<void> _initStorage() async {
    await GetStorage.init();
  }

  static void _initScreenPreference() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
}

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApiHelper>(
      () => ApiHelperImpl(),
    );

    Get.lazyPut<ApiInterfaceController>(
      () => ApiInterfaceController(),
    );
  }
}
