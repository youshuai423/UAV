% 交叉操作
function population = crossover(population, cross_rate)
% population_size 种群大小
% chromosome_size 染色体长度
[population_size, chromosome_size] = size(population);
ScoutedTime = 0;  % 交叉尝试次数

% 步长为2 遍历种群
for i=1:2:population_size
    % rand<交叉概率，对两个个体的染色体串进行交叉操作
    while(1)
        population1 = population(i,:);
        population2 = population(i + 1,:);
        if(rand < cross_rate)
            cross_position = round(rand * chromosome_size);
            if (cross_position == 0 || cross_position == chromosome_size)
                continue;
            end
            % 对 cross_position及之后的基因进行交换
            temp = population1(cross_position:chromosome_size);
            population1(cross_position:chromosome_size) = population2(cross_position:chromosome_size);
            population2(cross_position:chromosome_size) = temp;
            % 消除相邻的相同基因
            population1 = merge(population1);
            population2 = merge(population2);
        end
        if allScouted(population1) && allScouted(population2)  % 两个个体都含有所有目标群
            population(i, :) = population1;
            population(i + 1, :) = population2;
            break;
        elseif ScoutedTime > 100  % 超过100次不成功就跳过
            break;
        else
            ScoutedTime = ScoutedTime + 1;
        end
    end
    ScoutedTime = 0;
end

clear i;
clear j;
clear temp;
clear cross_position;

