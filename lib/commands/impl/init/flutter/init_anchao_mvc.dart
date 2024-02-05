import 'dart:io';

import 'package:get_cli/commands/impl/create/anchao_screen/anchao_screen.dart';
import 'package:get_cli/samples/impl/anchao/anchao_error_handler.dart';
import 'package:get_cli/samples/impl/anchao/anchao_i18n.dart';
import 'package:get_cli/samples/impl/anchao/anchao_main.dart';

import '../../../../common/utils/logger/log_utils.dart';
import '../../../../core/internationalization.dart';
import '../../../../core/locales.g.dart';
import '../../../../core/structure.dart';
import '../../../../functions/create/create_list_directory.dart';
import '../../../../functions/create/create_main.dart';
import '../../install/install_get.dart';

Future<void> createInitAnchao() async {
  var canContinue = await createMain();
  if (!canContinue) return;

  await installGet();

  var initialDirs = [
    Directory(Structure.replaceAsExpected(path: 'assets/images')),
    Directory(Structure.replaceAsExpected(path: 'assets/svgs')),
    Directory(Structure.replaceAsExpected(path: 'assets/datas')),
    Directory(Structure.replaceAsExpected(path: 'lib/routes')),
    Directory(Structure.replaceAsExpected(path: 'lib/models')),
    Directory(Structure.replaceAsExpected(path: 'lib/widgets')),
    Directory(Structure.replaceAsExpected(path: 'lib/i18n')),
    Directory(Structure.replaceAsExpected(path: 'lib/utils')),
    Directory(Structure.replaceAsExpected(path: 'lib/screens')),
    Directory(Structure.replaceAsExpected(path: 'lib/services')),
    Directory(Structure.replaceAsExpected(path: 'lib/extensions')),
    Directory(Structure.replaceAsExpected(path: 'lib/themes')),
  ];
  createListDirectory(initialDirs);

  AnchaoMainSample().create();
  AnchaoI18nSample().create();
  AnchaoErrorHandlerSample().create();

  await Future.wait([
    CreateAnchaoScreenCommand().execute(),
  ]);

  LogService.success(Translation(LocaleKeys.sucess_getx_pattern_generated));
}
