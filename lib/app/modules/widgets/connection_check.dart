import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_snackbar_widget.dart';

class ConnectionCheck extends StatelessWidget {
  const ConnectionCheck({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
       return  const Text('data');
      },
    );
  }
}
