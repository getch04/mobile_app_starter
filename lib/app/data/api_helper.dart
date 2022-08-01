import 'package:flutter_getx_template/app/data/api_helper_impl.dart';
import 'package:get/get.dart';

export 'package:flutter_getx_template/app/common/util/extensions.dart';
export 'package:flutter_getx_template/app/common/util/utils.dart';

abstract class ApiHelper {
  static ApiHelper get to => Get.put(ApiHelperImpl());

  Future<Response> getPosts();
}
