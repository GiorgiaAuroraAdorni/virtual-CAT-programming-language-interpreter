import "package:dartx/dartx.dart";

import "errors.dart";
import "results.dart";
import "src/call_directions.dart";
import "src/cross.dart";
import "src/cross_coloring.dart";
import "src/helper.dart";
import "src/schemes.dart";

class CATInterpreter {
  CATInterpreter(String json) {
    schemes = schemesFromJson(json);
  }

  CommandCaller commandCaller = CommandCaller();

  final Map<String, int> _boardColors = <String, int>{
    "white": 0,
    "green": 1,
    "red": 2,
    "blue": 3,
    "yellow": 4,
  };

  final Map<String, int> _rows = <String, int>{
    "f": 0,
    "e": 1,
    "d": 2,
    "c": 3,
    "b": 4,
    "a": 5,
  };

  final Map<String, int> _columns = <String, int>{
    "1": 0,
    "2": 1,
    "3": 2,
    "4": 3,
    "5": 4,
    "6": 5,
  };

  late final Schemes schemes;

  Results _results = Results();
  CatError _error = CatError.none;

  Results get getResults => _results;

  CrossColoring get board => commandCaller.board;

  void reset() {
    _results = Results();
    commandCaller = CommandCaller();
  }

  Pair<Results, CatError> validateOnScheme(String code, int schemeIndex) {
    final Cross? toValidate = schemes.schemas[schemeIndex];
    _error = CatError.none;
    _parse(code);
    _results.completed = commandCaller.board.getCross == toValidate;

    return Pair<Results, CatError>(_results, _error);
  }

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
    bool call = commandCaller.move(move, <int>[repetitions]);
    if (!call) {
      final List<String> coordinates = splited[0].split("");
      if (coordinates.length == 2 &&
          _rows.containsKey(coordinates[0]) &&
          _columns.containsKey(coordinates[1])) {
        call = commandCaller.move(
          "toPosition",
          <int>[_rows[coordinates[0]]!, _columns[coordinates[1]]!],
        );
      }
    }
    if (!call) {
      _error = CatError.invalidMove;
    }
  }

  void _paint(List<String> command) {
    final List<int> colors = <int>[];
    for (final String e in splitByCurly(command[0])) {
      if (_boardColors.containsKey(e)) {
        colors.add(_boardColors[e]!);
      } else {
        _error = CatError.invalidColor;

        return;
      }
    }
    if (command.length == 1) {
      commandCaller.color(
        "color",
        <int>[colors[0]],
      );

      return;
    }
    final String color = command[2]
        .split(" ")
        .where((String element) => element.isNotNullOrEmpty)
        .mapIndexed((int index, String p1) => index == 0 ? p1 : p1.capitalize())
        .map((String e) => e.replaceAll("-", ""))
        .join();
    bool call = false;
    try {
      final int repetitions = command[1].toInt();
      call = commandCaller.color(color, <dynamic>[colors, repetitions]);
    } on FormatException {
      call = commandCaller.color(color, <dynamic>[
        colors,
      ]);
    }

    if (!call) {
      _error = CatError.invalidColoringCommand;
    }
  }

  void _copy(List<String> command) {
    final List<String> toExecute =
        splitCommands(command[0].removeSurrounding(prefix: "{", suffix: "}"));
    final List<String> movements = splitByCurly(command[1]);
    final StringBuffer buffer = StringBuffer();
    for (final String move in movements) {
      buffer
        ..write(" go($move) ")
        ..writeAll(toExecute, " ");
    }
    _parse(buffer.toString(), false);
  }

  void _mirror(List<String> command) {
    if (command.length == 1) {
      switch (command.first) {
        case "horizontal":
          {
            commandCaller.color("mirrorHorizontal", <dynamic>[]);
          }
          break;
        case "vertical":
          {
            commandCaller.color("mirrorVertical", <dynamic>[]);
          }
          break;
        default:
          {
            _error = CatError.commandNotImplemented;
          }
          break;
      }
    }
  }

  void _parse(String command, [bool states = true]) {
    final List<String> commands = splitCommands(command);
    final List<List<String>> parsed = <List<String>>[];
    for (final int i in 0.rangeTo(commands.length - 1)) {
      parsed.add(splitCommand(commands[i]));
    }
    execute(commands, parsed, states: states);
  }

  void _fillEmpty(List<String> el) {
    if (_boardColors.containsKey(el.first)) {
      commandCaller.color("fillEmpty", <dynamic>[_boardColors[el.first]!]);
    } else {
      _error = CatError.invalidColor;

      return;
    }
  }

  void execute(
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
      if (states) {
        _results.addResult(
          commands[index],
          commandCaller.board.getCross.copy(),
          Pair<int, int>(
            commandCaller.board.move.row,
            commandCaller.board.move.column,
          ),
        );
      }
    });
  }
}
