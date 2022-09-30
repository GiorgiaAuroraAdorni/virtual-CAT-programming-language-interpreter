import "package:dartx/dartx.dart";
import "package:interpreter/src/coloring/advanced_coloring.dart";
import "package:interpreter/src/command_caller.dart";
import "package:interpreter/src/models/cross.dart";
import "package:interpreter/src/models/schemes.dart";
import "package:interpreter/src/results.dart";
import "package:interpreter/src/utils/colors.dart";
import "package:interpreter/src/utils/errors.dart";
import "package:interpreter/src/utils/helper.dart";
import "package:interpreter/src/utils/shape.dart";

/// This class is a Dart
/// interpreter for the CAT language.
class CATInterpreter {
  /// It takes a JSON string and converts it into a Dart object.
  ///
  /// Args:
  ///   json (String): The JSON string that you want to parse.
  CATInterpreter(String json, this.shape) {
    schemes = schemesFromJson(json);
  }

  /// A constructor that takes a `Schemes` object and assigns it
  /// to the `schemes` variable.
  CATInterpreter.fromSchemes(this.schemes, this.shape);

  /// Creating a class called Shape with a variable called shape.
  Shape shape;

  late CommandCaller _commandCaller = CommandCaller(shape);

  /// A map that maps the letters of the rows to their index.
  final Map<String, int> _rows = <String, int>{
    "f": 0,
    "e": 1,
    "d": 2,
    "c": 3,
    "b": 4,
    "a": 5,
  };

  /// A map that maps the letters of the rows to their index.
  final Map<String, int> _columns = <String, int>{
    "1": 0,
    "2": 1,
    "3": 2,
    "4": 3,
    "5": 4,
    "6": 5,
  };

  /// A getter for the loaded schemes.
  late final Schemes schemes;

  Results _results = Results();
  CatError _error = CatError.none;

  /// A getter for the results of the command execution.
  Results get getResults => _results;

  /// A getter for the board.
  Coloring get board => _commandCaller.board;

  /// `reset()` is a function that resets the `_results` variable to a new
  /// instance of the `Results` class and resets the `commandCaller` variable
  /// to a new instance of the `CommandCaller` class
  void reset() {
    _results = Results();
    _commandCaller = CommandCaller(shape);
  }

  /// It takes a string of code, parses it, and then checks if the code is valid
  ///
  /// Args:
  ///   code (String): The code to be validated.
  ///   schemeIndex (int): The index of the scheme to validate against.
  ///
  /// Returns:
  ///   A pair of Results and CatError.
  Pair<Results, CatError> validateOnScheme(String code, int schemeIndex) {
    final Cross? toValidate = schemes.getData[schemeIndex];
    _error = CatError.none;
    _parse(code);
    _results.completed = _commandCaller.board.getCross == toValidate;

    return Pair<Results, CatError>(_results, _error);
  }

  /// It takes a list of strings,
  /// splits the first string into a list of strings, tries to convert the first
  /// string into an integer,
  /// removes the first string from the list if it was an integer,
  /// capitalizes the first letter of each string in the list,
  /// joins the list into a string,
  /// and calls the move function of the command caller with the string and
  /// a list of integers
  ///
  /// Args:
  ///   command (List<String>): The command that the user has entered.
  ///
  /// Returns:
  ///   A bool.
  void _go(List<String> command) {
    List<String> splited = command[0].split(" ");
    int repetitions;
    try {
      repetitions = splited[0].toInt();
      splited.removeAt(0);
    } on FormatException {
      repetitions = 1;
    }
    splited = splited
        .mapIndexed(
          (int index, String p1) => index == 0 ? p1 : p1.capitalize(),
        )
        .toList();
    final String move = splited.join();
    bool call = _commandCaller.move(move, <int>[repetitions]);
    if (!call) {
      if (splited[0].length == 2 &&
          _rows.containsKey(splited[0][0]) &&
          _columns.containsKey(splited[0][1])) {
        call = _commandCaller.move(
          "toPosition",
          <int>[_rows[splited[0][0]]!, _columns[splited[0][1]]!],
        );
      } else {
        _error = CatError.invalidCell;

        return;
      }
    }
    if (!call) {
      _error = CatError.invalidMove;
    }
  }

