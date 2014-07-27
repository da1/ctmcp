% 1.18
% 5 遅延計算
% 1.8で整数の無限リストを遅延計算する関数Intsを定義した．
% 整数のリストの和を計算する関数を定義しよう．

declare
fun {SumList L}
   case L of X|L1 then X+{SumList L1}
   else 0 end
end

declare
fun lazy {Ints N}
   N|{Ints N+1}
end

{SumList {Ints 0}}

% とするとどうなるか

% 終わんない