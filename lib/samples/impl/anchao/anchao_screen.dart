import 'package:get_cli/samples/interface/sample_interface.dart';
import 'package:recase/recase.dart';

/// [Sample] file from Module_View file creation.
class AnchaoScreenSample extends Sample {
  final String _fileName;

  AnchaoScreenSample(String path, this._fileName, {bool overwrite = false})
      : super(path, overwrite: overwrite);

  String get _controllerName => 'GetView<${_fileName.pascalCase}Controller>';

  String get _flutterView => '''import 'package:flutter/material.dart';

import 'package:get/get.dart';

part '${_fileName}_controller.dart';

class ${_fileName.pascalCase}Screen extends $_controllerName {
  const ${_fileName.pascalCase}Screen({
    super.key,
  });
  
  @override
  Widget build(BuildContext context) {
    return GetBuilder<${_fileName.pascalCase}Controller>(
      init: ${_fileName.pascalCase}Controller(),
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Title'),
        ),
      ),
    );
  }
}

  ''';

  @override
  String get content => _flutterView;
}
