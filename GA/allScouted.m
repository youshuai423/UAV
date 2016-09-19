% 判断是否所有目标群都被侦察
function isallScouted = allScouted(chromosome)
truncated = [];
for i = 1:10:length(chromosome)
    index = find(chromosome(i : i + 9) == 0, 1) - 1;
    if (isempty(index))
        index = 10;
    end
    truncated = [truncated, chromosome(i : i + index - 1)];
end

truncated = unique(truncated);
if sum(ismember(truncated, 1:10)) == 10
    isallScouted = 1;
else
    isallScouted = 0;
end