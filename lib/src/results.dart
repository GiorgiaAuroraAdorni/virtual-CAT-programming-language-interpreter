import "package:dartx/dartx.dart";

import "cross.dart";

/// It's a class that stores the results of the execution
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

  /// It's a variable that is used to check if the task is completed or not.
  bool completed = false;

  /// It's a getter that returns the past states of the board.
  List<Cross> get getStates => _states;

  /// It's a getter that returns the list of commands that were used to get to the
  /// current state.
  List<String> get getCommands => _commands;

  /// It's a getter that returns the list of positions that were used to get to the
  /// current state.
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

  /// Remove the last recorded state of the board.
  void removeLast() {
    _states.removeLast();
    _commands.removeLast();
    _positions.removeLast();
  }
}
