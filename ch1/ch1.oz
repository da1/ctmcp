% 1. プログラミング概念入門

% 1.1 計算器

{Browse 9999*9999}

% 1.2 変数

declare
V=9999*9999
{Browse V}

% 1.3 関数

{Browse 1*2*3*4*5*6*7*8*9*10}

declare
fun {Fact N}
   if N==0 then 1 else N*{Fact N-1} end
end

{Browse {Fact 10}}

declare
fun {Comb N K}
   {Fact N} div ({Fact K} * {Fact N-K})
end

{Browse {Comb 10 3}}

% 1.4 リスト

{Browse [5 6 7 8]}

declare
H=5
T=[6 7 8]
{Browse H|T}

declare
L=[5 6 7 8]
{Browse L.1}
{Browse L.2}

% パターンマッチング
declare
L=[5 6 7 8]
case L of H|T then {Browse H} {Browse T} end

% 1.5 リストについての関数
% メイン関数
declare Pascal AddList ShiftLeft ShiftRight
fun {Pascal N}
   if N==1 then [1]
   else
      {AddList {ShiftLeft {Pascal N-1}} {ShiftRight {Pascal N-1}}}
   end
end

fun {ShiftLeft L}
   case L of H|T then
      H|{ShiftLeft T}
   else [0] end
end

fun {ShiftRight L} 0|L end

fun {AddList L1 L2}
   case L1 of H1|T1 then
      case L2 of H2|T2 then
	 H1+H2|{AddList T1 T2}
      end
   else nil end
end

{Browse {Pascal 20}}

% 1.6 プログラムの正しさ
% プログラムが正しいことをどのようにして知るか
% プログラミング言語の操作が何をすべきかを定義する数学的モデルが必要である．このモデルは言語の意味（semantics）といわれる．
% プログラムに何をしてもらいたいかを定義する必要がある．普通，これはプログラムが必要とする入力と結果の出力の数学的定義である．プログラムの仕様（specification）と言われる．
% 意味を考慮しながら，数学的技法を使ってプログラムに関して推論する．プログラムが仕様を満たしていることを証明したい．

% 1.7 計算量

% Pascalは遅い．{Pascal N-1}を呼ぶのを一回にすればいい

declare
fun {FastPascal N}
   if N==1 then [1]
   else L in
      L={FastPascal N-1}
      {AddList {ShiftLeft L} {ShiftRight L}}
   end
end

{Browse {FastPascal 30}}

% 1.8 遅延計算
% ここまで出てきた関数は呼ばれるとすぐ計算を行うものであった．
% こういう計算の仕方を性急計算（eager evaluation）という．
% 別に，遅延計算（lazy evaluation）と呼ばれる関数計算法もある．

declare
fun lazy {Ints N}
   N|{Ints N+1}
end

declare
L={Ints 0}
{Browse L}

{Browse L.1}

case L of A|B|C|_ then {Browse A+B+C} end


% パスカルの三角形の遅延計算

declare
fun lazy {PascalList Row}
   Row|{PascalList
	{AddList {ShiftLeft Row} {ShiftRight Row}}}
end

declare
L={PascalList [1]}
{Browse L}

{Browse L.1}
{Browse L.2.1}

declare
fun {PascalList2 N Row}
   if N==1 then [Row]
   else
      Row|{PascalList2 N-1
	   {AddList {ShiftLeft Row} {ShiftRight Row}}}
   end
end

{Browse {PascalList2 10 [1]}}

% 1.9 高階プログラミング
% 関数を引数として渡す能力は高階プログラミング（highter-order programing）といわれる．

declare GenericPascal OpList
fun {GenericPascal Op N}
   if N==1 then [1]
   else L in
      L={GenericPascal Op N-1}
      {OpList Op {ShiftLeft L} {ShiftRight L}}
   end
end

fun {OpList Op L1 L2}
   case L1 of H1|T1 then
      case L2 of H2|T2 then
	 {Op H1 H2}|{OpList Op T1 T2}
      end
   else nil end
end

% パスカルの三角形の変種

declare
fun {Add X Y} X+Y end

declare
fun {FastPascal N} {GenericPascal Add N} end

