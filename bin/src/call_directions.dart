import "dart:collection";
import "dart:core";
import "dart:mirrors";

import "cross_coloring.dart";

class CommandCaller {
  HashSet<String> methodsMove = HashSet<String>();
  HashSet<String> methodsColor = HashSet<String>();

  late final InstanceMirror _im = reflect(board.move);
  late final InstanceMirror _imc = reflect(board);

  CrossColoring board = CrossColoring();

  CommandCaller() {
    methodsMove = _listMethods(board.move);
    methodsColor = _listMethods(board);
  }

  bool color(String name, List<dynamic> arg) {
    if (methodsColor.contains(name)) {
      return _callColorFunction(Symbol(name), arg);
    }

    return false;
  }

  bool move(String name, List<int> arg) {
    if (methodsMove.contains(name)) {
      return _callMoveFunction(Symbol(name), arg);
    }

    return false;
  }

  bool _callColorFunction(
    Symbol memberName,
    List<dynamic> positionalArguments,
  ) =>
      _imc.invoke(memberName, positionalArguments).reflectee;

  bool _callMoveFunction(
    Symbol memberName,
    List<dynamic> positionalArguments,
  ) =>
      _im.invoke(memberName, positionalArguments).reflectee;

  HashSet<String> _listMethods<T>(T obj) {
    HashSet<String> methods = HashSet<String>();
    InstanceMirror im = reflect(obj);
    List<ClassMirror> classMirrors = <ClassMirror>[im.type];
    if (classMirrors.first.isAbstract || classMirrors.first.isEnum) {
      return methods;
    }
    if (classMirrors.first.superclass != null) {
      classMirrors.add(classMirrors.first.superclass!);
    }
    classMirrors.addAll(classMirrors.first.superinterfaces);
    for (ClassMirror classMirror in classMirrors) {
      for (DeclarationMirror v in classMirror.declarations.values) {
        if (v is MethodMirror &&
            !v.isPrivate &&
            v.isRegularMethod &&
            !v.isStatic &&
            !v.isOperator) {
          methods.add(MirrorSystem.getName(v.simpleName));
        }
      }
    }
    methods
      ..remove("noSuchMethod")
      ..remove("toString");

    return methods;
  }
}
