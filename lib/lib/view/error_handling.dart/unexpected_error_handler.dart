import 'package:code_base/lib/helpers/base_extensions/context/padding.dart';
import 'package:code_base/lib/helpers/base_widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UnexpectedErrorHandler extends StatelessWidget {
  final FlutterErrorDetails errorDetails;
  const UnexpectedErrorHandler({super.key,
    required this.errorDetails,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PreviewError(errorDetails: errorDetails.exceptionAsString()),
    );
  }
}

class PreviewError extends StatelessWidget {
  final String errorDetails;
  const PreviewError({super.key,
    required this.errorDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Error Occurred')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
                Icons.error,
                color: Colors.red,
                size: 80
            ),
            SizedBox(height: 16.h),
            MyText(
              text: 'Error Occurred!',
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
            ),
            Padding(
              padding: context.verticalSymmetricPadding(16.h),
              child: MyText(text: errorDetails),
            ),
            MyText(
              text: 'Please wait some time until the error is resolved and try again later',
            ),
          ],
        ),
      ),
    );
  }
}