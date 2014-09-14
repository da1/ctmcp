% 4. if文とcase文
% a. case文でif文を定義せよ

if X then s1 else s2 end

case X
of true then s1
else s2 end

% b. if, Label, Artiy, .を使ってcase文を定義せよ
% p.68 2.4.4 パターンマッチング参照

case X of label(a:x1 b:x2) then s1 else s2 end

if {Label X} == label andthen {Arity X} == [a b] then s1
else s2 end

