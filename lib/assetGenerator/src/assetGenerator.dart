import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'dart:io';
import 'package:pubspec/pubspec.dart';

final _dartfmt = new DartFormatter();

// generate fonts and assets classes from declarations on pubspec.yaml
// run with  dart lib/assetGenerator/src/assetGenerator.dart
void main() {
  parseFonts();
}

void parseFonts() async {
  generateCode("AppFonts", generateFontsClass);
}

void generateCode(String fileName, Function generateFontsClass) async {

  var partialPath = '/lib/assetGenerator/gen/${fileName}.dart';
  var file = await new File(
      '${Directory.current.path}${partialPath}')
      .create(recursive: true);

  await file.writeAsString(generateFontsClass());

  print("File created: $partialPath");
}


String generateFontsClass() {
  final animal = new Class((b) =>
  b
    ..name = 'AppFonts'
    ..fields.add(addFont("Enriqueta"))
  );
  return _dartfmt.format('${animal.accept(new DartEmitter())}');
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
