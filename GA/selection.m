% 轮盘赌选择操作
function population = selection(population, elitism, fitness_sum)
% elitism 精英选择
[population_size, chromosome_size] = size(population);
population_new = zeros(population_size, chromosome_size);

for i=1:population_size
    r = rand * fitness_sum(population_size);  % 生成一个随机数，在[0,总适应度]之间
    first = 1;
    last = population_size;
    mid = round((last+first)/2);
    idx = -1;
    
    % 排中法选择个体
    while (first <= last) && (idx == -1) 
        if r > fitness_sum(mid)
            first = mid;
        elseif r < fitness_sum(mid)
            last = mid;     
        else
            idx = mid;
            break;
        end
        mid = round((last+first)/2);
        if (last - first) == 1
            idx = last;
            break;
        end
    end
   
   % 产生新一代个体
   population_new(i,:) = population(idx,:);
end

% 是否精英选择
if elitism
    population(1:population_size-1,:) = population_new(1:population_size-1,:);
else
    population = population_new;
end

clear i;
clear j;
clear population_new;
clear first;
clear last;
clear idx;
clear mid;
 

