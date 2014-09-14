% 6 case文再訪

declare Test
proc {Test X}
   case X of f(a Y c) then {Browse 'case(1)'}
   else {Browse 'case(2)'} end
end

declare X Y {Test f(X b Y)}
% wait
declare X Y {Test f(a Y d)}
% case(2)
declare X Y {Test f(X Y d)}
% wait

declare X Y
if f(X Y d) == f(a Y c) then {Browse 'case(1)'}
else {Browse 'case(2)'} end
