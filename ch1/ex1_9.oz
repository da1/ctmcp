% 1.18
% 9 記憶域

% (a)
declare
fun {NewStore}
   D={NewDictionary}
   C={NewCell 0}
   proc {Put K X}
      if {Not {Dictionary.member D K}} then
         C:=@C+1
      end
      D.K:=X
   end
   fun {Get K} D.K end
   fun {Size} @C end
in
   storeobject(put:Put get:Get size:Size)
end

proc {Put S K X} {S.put K X} end
fun {Get S K} {S.get K} end
fun {Size S} {S.size} end

declare
S={NewStore}
{Put S 2 [22 33]}
{Browse {Get S 2}}
{Browse {Size S}}

% (b)
% 記憶域を使って，FasterPascalというFastPascalの改良版をつくれ

declare ShiftLeft ShiftRight AddList FasterPascal
fun {ShiftLeft L}
   case L of H|T then
      H|{ShiftLeft T}
   else [0] end
end

fun {ShiftRight L} 0|L end

fun {AddList L1 L2}
   case L1 of H1|T1 then
      case L2 of H2|T2 then
         H1+H2|{AddList T1 T2}
      end
   else nil end
end

declare
fun {FastPascal N}
   if N==1 then [1]
   else L in
      L={FastPascal N-1}
      {AddList {ShiftLeft L} {ShiftRight L}}
   end
end

declare
local S
   S = {NewStore}
in
   fun {FasterPascal N}
      if N==1 then [1]
      else
	 if {Size S} >= N then
	    {Get S N}
	 else L in
	    L = {FasterPascal N-1}
	    {Put S N {AddList {ShiftLeft L} {ShiftRight L}}}
	    {Get S N}
	 end
      end
   end
end

{Browse {FasterPascal 20}}

% (c)
declare
fun {MyNewStore}
   {NewCell nil}
end

declare
proc {MyPut S Key Value}
   S:=(Key|Value)|@S
end

declare
fun {MyGet S Key}
   fun {Assoc L}
      case L of (K1|Value)|T then
	 if K1 == Key then Value
	 else {Assoc T} end
      else nil end
   end
in
   {Assoc @S}
end

% (d)
% 1.13のカウンタオブジェクトを使って，記憶域の大きさを維持できるように記憶域の実装を変更せよ

declare
local C in
   C={NewCell 0}
   fun {Bump}
      C:=@C+1
      @C
   end
   fun {Read}
      @C
   end
end

declare
proc {MyPut S Key Value}
   if {MyGet S Key} == nil then _ = {Bump} in
      S:= (Key|Value)|@S
   else
      S:=(Key|Value)|@S
   end
end

declare
fun {MySize S}
   {Read}
end

declare
S={MyNewStore}
{MyPut S 2 [22 33]}
{Browse {MyGet S 2}}
{Browse {MySize S}}