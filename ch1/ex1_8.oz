% 1.18
% 8 明示的状態と関数
% すべての呼び出しの引数を合計する関数 {Accumulate N}をつくろう

% 例示のものは毎回Accを初期化しているので正しい結果にならない

declare
local Acc
   Acc={NewCell 0}
in
   fun {Accumulate N}
      Acc:=@Acc+N
      @Acc
   end
end

{Browse {Accumulate 5}}
{Browse {Accumulate 100}}
{Browse {Accumulate 45}}

