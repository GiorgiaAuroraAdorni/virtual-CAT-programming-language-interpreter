import 'dart:convert';

import 'cross.dart';
import 'cross_coloring.dart';
import 'schemes.dart';

class CATInterpreter {
  CrossColoring board = CrossColoring();

  var boardColors = {
    'green': 1,
    'red': 2,
    'blue': 3,
    'yellow': 4,
  };

  late Schemes schemes;

  List<List<List<int>>> states = <List<List<int>>>[];

  CATInterpreter(String json) {
    schemes = schemesFromJson(json);
  }

  void parse(String command) {
    List<Function> toExecute = <Function>[];
    LineSplitter ls = LineSplitter();
    List<String> commands = ls.convert(command);
    List<List<String>> parsed = <List<String>>[];
    var re = RegExp(r"[\\(,\\)]");
    for (int i = 0; i < commands.length; i++) {
      parsed.add(commands[i]
          .toLowerCase()
          .trim()
          .split(re)
          .where((element) => element.isNotEmpty)
          .toList());
    }
    for (var el in parsed) {
      switch (el.first) {
        case "paint":
          {
            print(el);
          }
          break;
        case "move":
          {
            print(el);
          }
          break;

        default:
          {
            print("Command not implemented");
          }
          break;
      }
    }
  }

  void validateOnScheme(String code, int schemeIndex) {
    Cross? toValidate = schemes.schemas[schemeIndex];
    print(board.getBoard == toValidate);
    parse(code);
    // print(_validate(board.getBoard, toValidate!));
    // printBoard(board.getBoard);
  }
}
