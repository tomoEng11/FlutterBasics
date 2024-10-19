
class Position {
  // xPositionとyPositionは外部から受け取る引数
  Position(int xPosition, int yPosition)
      : x = xPosition, y = yPosition; // 引数とパラメータを対応させる初期化リスト
  // パラメータ
  int x;
  int y;
}

// 初期化リストでアサーションを記述できる
class AbsPosition {
  AbsPosition(this.x, this.y) : assert(x > 0), assert(y > 0);
  int x;
  int y;
}

// セッタを使って変更するプロパティはprivateにしておく

// constant コンストラクタ
class Car {
  const Car(this.color, this.name);
  // constantコンストラクタのプロパティは再代入不可なのでfinal
  final String color;
  final String name;
}

// carAとcarBは同じインスタンス
// constantコンストラクタの前にconstをつける=>コンパイル定数
final carA = const Car('red', 'カローラ');
// const定数に入れる=>コンパイル定数
const carB = Car('red', 'カローラ');

// cだけは別のインスタンス
final carC = Car('red', 'カローラ');



class Point {
  const Point(this.x, this.y);
  // 名前付きコンストラクタ
  // const Point.zero() : x = 0, y = 0;

  // 名前なしコンストラクタ
  const Point.zero() : this(0,0);

  final int x;
  final int y;
}


// スーパークラスのコンストラクタ
class Animal {
  Animal(this.name);
  final String name;
}

class Dog extends Animal {
  Dog(super.name);
  // サブクラスではnameの定義なしに直接superClassのコンストラクタを流用できる
}

// extension

// これエラーでてしまう
// extension SwapList<T> on List<T> {
//
//   static bool noNeedToSwap(List<T> list) {
//     return list.isEmpty;
//   }
//
//   void swap(int index1, int index2) {
//     if (noNeedToSwap(this)) {
//       return;
//     }
//
//     final tmp = this[index1];
//     this[index1] = this[index2];
//     this[index2] = tmp;
//   }
// }

// minをclassにwithキーワードで適用する
mixin Flyable {
  void fly() {
    print("Flying!");
  }
}

class Bird with Flyable {
  void chirp() {
    print("Chirping!");
  }
}

// mixinを適用するクラスをonキーワードで限定する
class Fish  {

}

mixin Swimmable on Fish {
  void swim() {
    print('Swimming');
  }
}

// クラス修飾子

// extendsでの継承やimplementsで実装が可
abstract class Subject {
  void field() {}
}