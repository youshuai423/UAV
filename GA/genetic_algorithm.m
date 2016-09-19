% Genetic Algorithm for Functional Maximum Problem

% population  ��Ⱥ
% population_size: ������Ⱥ��С
% chromosome_size: ����Ⱦɫ�峤��
% generation_size: �����������
% cross_rate: ���뽻�����
% mutate_rate: ����������
% elitism: �����Ƿ�Ӣѡ��
% m: �����Ѹ���
% n: ��������Ӧ��
% p: �����Ѹ�����ֵ�������
% q: �����Ѹ����Ա���ֵ

function [m,n,p,q] = genetic_algorithm(distanceT2T, population_size, chromosome_size, generation_size, cross_rate, mutate_rate, elitism)

% global best_fitness;    % ���������Ӧֵ
% global fitness_average; % ����ƽ����Ӧֵ����
% global best_individual; % ������Ѹ���
% global best_generation; % ��Ѹ�����ִ�
% upper_bound = 9;        % �Ա�������������
% lower_bound = 0;        % �Ա�������������

fitnessValue = 0;
fitness_average = 0;
best_individual = [];
best_generation = [];
bestDistance = [];
best_fitness = 0;
best_generation = 0;

population = init(population_size, chromosome_size); % ��ʼ��
%population = init2(population_size, chromosome_size); % ��ʼ��

for offspring = 1 : generation_size   
    fitnessValue = fitness(population, distanceT2T);              % ������Ӧ�� 
    [fitness_sum, fitness_average(offspring), best_fitness, best_individual, best_generation, bestDistance(offspring)]...
        = rank(population, fitnessValue, offspring, best_fitness,best_individual, best_generation);                 % �Ը��尴��Ӧ�ȴ�С��������
    population = selection(population, elitism, fitness_sum);   % ѡ�����
    population = crossover(population, cross_rate);% �������
    population = mutation(population, mutate_rate);% �������
    %[500 / best_fitness offspring]
end

%plotGA(generation_size, fitness_average);% ��ӡ�㷨��������
t = 1 : generation_size;
% scatter(t, 500 ./ fitness_average);
% hold;
scatter(t, bestDistance, '.');

m = best_individual;    % �����Ѹ���
n = best_fitness;       % ��������Ӧ��
p = best_generation;    % �����Ѹ������ʱ�ĵ�������

% �����Ѹ������ֵ���Բ�ͬ���Ż�Ŀ�꣬������Ҫ�޸�
q = 0.;

clear i;
clear j;


