% 宣言的計算モデル

% 計算モデル
% 計算モデルとは形式的体型であって一つの言語を定義し，かつその言語の命令が抽象マシンによってどのように実行されるかを定義するものである．

% 計算モデルの言語でプログラムを書くのに使うプログラミング技法と設計原則の集合である
% これをプログラミングモデルという

% プログラムが正しく振る舞うという確信を深め，プログラムの効率を算定するために，プログラムについて推論することを可能にする推論技法の集合である．

% 2.1 実用的プログラミング言語についての定義
% 2.1.1 言語の構文

% 拡張バッカスナウア記法

% 文脈自由文法と文脈依存文法

% あいまい性

% 2.1.2 言語の意味

% 2.2 単一代入格納域

% 2.2.3 値生成

% 2.2.4 変数識別子

% 変数識別子から格納域実態への写像を環境という

% 2.2.6 部分値
% 部分値とは束縛されていない変数を含んでいるかもしれないデータ構造

% 2.2.7 変数の変数への束縛

% 2.2.8 データフロー変数
% この本の実行モデルでは，未束縛の変数を使おうとすると，変数が束縛されるまで待つという方法を取る．
% このような宣言的変数をデータフローという
% 並列プログラミングにおいて極めて有効である

% 2.3 核言語

% 2.3.1 構文

% 2.3.2 値と型

% 2.3.3 基本型

% リスト
% リストはアトムnilであるか，タプル`|`(H T)である
% ここで，Tは束縛されていないかリストに束縛されている

% 2.3.4 レコードと手続き
% レコードはリスト，木，キューなどほとんどのデータ構造の基本要素である
% 言語がレコードを支援する仕方の上手下手によって，さらなる威力を発揮する

% レコードを扱う操作の例
% フィールドを追加，削除，選択，またリストへ，リストからの変換
% このレベルでレコードを支援する言語を記号的言語という

% 2.4 核言語の意味
% 静的スコープ対動的スコープ
% 静的スコープ プログラムのある場所に現れている識別子に対応する変数はその流れを取り囲む，もっとも内側の宣言で定義された変数である
% 動的スコープ プログラム中のある場所に現れている識別子に対応する変数は，その流れを含む文の実行に至るまでに，最も間近に実行された宣言で定義された変数である

% はじめのLisp言語は動的スコープであったが，common listやschemeは静的スコープである
% どちらがデフォルトなのが正しいのだろうか
% 静的スコープが正しい
% ある手続きが定義されたときに稼働中の手続きは，それが呼ばれた時の環境に無関係に稼働を続ける
% これは重要なソフトウェアエンジニアリング的性質である

% 2.4.2 抽象マシン

% 2.5 メモリ管理

% メモリの振る舞いを見る
% 計算の進行とともに，意味スタックと格納域の大きさがどのように変化するか見てみよう．
% 末尾呼び出し最適化の原理に触れ，それを抽象マシンを使って説明する．
% それによって，メモリライフサイクルとガーベッジコレクションに導かれる．

% 2.5.1 末尾呼び出し最適化

% 2.5.2 メモリライフサイクル
% 抽象マシンの意味から，実行可能プログラムに取って必要なのは，意味スタック上の情報と，意味スタックから到達可能な格納域の部分だけだ．
% 意味スタックと，格納域の到達可能な部分を併せてアクティブメモリと呼ぶ．

% 2.6 核言語から実用的言語へ

