import 'package:prompter/prompt.dart';

void main() {
  var prompter = Prompter();

  var options = [
    Option(label: 'I want red', value: '#f00'),
    Option(label: 'I want blue', value: '#00f')
  ];

  String colorCode = prompter.askMultiple('What color do you want?', options);

  bool answer = prompter.askBinary('Do you like dart?');

  print(colorCode);
  print(answer);
}
