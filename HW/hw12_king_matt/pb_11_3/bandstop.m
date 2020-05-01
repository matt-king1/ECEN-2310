function rv = bandstop(F, bounds)
    if size(bounds) ~= [1,2] | bounds(1) > bounds(2)
       error("Malformed band")
    end
    
    high = bounds(1);
    low = bounds(2);
    rate = size(F,1);
  
    rv = [F(1:low,:);
        zeros(rate-(high-low), size(F,2));
        F(high:end,:)];
end

