% Genetic Algorithm for Functional Maximum Problem

% population  种群
% population_size: 输入种群大小
% chromosome_size: 输入染色体长度
% generation_size: 输入迭代次数
% cross_rate: 输入交叉概率
% mutate_rate: 输入变异概率
% elitism: 输入是否精英选择
% m: 输出最佳个体
% n: 输出最佳适应度
% p: 输出最佳个体出现迭代次数
% q: 输出最佳个体自变量值

function [m,n,p,q] = genetic_algorithm(distanceT2T, population_size, chromosome_size, generation_size, cross_rate, mutate_rate, elitism)

% global best_fitness;    % 历代最佳适应值
% global fitness_average; % 历代平均适应值矩阵
% global best_individual; % 历代最佳个体
% global best_generation; % 最佳个体出现代
% upper_bound = 9;        % 自变量的区间上限
% lower_bound = 0;        % 自变量的区间下限

fitnessValue = 0;
fitness_average = 0;
best_individual = [];
best_generation = [];
bestDistance = [];
best_fitness = 0;
best_generation = 0;

population = init(population_size, chromosome_size); % 初始化
%population = init2(population_size, chromosome_size); % 初始化

for offspring = 1 : generation_size   
    fitnessValue = fitness(population, distanceT2T);              % 计算适应度 
    [fitness_sum, fitness_average(offspring), best_fitness, best_individual, best_generation, bestDistance(offspring)]...
        = rank(population, fitnessValue, offspring, best_fitness,best_individual, best_generation);                 % 对个体按适应度大小进行排序
    population = selection(population, elitism, fitness_sum);   % 选择操作
    population = crossover(population, cross_rate);% 交叉操作
    population = mutation(population, mutate_rate);% 变异操作
    %[500 / best_fitness offspring]
end

%plotGA(generation_size, fitness_average);% 打印算法迭代过程
t = 1 : generation_size;
% scatter(t, 500 ./ fitness_average);
% hold;
scatter(t, bestDistance, '.');

m = best_individual;    % 获得最佳个体
n = best_fitness;       % 获得最佳适应度
p = best_generation;    % 获得最佳个体出现时的迭代次数

% 获得最佳个体变量值，对不同的优化目标，这里需要修改
q = 0.;

clear i;
clear j;


