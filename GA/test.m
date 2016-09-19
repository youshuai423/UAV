% 设置遗传算法的参数，测试效果
% 设定求解精度为小数点后4位
clear;
clc;

Coordinate
elitism = false;             % 选择精英操作
population_size = 50;      % 种群大小
chromosome_size = 40;       % 染色体长度
generation_size = 200;      % 最大迭代次数
cross_rate = 0.7;           % 交叉概率
mutate_rate = 0.05;         % 变异概率
distanceT2T = zeros(10, 10);
for i = 1:10
    for j = 1:10
        %distanceT2T(i, j) = sqrt((x_y(i, 1) - x_y(j, 1))^2 + (x_y(i, 2) - x_y(j, 2))^2);
        distanceT2T(i, j) = sqrt((Radar(i, 1) - Radar(j, 1))^2 + (Radar(i, 2) - Radar(j, 2))^2);
    end
end

for i = 1 : 1000
    [best_individual,best_fitness,iteratiogoritns,x] = genetic_algorithm(distanceT2T, ...
     population_size, chromosome_size, generation_size, cross_rate, mutate_rate,elitism);
     bestones(i, :) = best_individual;
     bestDistance(i) = 500 / best_fitness;
     bestDistance(i)
end
disp 最优个体:
best_individual
disp 最优适应度:
500 / best_fitness
disp 最优个体对应自变量值:
x
disp 达到最优结果的迭代次数:
iterations

%clear;