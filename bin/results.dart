import "package:dartx/dartx.dart";

import "src/cross.dart";

/// It's a class that stores the results of a game
class Results {
  /// It's creating a list of type `Cross` and assigning it to the variable
  /// `_states`.
  final List<Cross> _states = <Cross>[];

  /// It's creating a list of type `String` and assigning it to the variable
  /// `_commands`.
  final List<String> _commands = <String>[];

  /// It's creating a list of type `Pair<int, int>` and assigning it to the variable
  /// `_positions`.
  final List<Pair<int, int>> _positions = <Pair<int, int>>[];
  bool completed = false;

  List<Cross> get getStates => _states;

  List<String> get getCommands => _commands;

  List<Pair<int, int>> get getPositions => _positions;

  /// It adds the current state, command, and position to the lists
  ///
  /// Args:
  ///   command (String): The command that was used to get to this state.
  ///   state (Cross): The state of the board after the command is executed.
  ///   position (Pair<int, int>): The position of the cell that was clicked.
  void addResult(String command, Cross state, Pair<int, int> position) {
    _states.add(state);
    _commands.add(command);
    _positions.add(position);
  }

  /// Remove the last element from each of the three lists
  void removeLast() {
    _states.removeLast();
    _commands.removeLast();
    _positions.removeLast();
  }
}
