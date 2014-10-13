% 3. 宣言的プログラミング技法

% 宣言的プログラミングのよいところは，仕様を書けばそれをプログラムとして走らせることができるところである
% いやなところは，明快な仕様がときに恐ろしく悪いプログラムになることである
% 仕様がそのまままずますのプログラムになることが，宣言的プログラミングの希望である

% 操作が宣言的であるとは，同じ引数で呼ばれればいつも，他の計算状態に無関係に同じ結果を返す事を言う.

% 3.2 反復計算
% 3.2.1 一般的図式
% 3.2.2 数についての反復

% ニュートン法による求根

declare Sqrt SqrtIter Improve GoodEnough Abs
fun {Sqrt X}
   Guess=1.0
in
   {SqrtIter Guess X}
end

fun {SqrtIter Guess X}
   if {GoodEnough Guess X} then Guess
   else
      {SqrtIter {Improve Guess X} X}
   end
end

fun {Improve Guess X}
   (Guess + X/Guess) / 2.0
end
fun {GoodEnough Guess X}
   {Abs X-Guess*Guess}/X < 0.00001
end
fun {Abs X} if X < 0.0 then ~X else X end end

{Browse {Sqrt 4.0}}

% ニュートン法による求根（第二版）

declare Sqrt
local
   fun {Improve Guess X}
      (Guess+X/Guess)/2.0
   end
   fun {GoodEnough Guess X}
      {Abs X-Guess*Guess}/X < 0.00001
   end
   fun {SqrtIter Guess X}
      if {GoodEnough Guess X} then Guess
      else
	 {SqrtIter {Improve Guess X} X}
      end
   end
in
   fun {Sqrt X}
      Guess=1.0
   in
      {SqrtIter Guess X}
   end
end

{Browse {Sqrt 4.0}}

% ニュートン法による求根（第三版）

declare Sqrt
fun {Sqrt X}
   fun {SqrtIter Guess X}
      fun {Improve Guess X}
	 (Guess + X/Guess) / 2.0
      end
      fun {GoodEnough Guess X}
	 {Abs X - Guess * Guess} / X < 0.00001
      end
   in
      if {GoodEnough Guess X} then Guess
      else
	 {SqrtIter {Improve Guess X} X}
      end
   end
   Guess=1.0
in
   {SqrtIter Guess X}
end
{Browse {Sqrt 4.0}}

% ニュートン法による求根（第四版）

declare Sqrt
fun {Sqrt X}
   fun {SqrtIter Guess}
      fun {Improve}
	 (Guess + X / Guess) / 2.0
      end
      fun {GoodEnough}
	 {Abs X - Guess * Guess } / X < 0.00001
      end
   in
      if {GoodEnough} then Guess
      else
	 {SqrtIter {Improve}}
      end
   end
   Guess=1.0
in
   {SqrtIter Guess}
end

% ニュートン法による求根（第五版）

declare Sqrt
fun {Sqrt X}
   fun {Improve Guess}
      (Guess + X / Guess) / 2.0
   end
   fun {GoodEnough Guess}
      {Abs X-Guess*Guess} / X < 0.00001
   end
   fun {SqrtIter Guess}
      if {GoodEnough Guess} then Guess
      else
	 {SqrtIter {Improve Guess}}
      end
   end
   Guess=1.0
in
   {SqrtIter Guess}
end
