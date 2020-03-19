import 'dart:io';
import 'package:prompter_sg/prompter_sg.dart';

void main() {
  final prompter = Prompter();

  List<Option> options = [];

  bool answer = prompter.askBinary('Are you here to convert an image?');

  if (!answer) {
    exit(0);
  }
}
