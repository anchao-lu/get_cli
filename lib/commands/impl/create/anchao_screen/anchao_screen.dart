import 'dart:io';

import 'package:dcli/dcli.dart';
import 'package:get_cli/functions/routes/anchao_add_route.dart';
import 'package:get_cli/samples/impl/anchao/anchao_controller.dart';
import 'package:get_cli/samples/impl/anchao/anchao_screen.dart';
import 'package:recase/recase.dart';

import '../../../../common/menu/menu.dart';
import '../../../../common/utils/logger/log_utils.dart';
import '../../../../common/utils/pubspec/pubspec_utils.dart';
import '../../../../core/generator.dart';
import '../../../../core/internationalization.dart';
import '../../../../core/locales.g.dart';
import '../../../../core/structure.dart';
import '../../../../functions/create/create_single_file.dart';
import '../../../interface/command.dart';

/// The command create a Binding and Controller page and view
class CreateAnchaoScreenCommand extends Command {
  @override
  String get commandName => 'screen';

  @override
  Future<void> execute() async {
    var isProject = false;
    if (GetCli.arguments[0] == 'create' || GetCli.arguments[0] == '-c') {
      isProject = GetCli.arguments[1].split(':').first == 'project';
    }
    var name = this.name;
    if (name.isEmpty || isProject) {
      name = 'splash';
    }
    checkForAlreadyExists(name);
  }

  @override
  String? get hint => LocaleKeys.hint_create_page.tr;

  void checkForAlreadyExists(String? name) {
    var newFileModel = Structure.model(
      name,
      'anchao_screen',
      true,
      on: onCommand,
      folderName: name,
    );
    var pathSplit = Structure.safeSplitPath(newFileModel.path!);

    pathSplit.removeLast();
    var path = pathSplit.join('/');
    path = Structure.replaceAsExpected(path: path);
    if (Directory(path).existsSync()) {
      final menu = Menu(
        [
          LocaleKeys.options_yes.tr,
          LocaleKeys.options_no.tr,
          LocaleKeys.options_rename.tr,
        ],
        title:
            Translation(LocaleKeys.ask_existing_page.trArgs([name])).toString(),
      );
      final result = menu.choose();
      if (result.index == 0) {
        _writeFiles(path, name!, overwrite: true);
      } else if (result.index == 2) {
        // final dialog = CLI_Dialog();
        // dialog.addQuestion(LocaleKeys.ask_new_page_name.tr, 'name');
        // name = dialog.ask()['name'] as String?;
        var name = ask(LocaleKeys.ask_new_page_name.tr);
        checkForAlreadyExists(name.trim().snakeCase);
      }
    } else {
      Directory(path).createSync(recursive: true);
      Directory('$path/widgets').createSync(recursive: true);
      Directory('$path/models').createSync(recursive: true);
      _writeFiles(path, name!, overwrite: false);
    }
  }

  void _writeFiles(String path, String name, {bool overwrite = false}) {
    var extraFolder = PubspecUtils.extraFolder ?? true;
    print('_writeFiles path: $path');
    print('_writeFiles name: $name');

    final fileName = name.split('/').lastOrNull ?? '';
    handleFileCreate(
      fileName,
      'anchao_controller',
      path,
      extraFolder,
      AnchaoControllerSample(
        '',
        fileName,
        overwrite: overwrite,
      ),
      '',
      'anchao_',
    );
    var viewFile = handleFileCreate(
      fileName,
      'anchao_screen',
      path,
      extraFolder,
      AnchaoScreenSample(
        '',
        fileName,
        overwrite: overwrite,
      ),
      '',
      'anchao_',
    );

    anchaoAddRoute(
      fileName,
      Structure.pathToDirImport(viewFile.path),
    );
    LogService.success(
        LocaleKeys.sucess_page_create.trArgs([fileName.pascalCase]));
  }

  @override
  String get codeSample => 'get create screen:product';

  @override
  int get maxParameters => 0;
}
