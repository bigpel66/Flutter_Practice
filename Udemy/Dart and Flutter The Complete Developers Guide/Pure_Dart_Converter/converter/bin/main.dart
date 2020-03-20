import 'dart:io';
import 'package:prompter_sg/prompter_sg.dart';

List<Option> buildFormatOptions() {
  return [
    Option('Convert to jpeg', 'jpeg'),
    Option('Convert to png', 'png'),
  ];
}

List<Option> buildFileOptions() {
  Directory.current.listSync().where((entity) {
    return FileSystemEntity.isFileSync(entity.path) &&
        entity.path.contains(RegExp(r'\.(png|jpeg|jpg)'));
  }).toList();

  return [];
}

void main() {
  final prompter = Prompter();

  bool answer = prompter.askBinary('Are you here to convert an image?');

  if (!answer) {
    exit(0);
  }

  final format = prompter.askMultiple('Select format: ', buildFormatOptions());
  prompter.askMultiple('Select an image to convert:', buildFileOptions());
}
