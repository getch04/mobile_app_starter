import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/common/storage/storage.dart';
import 'package:flutter_getx_template/app/data/api_helper.dart';
import 'package:flutter_getx_template/app/data/api_helper_impl.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_snackbar_widget.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class HomeController extends GetxController {
  final ApiHelper _apiHelper = ApiHelper.to;

  final RxList _dataList = RxList();
  List<dynamic> get dataList => _dataList;
  set dataList(List<dynamic> dataList) => _dataList.addAll(dataList);

  @override
  void onReady() {
    Get.lazyPut<ApiHelper>(() => ApiHelperImpl());
    super.onReady();
    connection();
    getPosts();
  }

  connection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        if (kDebugMode) {
          print('connected');
        }
      }
    } on SocketException catch (_) {
      if (kDebugMode) {
        print('not connected');
      }
    }
  }

  void getPosts() {
    _apiHelper.getPosts().futureValue(
          (value) => dataList = value,
          hasConnection: InternetConnectionChecker().hasConnection,
          retryFunction: getPosts,
        );
  }

  void onEditProfileClick() {
    Get.back();
  }

  void onFaqsClick() {
    Get.back();
  }

  void onLogoutClick() {
    Storage.clearStorage();
    // Get.offAllNamed(Routes.HOME);
    //Specify the INITIAL SCREEN you want to display to the user after logout
  }

  connec() {
    var connectivityStream = Connectivity().onConnectivityChanged;
    return StreamBuilder<ConnectivityResult>(
      stream: connectivityStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final connectivityResult = snapshot.data;
          if (connectivityResult == ConnectivityResult.none) {
            CustomSnackBar.buildCustomSnackbar(
                msg: 'No internet Connection', title: 'Warning');
            return Container();
          }
          return Container();
        } else if (snapshot.hasError) {
          return const Center(child: Text('offfff connection'));
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
