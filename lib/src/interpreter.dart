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
    go(move, repetitions);
    if (_error == CatError.invalidMove) {
      goCell(splited[0]);
    }
  }

  /// It takes a string, checks if it is a valid cell, and if it is,
  /// it calls the move function of the command caller with the string and
  /// a list of integers
  void goCell(String cell) {
    bool call = true;
    if (cell.length == 2 &&
        _rows.containsKey(cell[0]) &&
        _columns.containsKey(cell[1])) {
      call = _commandCaller.move(
        "toPosition",
        <int>[_rows[cell[0]]!, _columns[cell[1]]!],
      );
    } else {
      _error = CatError.invalidCell;

      return;
    }
    if (!call) {
      _error = CatError.invalidMove;

      return;
    }
    _error = CatError.none;
  }

  /// It takes a string and an integer, checks if the string is a valid move,
  /// and if it is, it calls the move function of the command caller with the
  /// string and a list of integers
  void go(String move, int repetitions) {
    final bool call = _commandCaller.move(move, <int>[repetitions]);
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
    final List<String> colors = splitByCurly(command.first);
    if (command.length == 1) {
      paintSingleCell(colors.first);

      return;
    }
    if (command.last.startsWith("{") && command.last.endsWith("}")) {
      final List<String> destinations = splitByCurly(command.last);
      paintMultipleCells(colors, destinations);
    } else {
      paintPattern(colors, command[1], command[2]);
    }
  }

  /// It takes a string, checks if it is a valid color, and if it is,
  /// it calls the color function of the command caller with the string and
  /// a list of integers with the current position of the board
  void paintPattern(List<String> colors, String repetitions, String pattern) {
    final List<int> colorsParsed =
        colors.map((String e) => containsColor(e.trim()).index).toList();
    if (colorsParsed.contains(CatColors.NaC.index) || colors.isEmpty) {
      _error = CatError.invalidColor;

      return;
    }
    final int column = _commandCaller.board.move.column;
    final int row = _commandCaller.board.move.row;
    final String color = pattern
        .split(" ")
        .where((String element) => element.isNotNullOrEmpty)
        .mapIndexed(
          (int index, String p1) => index == 0 ? p1 : p1.capitalize(),
        )
        .map((String e) => e.replaceAll("-", ""))
        .join();
    bool call = false;
    try {
      final int repetitionsParsed = repetitions.toInt();
      call = _commandCaller
          .color(color, <dynamic>[colorsParsed, repetitionsParsed]);
    } on FormatException {
      call = _commandCaller.color(color, <dynamic>[
        colorsParsed,
      ]);
    }

    if (!call) {
      _error = CatError.invalidColoringCommand;
    }
    _commandCaller.board.move.toPosition(row, column);
  }

  /// It takes a string, checks if it is a valid color, and if it is,
  /// it calls the color function of the command caller with the string and
  /// a list of integers with the current position of the board
  void paintMultipleCells(List<String> colors, List<String> cellsPositions) {
    final List<int> colorsParsed =
        colors.map((String e) => containsColor(e.trim()).index).toList();
    if (colorsParsed.contains(CatColors.NaC.index) || colors.isEmpty) {
      _error = CatError.invalidColor;

      return;
    }
    final int column = _commandCaller.board.move.column;
    final int row = _commandCaller.board.move.row;
    final StringBuffer newCommand = StringBuffer();
    int j = 0;
    if(cellsPositions.isEmpty){
      _error = CatError.invalidCell;

      return;
    }
    for (final String i in cellsPositions) {
      newCommand
        ..write("go($i)")
        ..write("paint(${colors[j]})");
      j = (j + 1) % colors.length;
    }
    _parse(newCommand.toString(), false);
    _commandCaller.board.move.toPosition(row, column);
  }

  /// It takes a string, checks if it is a valid color, and if it is,
  /// it calls the color function of the command caller with the string and
  /// a list of integers with the current position of the board
  void paintSingleCell(String color) {
    final int colorParsed = containsColor(color.trim()).index;
    if (colorParsed == CatColors.NaC.index) {
      _error = CatError.invalidColor;

      return;
    }
    _commandCaller.color(
      "color",
      <int>[colorParsed],
    );
  }

  /// It takes a list of commands and a list of positions where to copy the
  /// commands.
  /// Args:
  ///   commands (List<String>): The commands to execute
  ///   positions (List<String>): The positions where tto repeat the commands
  void repeatCommands(List<String> commands, List<String> positions) {
    final StringBuffer buffer = StringBuffer();
    final List<String> movements = positions;
    final List<String> modifiedCommands = <String>[];
    for (final String i in commands) {
      if (i.startsWith("paint")) {
        final List<String> splittedCommand = splitCommand(i);
        if (splittedCommand.length == 3) {
          final List<String> colors = splitByCurly(splittedCommand.second);
          final List<String> cellsPositions = splitByCurly(splittedCommand.last);
          final List<String> newCommand = [];
          int j = 0;
          for (final String i in cellsPositions) {
            newCommand
              ..add("go($i)")
              ..add("paint(${colors[j]})");
            j = (j + 1) % colors.length;
          }
          modifiedCommands.addAll(newCommand);
        } else {
          modifiedCommands.add(i);
        }
      } else {
        modifiedCommands.add(i);
      }
    }

    final List<List<String>> newCommands = _ofSetCommands(
      movements,
      modifiedCommands,
    );
    for (int i = 0; i < movements.length; i++) {
      buffer
        ..write(" go(${movements[i]}) ")
        ..writeAll(newCommands[i], " ");
    }
    _parse(buffer.toString(), false);
    _commandCaller.board.move.copyMode = false;
  }

  /// It takes a list of origin cells and a list of destination cells,
  /// the color of the origin cells is copied to the destination cells.
  /// Args:
  ///   origin (List<String>): Origin cells from where to copy the colors
  ///   destinations (List<String>): Destination cells
  void copyCells(List<String> origin, List<String> destination) {
    final StringBuffer buffer = StringBuffer();
    final Pair<List<String>, List<String>> newDestinationsAndColors =
        _copyCells(origin, destination);
    final List<String> newDestinations = newDestinationsAndColors.first;
    final List<String> colors = newDestinationsAndColors.second;
    for (int i = 0; i < newDestinations.length; i++) {
      buffer
        ..write(" go(${newDestinations[i]}) ")
        ..write(" paint(${colors[i]}) ");
    }
    _parse(buffer.toString(), false);
    _commandCaller.board.move.copyMode = false;
  }

  /// It takes a list of commands, splits them by curly braces,
  /// and then executes the first command
  /// for each of the second command's values.
  ///
  /// Args:
  ///   command (List<String>): The command that was passed in.
  void _copy(List<String> command) {
    _commandCaller.board.move.copyMode = true;
    final List<String> toExecute =
        splitCommands(command[0].removeSurrounding(prefix: "{", suffix: "}"));
    if (toExecute.isNotEmpty) {
      repeatCommands(toExecute, splitByCurly(command[1]));
    } else {
      final List<String> origin = splitByCurly(command[0]);
      final List<String> destination = splitByCurly(command[1]);
      copyCells(origin, destination);
    }
  }

  List<List<String>> _ofSetCommands(
    List<String> movements,
    List<String> toExecute,
  ) {
    final List<List<String>> ofSetCommands = <List<String>>[toExecute];
    final List<String> fistPosition = movements.first.trim().split("");
    final List<Pair<int, int>> offsets = <Pair<int, int>>[];
    if (_rows.containsKey(fistPosition[0]) &&
        _columns.containsKey(fistPosition[1])) {
      final Pair<int, int> fistPositionCoordinates =
          Pair<int, int>(_rows[fistPosition[0]]!, _columns[fistPosition[1]]!);
      for (final String i in toExecute) {
        if (i.startsWith("go")) {
          final List<String> el =
              i.replaceAll(RegExp("[go()]"), "").trim().split("");
          if (_rows.containsKey(el[0]) && _columns.containsKey(el[1])) {
            offsets.add(
              Pair<int, int>(
                fistPositionCoordinates.first - _rows[el[0]]!,
                fistPositionCoordinates.second - _columns[el[1]]!,
              ),
            );
          }
        }
      }
    }
    final List<List<String>> newPositionsMovements = _newPositionsMovements(
      movements,
      offsets,
    );
    for (final List<String> i in newPositionsMovements) {
      int j = 0;
      final List<String> modifiedCommands = <String>[];
      for (final String k in toExecute) {
        if (k.startsWith("go")) {
          final List<String> oldPosition =
              k.replaceAll(RegExp("[go()]"), "").trim().split("");
          if (_rows.containsKey(oldPosition[0]) &&
              _columns.containsKey(oldPosition[1])) {
            modifiedCommands.add("go(${i[j]})");
          } else {
            modifiedCommands.add(k);
          }
          j++;
        } else {
          modifiedCommands.add(k);
        }
      }
      ofSetCommands.add(modifiedCommands);
    }

    return ofSetCommands;
  }

  List<List<String>> _newPositionsMovements(
    List<String> movements,
    List<Pair<int, int>> offsets,
  ) {
    final List<List<String>> newPositionsMovements = <List<String>>[];
    for (int i = 1; i < movements.length; i++) {
      final List<String> newPositions = <String>[];
      final List<String> position = movements[i].trim().split("");
      if (_rows.containsKey(position[0]) && _columns.containsKey(position[1])) {
        final Pair<int, int> positionCoordinates =
            Pair<int, int>(_rows[position[0]]!, _columns[position[1]]!);
        for (final Pair<int, int> j in offsets) {
          final String rowPosition = _rows.keys.firstWhere(
            (String element) =>
                _rows[element] == positionCoordinates.first - j.first,
          );
          final String columnPosition = _columns.keys.firstWhere(
            (String element) =>
                _columns[element] == positionCoordinates.second - j.second,
          );
          newPositions.add("$rowPosition$columnPosition");
        }
      }
      newPositionsMovements.add(newPositions);
    }

    return newPositionsMovements;
  }

  Pair<List<String>, List<String>> _copyCells(
    List<String> origin,
    List<String> destination,
  ) {
    final List<Pair<int, int>> originLocal = _sortCells(origin);
    final List<Pair<int, int>> destinationLocal = _sortCells(destination);
    final List<String> newDestinations = <String>[];
    final List<String> colors = <String>[];
    for (final Pair<int, int> i in destinationLocal) {
      for (final Pair<int, int> j in originLocal) {
        final int row = (j.first + (i.first - j.first)) +
            (j.first - originLocal.first.first);
        final int column = (j.second + (i.second - j.second)) +
            (j.second - originLocal.first.second);
        final Iterable<String> rowKeys =
            _rows.filterValues((int p0) => p0 == row).keys;
        final String columnKeys = "${column + 1}";
        if (rowKeys.isEmpty) {
          _commandCaller.board.move.copyMode = false;
          _error = CatError.invalidMove;

          return const Pair<List<String>, List<String>>(<String>[], <String>[]);
        }
        newDestinations.add(
          "${rowKeys.first}$columnKeys",
        );
        colors.add(
          CatColors
              .values[_commandCaller.board.getBoard[j.first][j.second]].name,
        );
      }
    }

    return Pair<List<String>, List<String>>(newDestinations, colors);
  }

  List<Pair<int, int>> _sortCells(List<String> input) => input
      .map((String s) => Pair<int, int>(_rows[s[0]]!, _columns[s[1]]!))
      .toList();

  /// It calls the mirrorHorizontal or mirrorVertical function in the Dart code,
  /// depending on the value of the direction parameter
  ///
  /// Args:
  ///   direction (String): The direction to mirror the board.
  void mirrorBoard(String direction) {
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
  void mirrorCells(List<String> cells, String direction) {
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
  void mirrorCommands(List<String> commands, String direction) {
    final CommandCaller newCaller = CommandCaller(shape);
    final CommandCaller oldCaller = _commandCaller;
    _commandCaller = newCaller;
    _commandCaller.board.move.toPosition(
      oldCaller.board.move.row,
      oldCaller.board.move.column,
    );
    _parse(commands.join(","), false);
    mirrorBoard(direction);
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
      mirrorBoard(command.last);

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
      mirrorCells(toEvaluate, command.last);

      return;
    } else {
      mirrorCommands(toEvaluate, command.last);

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
  ///   colors (List<String>): The list of colors, only the first color is used.
  ///
  /// Returns:
  ///   The return type is void.
  void fillEmpty(List<String> colors) {
    final CatColors color = containsColor(colors.first);
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
          fillEmpty(el);
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
