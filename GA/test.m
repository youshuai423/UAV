% 设置遗传算法的参数，测试效果
clear;
clc;

load('Coordinate.mat')
elitism = false;             % 选择精英操作
population_size = 50;      % 种群大小
chromosome_size = 40;       % 染色体长度
generation_size = 200;      % 最大迭代次数
cross_rate = 0.7;           % 交叉概率
mutate_rate = 0.05;         % 变异概率
distanceT2T = zeros(10, 10);
% 以雷达为代表生成各目标群之间的距离
for i = 1:10
    for j = 1:10
        distanceT2T(i, j) = sqrt((Radar(i, 1) - Radar(j, 1))^2 + (Radar(i, 2) - Radar(j, 2))^2);
    end
end

% 反复进行遗传算法
for i = 1 : 1000
    [best_individual,best_fitness] = genetic_algorithm(distanceT2T, population_size,...
                                     chromosome_size, generation_size, cross_rate, mutate_rate,elitism);
     bestones(i, :) = best_individual;  % 存储每次最优个体
     bestDistance(i) = 500 / best_fitness;  % 存储每次最优距离
end

%clear;