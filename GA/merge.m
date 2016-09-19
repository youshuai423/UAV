% 对相邻的相同元素合并，并在末尾加0
% 对0元素以后的基因赋值为0
function chromosome = merge(chromo)
for i = 1 : 10 : length(chromo)
    index = find(chromo(i:i+9) == 0, 1);
    if ~isempty(index)
        for k = i + index  : i + 9
            chromo(k) = 0;
        end
    end
    
    for j = i : i + 8
        while chromo(j) == chromo(j + 1) && chromo(j) ~= 0
            for k = j + 1 : i + 8
                chromo(k) = chromo(k+1);  % 依次前移
            end
            chromo(i + 9) = 0;   % 末位赋0
        end        
    end
end
chromosome = chromo;