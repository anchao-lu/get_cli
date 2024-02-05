import 'dart:io';

import 'package:get_cli/common/utils/logger/log_utils.dart';
import 'package:get_cli/core/internationalization.dart';
import 'package:get_cli/core/locales.g.dart';
import 'package:get_cli/extensions.dart';
import 'package:get_cli/functions/find_file/find_file_by_name.dart';
import 'package:get_cli/functions/routes/anchao_add_page.dart';
import 'package:get_cli/samples/impl/anchao/anchao_routes.dart';
import 'package:recase/recase.dart';

/// This command will create the route to the new page
void anchaoAddRoute(String nameRoute, String viewDir) {
  var routesFile = findFileByName('app_routes.dart');

  if (routesFile.path.isEmpty) {
    AnchaoAppRoutesSample().create();
    routesFile = File(AnchaoAppRoutesSample().path);
  }

  var declareRoute = 'static const ${nameRoute.camelCase} =';
  var line = "$declareRoute '/${nameRoute.camelCase}';";

  final newPath = line;

  routesFile.appendClassContent('Routes', newPath);
  anchaoAddPage(nameRoute, viewDir);

  LogService.success(
      Translation(LocaleKeys.sucess_route_created).trArgs([nameRoute]));
}
