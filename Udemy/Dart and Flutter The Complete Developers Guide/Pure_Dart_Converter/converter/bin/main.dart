import 'dart:io';
import 'package:prompter_sg/prompter_sg.dart';

List<Option> buildFormatOptions() {
  return [
    Option('Convert to jpeg', 'jpeg'),
    Option('Convert to png', 'png'),
  ];
}

void main() {
  final prompter = Prompter();

  bool answer = prompter.askBinary('Are you here to convert an image?');

  if (!answer) {
    exit(0);
  }
  prompter.askMultiple('Select format: ', buildFormatOptions());
}
