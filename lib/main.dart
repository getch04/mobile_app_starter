import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/common/util/initializer.dart';
import 'package:flutter_getx_template/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'app/modules/widgets/base_widget.dart';

void main() {
  Initializer.init(() {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (_, __) => MaterialApp(
        debugShowCheckedModeBanner: false,
        builder: EasyLoading.init(),
        home: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: Strings.appName,
          theme: AppTheme.theme,
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
          initialBinding: InitialBindings(),
          builder: (buildContext, child) => BaseWidget(
            child: child ?? const SizedBox.shrink(),
          ),
        ),
      ),
    );
  }
}