  /// It takes a list of strings, checks if the first string is a valid color,
  /// and if it is, it calls the color function of the command caller
  ///
  /// Args:
  ///   command (List<String>): The command that was passed in.
  ///
  /// Returns:
  ///   A list of strings.
  void _paint(List<String> command) {
    final List<int> colors = <int>[];
    for (final String e in splitByCurly(command[0])) {
      final CatColors color = containsColor(e.trim());
      if (color != CatColors.NaC) {
        colors.add(color.index);
      } else {
        _error = CatError.invalidColor;

        return;
      }
    }
    if (command.length == 1) {
      _commandCaller.color(
        "color",
        <int>[colors[0]],
      );

      return;
    }
    final int column = _commandCaller.board.move.column;
    final int row = _commandCaller.board.move.row;
    final String color = command[2]
        .split(" ")
        .where((String element) => element.isNotNullOrEmpty)
        .mapIndexed((int index, String p1) => index == 0 ? p1 : p1.capitalize())
        .map((String e) => e.replaceAll("-", ""))
        .join();
    bool call = false;
    try {
      final int repetitions = command[1].toInt();
      call = _commandCaller.color(color, <dynamic>[colors, repetitions]);
    } on FormatException {
      call = _commandCaller.color(color, <dynamic>[
        colors,
      ]);
    }

    if (!call) {
      _error = CatError.invalidColoringCommand;
    }
    _commandCaller.board.move.toPosition(row, column);
  }

  /// It takes a list of commands, splits them by curly braces,
  /// and then executes the first command
  /// for each of the second command's values.
  ///
  /// Args:
  ///   command (List<String>): The command that was passed in.
  void _copy(List<String> command) {
    _commandCaller.board.move.copyMode = true;
    final StringBuffer buffer = StringBuffer();
    final List<String> toExecute =
        splitCommands(command[0].removeSurrounding(prefix: "{", suffix: "}"));
    if (toExecute.isNotEmpty) {
      final List<String> movements = splitByCurly(command[1]);
      for (final String move in movements) {
        buffer
          ..write(" go($move) ")
          ..writeAll(toExecute, " ");
      }
    } else {
      final List<Pair<int, int>> origin = _sortCells(splitByCurly(command[0]));
      final List<Pair<int, int>> destination =
          _sortCells(splitByCurly(command[1]));
      final List<String> newDestinations = <String>[];
      final List<String> colors = <String>[];
      for (final Pair<int, int> i in destination) {
        for (final Pair<int, int> j in origin) {
          final int row =
              (j.first + (i.first - j.first)) + (j.first - origin.first.first);
          final int column = i.second + (i.second - (i.second - j.second));
          final Iterable<String> rowKeys =
              _rows.filterValues((int p0) => p0 == row).keys;
          final Iterable<String> columnKeys =
              _columns.filterValues((int p0) => p0 == column).keys;
          if (rowKeys.isEmpty || columnKeys.isEmpty) {
            _commandCaller.board.move.copyMode = false;
            _error = CatError.invalidMove;

            return;
          }
          newDestinations.add(
            "${rowKeys.first}${columnKeys.first}",
          );
          colors.add(
            CatColors
                .values[_commandCaller.board.getBoard[j.first][j.second]].name,
          );
        }
      }
      for (int i = 0; i < newDestinations.length; i++) {
        buffer
          ..write(" go(${newDestinations[i]}) ")
          ..write(" paint(${colors[i]}) ");
      }
    }
    _parse(buffer.toString(), false);
    _commandCaller.board.move.copyMode = false;
  }

  List<Pair<int, int>> _sortCells(List<String> input) => input
      .map((String s) => Pair<int, int>(_rows[s[0]]!, _columns[s[1]]!))
      .toList()
    ..sort((Pair<int, int> a, Pair<int, int> b) {
      if (a.first == b.first && a.second == b.second) {
        return 0;
      }

      return ((6 - a.first) + a.second) < ((6 - b.first) + b.second) ? -1 : 1;
    });

  /// It calls the mirrorHorizontal or mirrorVertical function in the Dart code,
  /// depending on the value of the direction parameter
  ///
  /// Args:
  ///   direction (String): The direction to mirror the board.
  void _mirrorBoard(String direction) {
    switch (direction) {
      case "horizontal":
        {
          _commandCaller.color("mirrorHorizontal", <dynamic>[]);
        }
        break;
      case "vertical":
        {
          _commandCaller.color("mirrorVertical", <dynamic>[]);
        }
        break;
      default:
        {
          _error = CatError.commandNotImplemented;
        }
        break;
    }
  }

