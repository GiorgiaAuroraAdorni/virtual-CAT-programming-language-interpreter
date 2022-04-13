import "src/cross.dart";

class Results {
  final List<Cross> _states = <Cross>[];
  final List<String> _commands = <String>[];
  bool completed = false;

  List<Cross> get getStates => _states;

  List<String> get getCommands => _commands;

  void addResult(String command, Cross state) {
    _states.add(state);
    _commands.add(command);
  }

  void removeLast() {
    _states.removeLast();
    _commands.removeLast();
  }
}
