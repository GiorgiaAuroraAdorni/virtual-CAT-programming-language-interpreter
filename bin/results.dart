import "package:dartx/dartx.dart";

import "src/cross.dart";

class Results {
  final List<Cross> _states = <Cross>[];
  final List<String> _commands = <String>[];
  final List<Pair<int, int>> _positions = <Pair<int, int>>[];
  bool completed = false;

  List<Cross> get getStates => _states;

  List<String> get getCommands => _commands;

  List<Pair<int, int>> get getPositions => _positions;

  void addResult(String command, Cross state, Pair<int, int> position) {
    _states.add(state);
    _commands.add(command);
    _positions.add(position);
  }

  void removeLast() {
    _states.removeLast();
    _commands.removeLast();
    _positions.removeLast();
  }
}
