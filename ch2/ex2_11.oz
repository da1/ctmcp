% 11 相互再帰
% 一般的な末尾呼び出し最適化の方が，単なる末尾再帰最適化より重要である

fun {IsEven X}
   if X==0 then true else {IsOdd X-1} end
end

fun {IsOdd X}
   if X==0 then false else {IsEven X-1} end
end

proc {IsEven X ?R}
   ...
end

([({IsEven X ?R}, {X->x0, R->r0})], {x0->2})
([({IsOdd X ?R}, {X->x1 R->r0})], {x0->2, x1->1})
([({IsEven X ?R}, {X->x2 R->r0})], {x0->2, x1->1, x2->2})

% IsEvenとIsOddが切り替わるだけでスタックサイズ自体はかわらない