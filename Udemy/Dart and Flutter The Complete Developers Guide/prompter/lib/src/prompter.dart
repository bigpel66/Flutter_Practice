import 'option.dart';
import 'terminal.dart';

final _terminal = const Terminal();

class Prompter {
  String _ask(String prompt, List<Option> options) {
    _terminal.clearScreen();
    _terminal.printPrompt(prompt);
    _terminal.printOptions(options);

    return _terminal.collectInput();
  }

  String askMultiple(String prompt, List<Option> options) {
    final answer = _ask(prompt, options);

    try {
      return options[int.parse(answer) - 1].value;
    } catch (error) {
      return askMultiple(prompt, options);
    }
  }

  bool askBinary(String prompt) {
    final answer = _ask('$prompt (y/n)', []);

    return answer.contains('y');
  }
}
