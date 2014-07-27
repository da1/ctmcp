% 1.18
% 2. 組み合わせの問題

% もっと速いCombを作れ

% (a)

declare
fun {Fact N M}
   if N==M then N else
      if N==0 then 1 else N*{Fact N-1 M} end
   end
end

declare
fun {Comb N K}
   if K==0 then 1 else
      {Fact N N-K+1} div ({Fact K 1})
   end
end

{Browse {Comb 10 3}}
{Browse {Comb 10 0}}

% (b) 更に効率的にするために次の恒等式を利用せよ

{Browse {Comb 10 7}}

declare
fun {CombB N K}
   if K==0 then 1 else
      if K > (N div 2) then
	 {Comb N N-K}
      else
	 {Comb N K}
      end
   end
end

{Browse {CombB 10 7}}