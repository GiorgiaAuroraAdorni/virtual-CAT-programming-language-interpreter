import "dart:collection";
import "dart:core";
import "dart:mirrors";

import "cross_coloring.dart";

/// It creates two lists of methods, one for the board and one for the move, and if
/// the method name is in the list of methods, call the method
class CommandCaller {
  HashSet<String> methodsMove = HashSet<String>();
  HashSet<String> methodsColor = HashSet<String>();

  /// It's creating a mirror of the `board.move` object.
  late final InstanceMirror _im = reflect(board.move);

  /// It's creating a mirror of the `board` object.
  late final InstanceMirror _imc = reflect(board);

  CrossColoring board = CrossColoring();

  /// It creates two lists of methods, one for the board and one for the move
  CommandCaller() {
    methodsMove = _listMethods(board.move);
    methodsColor = _listMethods(board);
  }

  /// If the method name is in the list of methods, call the method
  ///
  /// Args:
  ///   name (String): The name of the method to be called.
  ///   arg (List<dynamic>): The arguments passed to the function.
  ///
  /// Returns:
  ///   A boolean value.
  bool color(String name, List<dynamic> arg) {
    if (methodsColor.contains(name)) {
      return _callColorFunction(Symbol(name), arg);
    }

    return false;
  }

  /// If the method name is in the list of methods, call the method
  ///
  /// Args:
  ///   name (String): The name of the method to call.
  ///   arg (List<int>): The argument list for the function.
  ///
  /// Returns:
  ///   A boolean value.
  bool move(String name, List<int> arg) {
    if (methodsMove.contains(name)) {
      return _callMoveFunction(Symbol(name), arg);
    }

    return false;
  }

  /// It calls a function
  /// that's a member of the `_imc` object, and returns the result
  ///
  /// Args:
  ///   memberName (Symbol): The name of the member to invoke.
  ///   positionalArguments (List<dynamic>): A list of arguments to pass to the
  /// function.
  bool _callColorFunction(
    Symbol memberName,
    List<dynamic> positionalArguments,
  ) =>
      _imc.invoke(memberName, positionalArguments).reflectee;

  /// It calls a function
  /// on the Dart side, and returns the result
  ///
  /// Args:
  ///   memberName (Symbol): The name of the function to call.
  ///   positionalArguments (List<dynamic>): The arguments to pass to the function.
  bool _callMoveFunction(
    Symbol memberName,
    List<dynamic> positionalArguments,
  ) =>
      _im.invoke(memberName, positionalArguments).reflectee;

  /// It returns a list of all the public methods of an object
  ///
  /// Args:
  ///   obj (T): The object to list the methods of.
  ///
  /// Returns:
  ///   A set of strings.
  HashSet<String> _listMethods<T>(T obj) {
    final HashSet<String> methods = HashSet<String>();
    final InstanceMirror im = reflect(obj);
    final List<ClassMirror> classMirrors = <ClassMirror>[im.type];
    if (classMirrors.first.isAbstract || classMirrors.first.isEnum) {
      return methods;
    }
    if (classMirrors.first.superclass != null) {
      classMirrors.add(classMirrors.first.superclass!);
    }
    classMirrors.addAll(classMirrors.first.superinterfaces);
    for (final ClassMirror classMirror in classMirrors) {
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
