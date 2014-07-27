% 1.18
% 6. 高階プログラミング

% (a) 引き算，掛け算等を使って各行を求めよ
% 掛け算を使うとすべてゼロになるのはなぜか

declare GenericPascal OpList ShiftLeft ShiftRight
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

fun {ShiftLeft L}
   case L of H|T then
      H|{ShiftLeft T}
   else [0] end
end

fun {ShiftRight L} 0|L end

declare
fun {Sub X Y} X-Y end

declare
fun {Mul X Y} X * Y end

{Browse {GenericPascal Sub 5}}

{Browse {GenericPascal Mul 3}}

% 掛け算を使うと全部ゼロ

% {GenericPascal Mul 1}} は [1]である
% {GenericPascal Mul 2}} は [0*1, 1*0]で[0,0]である．
% これ移行，0しかでてこない

declare
fun {Mul X Y} (X+1)*(Y+1) end
% ゼロの乗算が出てこないので，全部ゼロにはならない

{Browse {GenericPascal Mul 10}}

for I in 1..10 do {Browse {GenericPascal Mul I}} end