import 'package:get_cli/commands/impl/init/flutter/init_anchao_mvc.dart';

import '../../../../common/menu/menu.dart';
import '../../../../common/utils/logger/log_utils.dart';
import '../../../../common/utils/pubspec/pubspec_utils.dart';
import '../../../../common/utils/shell/shel.utils.dart';
import '../../../../core/internationalization.dart';
import '../../../../core/locales.g.dart';
import '../../../interface/command.dart';
import 'init_getxpattern.dart';
import 'init_katteko.dart';

class InitCommand extends Command {
  @override
  String get commandName => 'init';

  @override
  Future<void> execute() async {
    final menu = Menu([
      'GetX Pattern (by Kauê)',
      'CLEAN (by Arktekko)',
      'MVC (by Anchao)',
    ], title: 'Which architecture do you want to use?');
    final result = menu.choose();

    switch (result.index) {
      case 0:
        await createInitGetxPattern();
        break;
      case 1:
        await createInitKatekko();
        break;
      case 2:
        await createInitAnchao();
        break;
    }

    if (!PubspecUtils.isServerProject) {
      await ShellUtils.pubGet();
    }
    return;
  }

  @override
  String? get hint => Translation(LocaleKeys.hint_init).tr;

  @override
  bool validate() {
    super.validate();
    return true;
  }

  @override
  String? get codeSample => LogService.code('get init');

  @override
  int get maxParameters => 0;
}
