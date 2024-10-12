
class Switch {
  // 実行が1行なら{}の省略可
  void getFile() {
    final now = DateTime.now();
    if (now.hour >= 6) print(now);
  }

// if 変数　case (条件)でパターンマッチング　（nullチェック）
  void getResponse() {
    const (String?, int?) response = ('OK', 200);
    if (response case (String message, int statusCode)) {
      print('response: $message, status: $statusCode');
    } else {
      print('No response recieved');
    }
  }

  // whenで条件を絞り込む
  void getValidResponse() {
    const (String?, int?) response = ('OK', 200);
    if (response case (String message, int statusCode) when statusCode == 200) {

    } else {

    }
  }

// Switch文の基本
  void getWeekDay() {
    String day = 'Monday';

    switch (day) {
      case 'Monday':
      print('ジャンプ発売日');
      case 'Wednesday':
      print('ブルーロックをよめ');
      case 'Tuesday':
      case 'Friday':
      print('なんもしない');
      case 'Saturday':
      case 'Sunday':
      print('遊ぶ');
      default:
      break;
    }
  }

  String rockPaperScissors() {
    const yourChoice = 'rock';
    switch (yourChoice) {
      case 'rock':
      return 'Rock';
      case 'paper':
      return 'Paper';
      case 'scissors':
      return 'Scissors';
      default:
      return 'Nothing';

    }
  }

  // 文：　特定のアクションの実行
  // 式: 値を評価し変換する

  // Switch式での表現
  String rockPaperScissors2(String yourChoice) {
    final choice = switch (yourChoice) {
      'rock' => 'Rock',
      'paper' => 'Paper',
      'scissors' => 'Scissors',
      _ => 'Nothing',
    };
    return choice;
  }


// continueとラベルを使ったFallThrough
// 可読性が下がるみたいなので使い方に注意!!!
  void playContinue() {
    const String color = 'red';
    switch (color) {
      case 'red':
      print('red');
      continue other;
      case 'blue':
      print('blue');
      other:
      case 'black':
      throw 'error';
    }
  }

// caseで　nullチェックした上でwhenで限定する(特定の範囲を表現)
  void checkPrice() {
    final int? statusCode= null;
    switch (statusCode) {
      case (int status) when 100 <= statusCode && statusCode < 200:
      print('情報');
      case (int status) when 200 <= statusCode && statusCode < 300:
      print('成功');
      case (int status) when 300 <= statusCode && statusCode < 400:
      print('リダイレクト');
      case (int status) when 400 <= statusCode && statusCode < 500:
      print('クライアントエラー');
      case (int status) when 500 <= statusCode && statusCode < 600:
      print('サーバーエラー');
      default:
      print('unknown');
    }
  }

  // while文とdo-while
  void repeat() {
    final bool isInit = false;
    while (isInit) {
      print('初期化済み');
    }

    do {
        print('初期化済み');
    } while (isInit);
  }

  void increment() {
    for (int i = 0; i < 20; i++) {
      print(i);
    }
  }

// 先に++の処理を行ってiを使う
// 結局違いがよくわからなかった
  void firstIncrement() {
    for (int i = 0; i < 10; ++i) {
      print(i);
    }
  }

// 先にiを使ってから++の処理をする
// 結局違いがよくわからなかった
  void lastIncrement() {
    for (int i = 0; i < 15; i++) {
      print(i);
    }
  }

// breakはloopから抜ける時に使う
  void utilFive() {
    for (int i = 0; i < 10; i++) {
      if (i == 5) {
        break;
      }
      print(i);
    }
    print('関数終了');
  }

// continueは次のループへ移行させる
  void skipEvenNumbers() {
    for (int i = 0; i < 10; i++) {
      if (i % 2 == 0) {
        continue;
      }
      print(i);
    }
  }

  // マッチングと分解宣言

// Listのマッチングと分解宣言
// 対応するindexからマッチングさせ、各要素の変数の宣言をできる
// List<dynamic>なので要素の方は不一致でもいける
  void listMatching() {
    final [red, blue, green,] = ['赤', '青', 233];
    print('$red, $blue, $green');
  }

// Mapのマッチングと分解宣言
  void mapMatching() {
    final {200: success, 400: notFound} = {
      200: 'OK',
      400: 'Not Found',
      500: 'Server Error',
      };
      print('$success, $notFound');
  }

// Recordのマッチングは名前付きか位置パラメータかも一致させる必要がある
  void record1() {
    final data = (imageName: '001.jpg', timeStamp: 'DateTime.now()');
    // :の後に変数を書いて宣言
    final (:imageName, :timeStamp) = data;
    print('$imageName, $timeStamp');
  }

// record1はこれと同じ
  void record2() {
     // 名前付きレコードの定義
  final data = (imageName: '001.jpg', timeStamp: DateTime.now());

  // レコードからフィールド名を使って値を取り出す
  final imageName = data.imageName; // フィールド名を使ってアクセス
  final timeStamp = data.timeStamp;

  // 出力
  print('$imageName, $timeStamp');
  }

  // Objectの分解宣言もある

  // for-inによる分解宣言もある
  // ただし、Mapはentriesプロパティーを使ってObjectとして分解宣言する必要がある

  // nullチェック
  // パターンマッチングの際に、変数名の後ろに?をつけるとnullじゃない時を表現
  void checkNull() {
    const int? code = null;
    switch (code) {
      case final i? when i > 0:
      print('正の整数です');
      default:
      print('0以下の整数かnull');
    }

  }
}