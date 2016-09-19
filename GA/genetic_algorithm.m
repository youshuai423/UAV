% Genetic Algorithm
function [best_individual, best_fitness] = genetic_algorithm(distanceT2T, population_size, chromosome_size, generation_size, cross_rate, mutate_rate, elitism)
fitnessValue = 0;  % 适应度矩阵
fitness_average = 0;  % 平均适应度
best_individual = [];  % 最优个体染色体
bestDistance = [];  % 最优距离
best_fitness = 0;  % 最优适应度
best_generation = 0; % 最优后代代数

population = init(population_size, chromosome_size); % 初始化

for offspring = 1 : generation_size   
    fitnessValue = fitness(population, distanceT2T);              % 计算适应度 
    % 对个体按适应度大小进行排序
    [fitness_sum, fitness_average(offspring), best_fitness, best_individual, best_generation, bestDistance(offspring)]...
        = rank(population, fitnessValue, offspring, best_fitness,best_individual, best_generation);
    population = selection(population, elitism, fitness_sum);   % 选择操作
    population = crossover(population, cross_rate);% 交叉操作
    population = mutation(population, mutate_rate);% 变异操作
end

% 画图
hold on;
t = 1 : generation_size;
scatter(t, 500 ./ fitness_average); % 平均距离
scatter(t, bestDistance, '.');  % 最优距离
hold off;

clear i;
clear j;


