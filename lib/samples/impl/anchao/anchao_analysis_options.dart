import '../../interface/sample_interface.dart';

/// [Sample] file from analysis_options.yaml file creation.
class AnchaoAnalysisOptionsSample extends Sample {
  String include;
  AnchaoAnalysisOptionsSample(
      {String path = 'analysis_options.yaml', this.include = ''})
      : super(path, overwrite: true);

  @override
  String get content => '''
  # This file configures the analyzer, which statically analyzes Dart code to
  # check for errors, warnings, and lints.
  #
  # The issues identified by the analyzer are surfaced in the UI of Dart-enabled
  # IDEs (https://dart.dev/tools#ides-and-editors). The analyzer can also be
  # invoked from the command line by running `flutter analyze`.

  # The following line activates a set of recommended lints for Flutter apps,
  # packages, and plugins designed to encourage good coding practices.
  # include: package:flutter_lints/flutter.yaml
  $include
  # include: package:lint/analysis_options.yaml

  analyzer:
    # strong-mode:
    #   implicit-casts: true
    # implicit-dynamic: true

    language:
      strict-casts: false
      strict-raw-types: false

    exclude:
      - lib/gen/**

  linter:
    # documentation is published at
    # https://dart-lang.github.io/linter/lints/index.html.
    rules:
      use_string_in_part_of_directives: false

      sort_constructors_first: false

      # The new tabs vs. spaces. Choose wisely
      prefer_single_quotes: false

      # Blindly follow the Flutter code style, which prefers types everywhere
      always_specify_types: false

      # Back to the 80s
      lines_longer_than_80_chars: false

      # Use parameter order as in json response
      always_put_required_named_parameters_first: false

      # Util classes are awesome!
      avoid_classes_with_only_static_members: false

      always_use_package_imports: false

      avoid_relative_lib_imports: false

      avoid_dynamic_calls: false

      parameter_assignments: false

      use_build_context_synchronously: false

      avoid_positional_boolean_parameters: false

      sort_pub_dependencies: false

      prefer_final_locals: false

      prefer_constructors_over_static_methods: false
  # Additional information about this file can be found at
  # https://dart.dev/guides/language/analysis-options    
''';
}
