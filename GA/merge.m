function chromosome = merge(chromo)
for i = 1  : 10 : length(chromo)
    for j = i : i + 8
        while chromo(j) == chromo(j + 1) && chromo(j) ~= 0
            for k = j + 1 : i + 8
                chromo(k) = chromo(k+1);
            end
            chromo(i + 9) = 0; 
        end        
    end
end
chromosome = chromo;