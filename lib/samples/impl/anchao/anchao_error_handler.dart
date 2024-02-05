import 'package:get_cli/samples/interface/sample_interface.dart';

class AnchaoErrorHandlerSample extends Sample {
  AnchaoErrorHandlerSample() : super('lib/error_handler.dart', overwrite: true);

  String get _flutterMain => '''import 'package:flutter/foundation.dart';

class ErrorHandler {
  static final ErrorHandler of = ErrorHandler._();
  ErrorHandler._();

  void catchError() {
    FlutterError.onError = _onError;
    PlatformDispatcher.instance.onError = _onDispatherError;
  }

  void _onError(FlutterErrorDetails details) {
    _reportError(details);
  }

  bool _onDispatherError(Object exception, StackTrace? stackTrace) {
    final details = FlutterErrorDetails(
      exception: exception,
      stack: stackTrace,
    );
    _reportError(details);
    return true;
  }

  Future<void> _reportError(FlutterErrorDetails details) async {
    const isDistribute = kReleaseMode;
    if (!isDistribute) {
      FlutterError.presentError(details);
    } else {
      // 上传服务器
    }
  }
}

  ''';

  @override
  String get content => _flutterMain;
}
