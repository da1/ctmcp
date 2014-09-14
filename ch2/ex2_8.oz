% 8. 制御抽象

% (a) AndThen

fun {AndThen BP1 BP2}
   if {BP1} then {BP2} else false end
end

% {AndThen fun {$} <expression>1 end fun {$} <expression>2 end}
% と
% <expression>1 andthen <expression>2
% と同じ結果になるか
% おなじ状況でexpression2の計算をしないで済むか

% おなじだよ

% (b) orelseに対するOrElseを書け

fun {OrElse BP1 BP2}
   if {BP1} then true else {BP2} end
end