declare
fun {Xor X Y} if X==Y then 0 else 1 end end

% 1.10 並列性
% threadを生成することで並列性を導入する

thread P in
   P={Pascal 30}
   {Browse P}
end
{Browse 99*99}

% 1.11 データフロー

% まだ束縛されていない変数を使おうとする．
% 審美的な観点からは，その操作が単に待つのが良い，別のスレッドがその変数の束縛を行い，そうしたらその操作が続行できるようになる
% この洗練された振る舞いはデータフローと呼ばれる．

declare X in
thread {Delay 10000} X=99 end
{Browse start} {Browse X*X}

% 最初のBrowseは直ちにstartを表示する．2番目のBrowseは掛け算を持ち，掛け算X*XはXが束縛されるまで待つ
% Delayが10000msec待ってから，Xへの束縛が行われる．

declare X in
thread {Browse start} {Browse X*X} end
{Delay 10000} X=99

% 結果は先の例と同じ

% 1.12 明示的状態
% どうしたら関数にその過去から学ばせることができるか

% メモリセル

declare
C={NewCell 0}
C:=@C+1
{Browse @C}

% FastPascalにメモリセルを追加する

declare
C={NewCell 0}

declare
fun {FastPascal N}
   C:=@C+1
   {GenericPascal Add N}
end

% 1.13 オブジェクト
% 内部メモリを持つ関数は普通オブジェクトと呼ばれる．

declare
local C in
   C={NewCell 0}
   fun {Bump}
      C:=@C+1
      @C
   end
   fun {Read}
      @C
   end
end

% インタフェースとその実装を分離することはデータ抽象の本質である．
% それにより，ユーザプログラムが大幅に簡単になる．
% この性質は，多様性（polymorphism）といわれる．
% カプセル化と多様性を持つデータ抽象（data abstraction）については6章で説明する

declare
fun {FastPascal N}
   {Browse {Bump}}
   {GenericPascal Add N}
end

{Browse {FastPascal 5}}

% 1.14 クラス
declare
fun {NewCounter}
C Bump Read in
   C = {NewCell 0}
   fun {Bump}
      C:=@C+1
      @C
   end
   fun {Read}
      @C
   end
   counter(bump:Bump read:Read)
end

declare
Ctr1={NewCounter}
declare
Ctr2={NewCounter}

{Browse {Ctr1.bump}}

% オブジェクト指向プログラミングに向けて
% クラスとオブジェクトを用いてプログラミングすることをオブジェクトベースプログラミングという
% オブジェクトベースプログラミングに継承（inheritance）という新しい考え方を加えると
% オブジェクト指向プログラミングになる．

% 1.15 非決定性と時間
% プログラムに並列性と明示的状態をどのようにして付け加えるのか別々に見てきた．
% プログラムに両者を一緒に加えるとどうなるか？両者同時には危ない橋である．

% スレッドが明示的状態にアクセスする順序が実行のたびに違うことがあり，一定しないことを非決定性（nondeterminism）という．

declare
C={NewCell 0}
thread
   C:=1
end
thread
   C:=2
end

% このプログラム実行後のCの内容は，どちらとも言い切れず非決定性の簡単な例になる．

declare
C={NewCell 0}
thread I in
   I=@C
   C:=I+1
end
thread J in
   J=@C
   C:=J+1
end

% このプログラム実行後，最終的に1になることもありうる．

% 明示的状態と並列性を使うプログラミングに関する教訓
% 可能であるにしても両方を一緒に使うな

% 1.16 原始性
% 並列性と明示的状態を一緒に使ってプログラムする仕方
% 容易ににする一法は，原始的（atomic）操作を使うことである．

declare
C={NewCell 0}
declare
L={NewLock}
thread
   lock L then I in
      I=@C
      C:=I+1
   end
end
thread
   lock L then J in
      J=@C
      C:=J+1
   end
end
{Browse @C}

% 1.17 ここからどこへ行くのか
% 宣言的モデル（2,3章）
% 宣言的並列モデル（4章）
% 宣言的遅延モデル（4.5節）
% 状態ありモデル（6勝）
% オブジェクト指向モデル（7章）
% 状態共有並列モデル（8章）