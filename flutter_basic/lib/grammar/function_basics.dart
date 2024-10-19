
class FunctionBasics {

  // 省略可能な引数
  // ただし引数なしだとnullになる
  // 省略可能引数は末尾におく
  void enterUserInfo(String name, int age, [String? email]) {
    print('$name,$age,$email');
  }

  // 省略可能な引数(デフォルト引数あり)
  // nullではない型として扱える
  // 省略可能引数は末尾におく
  void enterUserInfo2(String name, int age, [String email = '']) {
    print('$name,$age,$email');
  }

  // 名前付き引数
  // {}で囲う
  // 省略可能にしたら指定しないとnull
  void yourLanguage({String? kotlin, String? swift, String? dart}) {

  }

  void whatIsYourLanguage() {
    yourLanguage();
    yourLanguage(kotlin: 'Kotlin1年目');
  }

  // 定義時は位置引数は前
  void makeColor(String colorName, {required int red, required int blue}) {

  }

  // 呼び出し時は任意
  void yourColor() {
    makeColor(red: 1, '私のカラーは白' ,blue: 2);
  }


  // クロージャーを生成する関数
  Function multiple(int i) {
    return (x) => x * i;
  }

  void exeClosure() {
    final f1 = multiple(3);
    final f2 = multiple(4);

    print(f1(9));
  }

  // 高階関数は処理を抽象化することで再利用性を高めている

  // mapはある要素Yを受け取ってIterable<Y>に変換する
  // iterableはList、Set、Mapなど。(ここも抽象化して表現)
  // 引数の関数はある要素Xを受け取ってYに変換する
  // 関数の変換処理も抽象化
  void seeHowMapWorks() {
    final numbers = [1,2,3,4,5];
    final doubledNumbers = numbers.map((n) => n * 2);
    print(doubledNumbers);
  }


  // 抽象的な変換をするクロージャーを返す関数を作る
  // n倍にするクロージャーを返す関数
  Function multipleN(int n) {
    return (int value) => value * n;
  }

  void seeHowMultiplierWorks() {
    // 3倍にする関数の定義
    var triple = multipleN(3);
    int result = triple(10);
    print(result);
  }


}