% 1.18
% 10 明示的状態と並列性
% 1.15節に2つのスレッドから更新される一つのカウンタをセルに格納する例を挙げた

declare
C={NewCell 0}
thread
   C:=1
end
thread
   C:=2
end
{Browse @C}

% (a)
% 何度やっても2だった
% 一つ目のスレッドが一瞬で終わってしまって，2つ目と順番が入れ替わらないからか

% (b)
declare
C={NewCell 0}
thread
   {Delay 10}
   C:=1
end
thread
   C:=2
end
{Browse @C}

% (c) 1.16節に結果が決して1にならないカウンタがある
% 1を得ようとして遅延技法を使うとどうなるか

% delay入れても結果を得るのが遅くなるだけで，1にはできない
