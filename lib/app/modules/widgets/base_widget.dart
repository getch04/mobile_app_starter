import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/data/errors/api_error.dart';
import 'package:flutter_getx_template/app/data/interface_controller/api_interface_controller.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_retry_widget.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_snackbar_widget.dart';
import 'package:get/get.dart';

export 'package:flutter_getx_template/app/common/util/exports.dart';

class BaseWidget extends StatelessWidget {
  ///A widget with only custom retry button widget.
  final Widget child;

  const BaseWidget({
    Key? key,
    required this.child,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var connectivityStream = Connectivity().onConnectivityChanged;
    return GetBuilder<ApiInterfaceController>(
      builder: (c) => StreamBuilder<ConnectivityResult>(
        stream: connectivityStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final connectivityResult = snapshot.data;
            if (connectivityResult == ConnectivityResult.none) {
              return Scaffold(
                body: CustomRetryWidget(
                  onPressed: c.onRetryTap,
                ),
              );
            }
            return Stack(
              children: [
                Positioned.fill(
                  child: child,
                ),
                Visibility(
                  visible: c.retry != null && c.error != null,
                  child: Positioned.fill(
                    child: Scaffold(
                      body: CustomRetryWidget(
                        onPressed: c.onRetryTap,
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return const Center(child: Text('offfff connection'));
          }
          return Scaffold(
            body: CustomRetryWidget(
              onPressed: c.onRetryTap,
            ),
          );
        },
      ),
    );
  }
}
