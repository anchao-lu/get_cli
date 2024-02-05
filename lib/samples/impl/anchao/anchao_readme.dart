import 'package:get_cli/samples/interface/sample_interface.dart';

class AnchaoReadMeSample extends Sample {
  AnchaoReadMeSample() : super('README.md', overwrite: true);

  String get _cliReadMe => '''

# 终端执行命令，安装 get cli
```dart
flutter pub global activate -sgit https://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@github.com/anchao-lu/get_cli.git
```

# 利用脚手架创建项目
```shell
get create project
```

- 选择 1) Flutter Project
- 输入项目名称以及包名，选择 iOS 和安卓开发语言
- do you want to use some linter? 这里选择 2, 默认加入了一下 linters
- 等上面的命令执行完成，直到出现 Which architecture do you want to use?
- 选择 3, 之后选择默认值 1) yes 覆盖
- 等待命令执行完成，选择编辑器打开项目进行开发

## 开发过程中使用下面命令生成页面，会自动配置路由
```dart
get create screen:screenName
```

## 如果需要分 module，只需要在 screenName 前加入 moduleName 即可，以 / 分隔
```dart
get create screen:moduleName/screenName
```

# 也可以选择其他方式创建项目，然后在项目根目录执行以下命令
```shell
get init
```

- Which architecture do you want to use? 选择 3) MVC (by Anchao)
- 之后选择默认值 1) yes 覆盖
- - 新建项目也可以使用
- 等待命令执行完成，选择编辑器打开项目进行开发
- 开发过程同上
  ''';

  @override
  String get content => _cliReadMe;
}
