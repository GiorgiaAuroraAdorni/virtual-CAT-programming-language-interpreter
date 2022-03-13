List<String> commandSplit(String command) {
  List<String> splitted = <String>[];
  int start = 0;
  bool square = false;
  for (int i = 0; i < command.length; i++) {
    if (command[i] == '(' ||
        command[i] == ')' ||
        (!square && command[i] == ',')) {
      splitted.add(command.substring(start, i).trim());
      start = i + 1;
    }
    if (command[i] == '[' || command[i] == ']') {
      square = !square;
    }
  }

  return splitted.where((element) => element.isNotEmpty).toList();
}

List<String> normalize(String command) {
  String modified = command.replaceAll('\n', ' ').toLowerCase().trim();
  List<String> collection = <String>[];
  int open = 0;
  int start = 0;
  bool found = false;
  for (int i = 0; i < modified.length; i++) {
    if (modified[i] == '(') {
      found = !found;
      open++;
    }
    if (modified[i] == ')') {
      open--;
    }
    if (found && open == 0) {
      found = !found;
      collection.add(modified.substring(start, i + 1));
      start = i + 1;
    }
  }

  return collection.where((element) => element.isNotEmpty).toList();
}

List<String> splitBySquare(String command) {
  List<String> splitted = <String>[];
  int start = 0;
  for (int i = 0; i < command.length; i++) {
    if (command[i] == '[' || command[i] == ']' || command[i] == ',') {
      splitted.add(command.substring(start, i).trim());
      start = i + 1;
    }
  }

  return splitted.where((element) => element.isNotEmpty).toList();
}
