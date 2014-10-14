% 4. if文とcase文
% a. case文でif文を定義せよ

if X then s1 else s2 end

case X
of true then s1
else s2 end

% b. if, Label, Artiy, .を使ってcase文を定義せよ
% p.68 2.4.4 パターンマッチング参照

declare X A B
A=1
B=2
X=label(a:1 b:1)
case X of label(a:A b:B) then {Browse B} else {Browse f} end

declare X A B
A=1
B=2
X=label(a:1 b:1)
if {Label X} == label andthen {Arity X} == [a b] then local A B in A = X.a B = X.b {Browse B} end
else {Browse f} end

