import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart';

import 'cat_interpreter.dart';

void main(List<String> arguments) {
  var pathToFile = join(dirname(Platform.script.toFilePath()), 'schemas.json');
  var json = File(pathToFile).readAsStringSync();
  CATInterpreter interpreter = CATInterpreter(json);
  int schema = int.parse(arguments[0]);
  while(true){
    var line = stdin.readLineSync(encoding: utf8);
    String command = line.toString();
    interpreter.validateOnScheme(command,schema);
  }
  // interpreter.board.fillEmpty(3);
  // interpreter.board.move.diagonalDownRight();
  // interpreter.board.up([1, 2]);
  // interpreter.validateOnScheme("FILL_EMPTY(blue)", 1);
  // print(interpreter.board);
  // // Inter interpreter = Inter();
  // // interpreter.parse("PAINT(RED)");
  // interpreter
  //     .parse('PAINT([RED])\nPAINT([green, yellow], :, diagonal up right)');
  // interpreter.parse('MOVE(A1)');
  // interpreter.parse('MOVE(diagonal up right)');
  // interpreter.parse('MOVE(2 diagonal up right)');
  // interpreter.parse('MOVE(2 right)');
  // interpreter.parse("PAINT([green, yellow], :, diagonal up right)");
  // interpreter.normalize("MOVE(2 diagonal up right)\nMOVE(2 right)\nPAINT([green, yellow], :, diagonal up right)");
  // interpreter.parse("COPY(PAINT(red) GO(right)PAINT(yellow) GO(up) PAINT(green) GO(left) PAINT(blue),[C1 C3 C5 A3 F3])");
}
