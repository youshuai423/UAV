% Genetic Algorithm
function [best_individual, best_fitness] = genetic_algorithm(distanceT2T, population_size, chromosome_size, generation_size, cross_rate, mutate_rate, elitism)
fitnessValue = 0;  % ��Ӧ�Ⱦ���
fitness_average = 0;  % ƽ����Ӧ��
best_individual = [];  % ���Ÿ���Ⱦɫ��
bestDistance = [];  % ���ž���
best_fitness = 0;  % ������Ӧ��
best_generation = 0; % ���ź������

population = init(population_size, chromosome_size); % ��ʼ��

for offspring = 1 : generation_size   
    fitnessValue = fitness(population, distanceT2T);              % ������Ӧ�� 
    % �Ը��尴��Ӧ�ȴ�С��������
    [fitness_sum, fitness_average(offspring), best_fitness, best_individual, best_generation, bestDistance(offspring)]...
        = rank(population, fitnessValue, offspring, best_fitness,best_individual, best_generation);
    population = selection(population, elitism, fitness_sum);   % ѡ�����
    population = crossover(population, cross_rate);% �������
    population = mutation(population, mutate_rate);% �������
end

% ��ͼ
hold on;
t = 1 : generation_size;
scatter(t, 500 ./ fitness_average); % ƽ������
scatter(t, bestDistance, '.');  % ���ž���
hold off;

clear i;
clear j;


