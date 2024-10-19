class NullSafety {

  // ドキュメントコメント

  /// これは自作の関数です
  /// 
  /// 引数なしで返り値もなし
  void originalFunc() {
    print('自作の関数');
  }

  // 呼び出し元でドキュメントが表示されるようになる
  void func() {
    originalFunc();
  }

  // optionalは初期化を省略するとnullで初期化される。
  // 使う時はnullチェックが必要
  void instantiateNull() {
    String? userName;
    if (userName != null) {
      print(userName);
    } else {
      print('nullです');
    }
  }

  // null認識演算子

  // nullじゃない時のみ実行される
  void checkStringLength() {
    String? str;
    print(str?.length);
  }


  // null関連演算子

  // nullの時にだけ代入される
  void nullCheck() {
    int? babyAge = null;
    babyAge ??=  0;
    print(babyAge);
  }
}
