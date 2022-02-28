import 'board.dart';

void main(List<String> arguments) {
  Board b = Board();
  // b.move.toPosition(5, 2);
  // print(b.up([1]));
  print(b.move.diagonalUpRight());
  print(b.square([1]));
  // print(b.lUpLeft([1]));
  // print(b.up([1,2]));
  // b.move.right();
  // print(b.down([2,1]));
  // print(b);
  // b.move.left();
  // print(b.diagonalUpRight([3]));
  // b.move.down();
  // print(b.diagonalUpLeft([4]));
  // print(b);
  // b.move.right();
  // print(b.diagonalDownLeft([5]));
  // b.move.up();
  // print(b.diagonalDownRight([6]));
  // print(b);
  // b.move.toPosition(2, 0);
  // b.move.right();
  // print(b.right([7]));
  // b.move.down();
  // b.move.left();
  // print(b.left([8]));
  print(b);
  print(b.getBoard);
}
