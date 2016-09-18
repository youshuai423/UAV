function isallScouted = allScouted(chromosome)
truncated = [];
% false = 0;
for i = 1:10:length(chromosome)
    index = find(chromosome(i : i + 9) == 0, 1) - 1;
    if (isempty(index))
        index = 10;
    end
%     if length(unique(chromosome(i : i + index - 1))) ~= length(chromosome(i : i + index - 1))
%         false = 1;
%         break;
%     end
    truncated = [truncated, chromosome(i : i + index - 1)];
end

truncated = unique(truncated);
if sum(ismember(truncated, 1:10)) == 10
    isallScouted = 1;
else
    isallScouted = 0;
end