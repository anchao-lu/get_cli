import 'package:get_cli/common/utils/pubspec/pubspec_utils.dart';
import 'package:get_cli/samples/interface/sample_interface.dart';
import 'package:recase/recase.dart';

class AnchaoMainSample extends Sample {
  AnchaoMainSample() : super('lib/main.dart', overwrite: true);

  String get _flutterMain => '''import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'error_handler.dart';
import 'i18n/${PubspecUtils.projectName?.snakeCase}_i18n.dart';
import 'routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  ErrorHandler.of.catchError();

  runApp(const ${PubspecUtils.projectName?.pascalCase}App());
}

class ${PubspecUtils.projectName?.pascalCase}App extends StatelessWidget {
  const ${PubspecUtils.projectName?.pascalCase}App({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.initial,
      defaultTransition: Transition.native,
      getPages: AppPages.pages,
      translations: ${PubspecUtils.projectName?.pascalCase}I18n(),
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('en', 'US'),
    );
  }
}
  ''';

  @override
  String get content => _flutterMain;
}
