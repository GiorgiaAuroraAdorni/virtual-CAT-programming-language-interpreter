import 'board.dart';

class Inter {
  Board b = Board();

  var colors = {
    'green': 1,
    'red': 2,
    'blue': 3,
    'yellow': 4,
  };

  void parse(String command) {
    String normalized = command.toLowerCase();
    var re = RegExp(r"[\\(,\\)]");
    print(normalized.split(re));
    print(b);
  }
}

void main(List<String> arguments) {
  Inter interpreter = Inter();
  interpreter.parse("PAINT(RED)");
  interpreter.parse("PAINT([green, yellow], :, diagonal up right)");
  interpreter.parse("COPY(PAINT(red) GO(right)PAINT(yellow) GO(up) PAINT(green) GO(left) PAINT(blue),[C1 C3 C5 A3 F3])");
}
