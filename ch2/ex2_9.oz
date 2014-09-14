% 9. 末尾再帰

fun {Sum1 N}
   if N==0 then 0 else N+{Sum1 N-1} end
end
fun {Sum2 N S}
   if N==0 then S else {Sum2 N-1 N+S} end
end

% (a) 核言語に展開せよ

proc {Sum1 N ?R}
   local S in
      if N==0 then R=0 else {Sum1 N-1 S} R=N+S end
   end
end

proc {Sum2 N S ?R}
   if N==0 then R=S else {Sum2 N-1 N+S R} end
end

% (b) {Sum1 10} と {Sum2 10 0}を手で実行せよ

([({Sum1 N}, Sum1->m)], {m=(proc, Φ)})

([({Sum1 N-1 S}, {N->n0, S->s0, R->r0}) (R=N+S, {N->n0, R->r0, S->s0})], {n0=10, r0, s0, m=proc})

([
  ({Sum1 N-1 S}, {N->n1, S->s1, R->r1})
  (R=N+S, {N->n1, R->s0, S->s1})
  (R=N+S, {N->n0, R->r0, S->s0})
 ], {n0=10, n1=9, r0, r1, s0, s1, m=proc})

([
  ({Sum1 N-1 S}, {N->n9, S->s9, R->r9})
  (R=N+S, {N->n9, R->s8, S->s9})
  ...
  (R=N+S, {N->n0, R->r0, S->s0})
 ], {n0=10, .. n9=1, r0, .. r9, s0, .. s9, m=proc})

s9=0
s8=1
..
s0 = 45
r0 = 55

([({Sum2 N}, Sum1->m)], {m=(proc, Φ)})
([({Sum2 N-1 N+S R}, {N->n0, S->s0, R->r0})], {n0=10, s0=0, r0})
([
  ({Sum2 N-1 N+S R}, {N->n1, S->s1, R->r0})
 ], {n0=10, s0=0, r0, n1=9, s1=9})
([
  ({Sum2 N-1 N+S R}, {N->n9, S->s9, R->r9})
 ], {n0=10 .. n9=1, s0=0 .. s9=54, r0})

10 0 0
9 10
8 19
7 27
6 34
5 40
4 45
3 49
2 52
1 54
0 55

% (c)
% Mozartで {Sum1 100000000}または{Sum2 100000000}を実行するとどうなるか

% Sum1はスタック食い潰す
% Sum2もGCしないとしたらそのうちメモリ使い果たす
