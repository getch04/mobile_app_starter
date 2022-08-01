import 'package:internet_connection_checker/internet_connection_checker.dart';

Future<bool> hasConnection() async {
  bool result = await InternetConnectionChecker().hasConnection;
  if (result == true) {
    print('YAY! Free to go!');
  } else {
    print('No internet :( Reason:');
  }
  return result;
}
