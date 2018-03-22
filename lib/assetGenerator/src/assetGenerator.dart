import 'dart:async';

import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'dart:io';

import 'package:path/path.dart' as path;

import 'package:yaml/yaml.dart';


final _dartfmt = new DartFormatter();

// generate fonts and assets classes from declarations on pubspec.yaml
// run with  dart lib/assetGenerator/src/assetGenerator.dart
void main() {
  _generateCode("AppFonts", _generateFontsClass);
}


void _generateCode(String fileName, Function generateFontsClass) async {
  var partialPath = '/lib/assetGenerator/gen/${fileName}.dart';
  var file = await new File(
      '${Directory.current.path}${partialPath}')
      .create(recursive: true);

  await file.writeAsString(await generateFontsClass());

  print("File created: $partialPath");
}


Future<String> _generateFontsClass() async {
  var fontFamilies = await _loadFonts();

  final comments = "// Generated file, don't edit. See README.md for instructions\n\n";

  final fontsClass = new Class((b) {
    b
      ..name = 'AppFonts';

    for (var fontFamily in fontFamilies) {
      b.fields.add(addFont(fontFamily));
    }
  }
  );


  return _dartfmt.format('$comments ${fontsClass.accept(new DartEmitter())}');
}

Field addFont(String fontName) {
  return new Field ((fieldBuilder) {
    Code code = new Code('"$fontName"');
    fieldBuilder
      ..name = fontName
      ..static = true
      ..assignment = code
      ..modifier = FieldModifier.constant;
  });
}


Future<YamlMap> _parseYaml() async {
  var file = await
  new File(path.join(Directory.current.path, 'pubspec.yaml'))
      .readAsString();

  return loadYaml(file);
}

Future<List<String>> _loadFonts() async {
  var y = await _parseYaml();

//  List<String> assets = y['flutter']['assets'];

  var fonts = y['flutter']['fonts'];

  List<String> fontFamilies = new List();

  for (var f in fonts.value) {
    fontFamilies.add(f['family']);
  }

  print("Font Families $fontFamilies");

  return fontFamilies;
}