% 变异操作，随机选择两个基因并交换
function population = mutation(population, mutate_rate)
[population_size, chromosome_size] = size(population);

for i=1:population_size
    while(1)
        population1 = population(i, :);
        if rand < mutate_rate
            mutate_position1 = round(rand*chromosome_size);  % 变异位置
            mutate_position2 = round(rand*chromosome_size);  % 变异位置
            if mutate_position1 == 0 || mutate_position2 == 0
                % 若变异位置为0，不变异
                continue;
            end
            % 交换基因
            temp = population1(mutate_position1);
            population1(mutate_position1) = population1(mutate_position2);
            population1(mutate_position2) = temp;
            population1 = merge(population1); % 消除相邻相同基因
            
            if allScouted(population1)  % 判断所有目标群均被侦察
                population(i, :) = population1;
                break;
            end
        end
    end
end

clear i;
clear mutate_position1;
clear mutate_position2;
