% finally節を持つ例外

try s1 finally s2 end

local Z X in
   Z=false
   try s1
   catch X1 then
      Z=true
      X=X1
   end
   s2
   if Z then raise X end
end
