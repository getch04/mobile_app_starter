import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/common/util/exports.dart';

import 'custom_text_button.dart';

class CustomRetryWidget extends StatelessWidget {
  final String error;
  final VoidCallback onPressed;

  const CustomRetryWidget({
    Key? key,
    required this.onPressed,
    this.error = Strings.somethingWentWrong,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                margin: const EdgeInsets.only(bottom: 0, left: 0),
                height: MediaQuery.of(context).size.height * 0.35,
                width: MediaQuery.of(context).size.width,
                child: Container(
                  child: const Image(
                    image: AssetImage('assets/images/went_wrong.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            const Text(
              'Ooops!',
              style: TextStyle(
                fontSize: 60,
              ),
            ),
            Center(
              child: Text(
                error,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 15),
              ),
            ),
            SizedBox(height: 16.h),
            CustomTextButton(
              buttonWidth: 105.w,
              height: 45,
              onPressed: onPressed,
              title: Strings.retry,
            ),
          ],
        ),
      ),
    );
  }
}
