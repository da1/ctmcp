% 10 核言語への展開

fun {SMerge Xs Ys}
   case Xs#Ys
   of nil#Ys then Ys
   [] Xs#nil then Xs
   [] (X|Xr)#(Y|Yr) then
      if X=<Y then X|{SMerge Xr Ys}
      else Y|{SMerge Xs Yr} end
   end
end

declare SMerge
local SMerge in
SMerge = proc {$ Xs Ys ?R}
   case Ys of nil then R=Ys
   else
      case Xs of nil then R=Xs
      else
	 case Xs of X|Xr then
	    case Ys of Y|Yr then
	       if X=<Y then
		  local Z Zr in
		     R=Z|Zr
		     Z=X
		     {SMerge Xr Ys Zr}
		  end
	       else
		  local Z Zr in
		     R=Z|Zr
		     Z=Y
		     {SMerge Xs Yr Zr}
		  end
	       end
	    end
	 end
      end
   end
	 end
end

