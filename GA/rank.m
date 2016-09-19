% 对个体按适应度大小进行排序，并且保存最佳个体
% population_size: 种群大小
% chromosome_size: 染色体长度

function [fitness_sum, fitness_average, best_fitness, best_individual, best_generation, bestDistance] = ...
         rank(population, fitnessValue, offspring, best_fitness, best_individual, best_generation)

[population_size, ~] = size(population);

fitness_sum = zeros(population_size,1);

% 遍历种群 
% 冒泡排序
% 最后population(i)的适应度随i递增而递增，population(1)最小，population(population_size)最大
for i=1:population_size
    min_index = i;
    for j = i+1:population_size
        if fitnessValue(j) < fitnessValue(min_index)
            min_index = j;
        end
    end
    
    if min_index ~= i
        % 交换 fitnessValue(i) 和 fitnessValue(min_index) 的值
        temp = fitnessValue(i);
        fitnessValue(i) = fitnessValue(min_index);
        fitnessValue(min_index) = temp;
        % 此时 fitnessValue(i) 的适应度在[i,population_size]上最小
        
        % 交换 population(i) 和 population(min_index) 的染色体串
        temp_chromosome = population(i,:);
        population(i,:) = population(min_index,:);
        population(min_index,:) = temp_chromosome;
    end

end

% fitness_sum(i) = 前i个个体的适应度之和
fitness_sum(1) = fitnessValue(1); 
for i = 2:population_size
    fitness_sum(i) = fitness_sum(i-1) + fitnessValue(i);
end

% fitness_average(offspring) = 第offspring次迭代 个体的平均适应度
fitness_average = fitness_sum(population_size) / population_size; 
bestDistance = 500 / fitnessValue(population_size);
% 更新最大适应度和对应的迭代次数，保存最佳个体(最佳个体的适应度最大)
if fitnessValue(population_size) > best_fitness
    best_fitness = fitnessValue(population_size);
    best_generation = offspring;
    best_individual = population(population_size,:);
end


clear i;
clear j;
clear min_index;
clear temp;
clear temp_chomosome;
