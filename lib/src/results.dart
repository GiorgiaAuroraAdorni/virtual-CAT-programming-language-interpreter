import "package:dartx/dartx.dart";
import "package:interpreter/cat_interpreter.dart";

/// It's a class that stores the results of the execution
class Results {
  /// It's creating a list of type `Cross` and assigning it to the variable
  /// `_states`.
  final List<BasicShape> _states = <BasicShape>[
    Cross(),
  ];

  /// It's creating a list of type `String` and assigning it to the variable
  /// `_commands`.
  final List<String> _commands = <String>[
    "None",
  ];

  /// It's creating a list of type `Pair<int, int>`
  /// and assigning it to the variable `_positions`.
  final List<Pair<int, int>> _positions = <Pair<int, int>>[
    const Pair<int, int>(3, 0),
  ];

  /// It's a variable that is used to check if the task is completed or not.
  bool completed = false;

  /// It's a getter that returns the past states of the board.
  List<BasicShape> get getStates => _states;

  /// It's a getter that returns the list of commands
  /// that were used to get to the current state.
  List<String> get getCommands => _commands;

  /// It's a getter that returns the list of positions
  /// that were used to get to the current state.
  List<Pair<int, int>> get getPositions => _positions;

  /// CAT score value
  int partialCatScore = 0;

  /// It adds the current state, command, and position to the lists
  ///
  /// Args:
  ///   command (String): The command that was used to get to this state.
  ///   state (Cross): The state of the board after the command is executed.
  ///   position (Pair<int, int>): The position of the cell that was clicked.
  void addResult(String command, BasicShape state, Pair<int, int> position) {
    _states.add(state);
    _commands.add(command);
    _positions.add(position);
    partialCatScore = _partialCATScoreCalculator();
  }

  /// Remove the last recorded state of the board.
  void removeLast() {
    _states.removeLast();
    _commands.removeLast();
    _positions.removeLast();
  }

  int _partialCATScoreCalculator() {
    int score = 0;
    for (int i = 1; i < _commands.length; i++) {
      int lineScore = 0;
      final List<String> tokenized = splitCommand(_commands[i]);
      switch (tokenized.first) {
        case "paint":
          lineScore = tokenized.length == 2
              ? 0
              : splitByCurly(tokenized[1]).length == 1
                  ? 1
                  : 2;
          break;
        case "fill_empty":
          lineScore = 1;
          break;
        case "copy":
          lineScore = 2;
          break;
        case "mirror":
          lineScore = 2;
          break;
        default:
          continue;
      }
      score = lineScore > score ? lineScore : score;
    }

    return score;
  }
}