  /// It takes a list of cells and a direction,
  /// and then it moves to each cell and
  /// calls the appropriate mirror function
  ///
  /// Args:
  ///   cells (List<String>): A list of cells to mirror.
  ///   direction (String): The direction to mirror the cells in.
  void _mirrorCells(List<String> cells, String direction) {
    switch (direction) {
      case "horizontal":
        {
          for (final String s in cells) {
            _commandCaller
              ..move(
                "toPosition",
                <int>[_rows[s[0]]!, _columns[s[1]]!],
              )
              ..color("mirrorCellHorizontal", <dynamic>[]);
          }
        }
        break;
      case "vertical":
        {
          for (final String s in cells) {
            _commandCaller
              ..move(
                "toPosition",
                <int>[_rows[s[0]]!, _columns[s[1]]!],
              )
              ..color("mirrorCellVertical", <dynamic>[]);
          }
        }
        break;
      default:
        {
          _error = CatError.commandNotImplemented;
        }
        break;
    }
  }

  /// It creates a new command caller,
  /// copies the board from the old command caller,
  /// parses the commands,
  /// mirrors the board,
  /// and then joins the crosses from the
  /// new board to the old board.
  ///
  /// Args:
  ///   commands (List<String>): The list of commands to mirror.
  ///   direction (String): The direction to mirror the board.
  void _mirrorCommands(List<String> commands, String direction) {
    final CommandCaller newCaller = CommandCaller(shape);
    final CommandCaller oldCaller = _commandCaller;
    _commandCaller = newCaller;
    _commandCaller.board.move.toPosition(
      oldCaller.board.move.row,
      oldCaller.board.move.column,
    );
    _parse(commands.join(","), false);
    _mirrorBoard(direction);
    oldCaller.board.joinBoards(_commandCaller.board.getCross);
    _commandCaller = oldCaller;
  }

  /// If the command is a direction, mirror the board.
  /// If the command is a list of cells, mirror those cells.
  /// If the command is a list of commands, mirror those commands.
  ///
  /// Args:
  ///   command (List<String>): The command that was entered by the user.
  void _mirror(List<String> command) {
    if (command.length == 1) {
      _mirrorBoard(command.last);

      return;
    }
    final List<String> toEvaluate = splitByCurly(command.first);
    bool isCell = true;
    for (final String s in toEvaluate) {
      if (s.length != 2 ||
          !_rows.containsKey(s[0]) ||
          !_columns.containsKey(s[1])) {
        isCell = false;
        break;
      }
    }
    if (isCell) {
      _mirrorCells(toEvaluate, command.last);

      return;
    } else {
      _mirrorCommands(toEvaluate, command.last);

      return;
    }
  }

  /// It takes a string, splits it into commands, splits each command into
  /// arguments, and then executes the commands
  ///
  /// Args:
  ///   command (String): The command to be parsed.
  ///   states (bool): If true,
  ///     the command will be added to the command history.
  /// Defaults to true
  void _parse(String command, [bool states = true]) {
    final List<String> commands = splitCommands(command);
    final List<List<String>> parsed = <List<String>>[];
    for (int i = 0; i < commands.length; i++) {
      parsed.add(splitCommand(commands[i]));
    }
    _execute(commands, parsed, states: states);
  }

  /// If the first element of the list is a valid color, then call the `color`
  /// function of the `commandCaller` object with the `fillEmpty` command
  /// and the index of the color.
  ///
  /// Args:
  ///   el (List<String>): The list of arguments passed to the command.
  ///
  /// Returns:
  ///   The return type is void.
  void _fillEmpty(List<String> el) {
    final CatColors color = containsColor(el.first);
    if (color != CatColors.NaC) {
      _commandCaller.color("fillEmpty", <dynamic>[color.index]);
    } else {
      _error = CatError.invalidColor;

      return;
    }
  }

  /// It executes the commands
  /// that are passed to it
  ///
  /// Args:
  ///   commands (List<String>): The list of commands that were parsed.
  ///   parsed (List<List<String>>): The parsed commands.
  ///   states (bool): If true,
  ///     the results of each command will be saved in a list.
  /// Defaults to true
  void _execute(
    List<String> commands,
    List<List<String>> parsed, {
    bool states = true,
  }) {
    parsed.forEachIndexed((List<String> el, int index) {
      if (_error != CatError.none) {
        return;
      }
      switch (el.removeAt(0)) {
        case "paint":
          _paint(el);
          break;
        case "go":
          _go(el);
          break;
        case "fill_empty":
          _fillEmpty(el);
          break;
        case "copy":
          _copy(el);
          break;
        case "mirror":
          _mirror(el);
          break;
        default:
          {
            _error = CatError.commandNotImplemented;

            return;
          }
      }
      if (states && _error == CatError.none) {
        _results.addResult(
          commands[index],
          _commandCaller.board.getCross.copy(),
          Pair<int, int>(
            _commandCaller.board.move.row,
            _commandCaller.board.move.column,
          ),
        );
      }
    });
  }
}
