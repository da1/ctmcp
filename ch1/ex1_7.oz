% 1.18
% 7. 明示的状態

local X in
   X=23
   local X in
      X=44
   end
   {Browse X}
end

local X in
   X={NewCell 23}
   X:=44
   {Browse @X}
end

% それぞれ何が表示されるか説明せよ
% 最初 23
% {Browse X}のXは外側のlocalのXなので23になる

% 次 44
% Xに44が代入されて44が表示される．
