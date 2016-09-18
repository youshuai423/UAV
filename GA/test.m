% �����Ŵ��㷨�Ĳ���������Ч��
% �趨��⾫��ΪС�����4λ
clear;
clc;

load('x_y.mat');
%leidazhanjuli;
elitism = true;             % ѡ��Ӣ����
population_size = 100;      % ��Ⱥ��С
chromosome_size = 40;       % Ⱦɫ�峤��
generation_size = 500;      % ����������
cross_rate = 0.8;           % �������
mutate_rate = 0.1;         % �������
distanceT2T = zeros(10, 10);
for i = 1:10
    for j = 1:10
        %distanceT2T(i, j) = sqrt((x_y(i, 1) - x_y(j, 1))^2 + (x_y(i, 2) - x_y(j, 2))^2);
        distanceT2T(i, j) = sqrt((leidazhan(i, 1) - leidazhan(j, 1))^2 + (leidazhan(i, 2) - leidazhan(j, 2))^2);
    end
end

[best_individual,best_fitness,iterations,x] = genetic_algorithm(distanceT2T, population_size, chromosome_size, generation_size, cross_rate, mutate_rate,elitism);

disp ���Ÿ���:
best_individual
disp ������Ӧ��:
1 / best_fitness
disp ���Ÿ����Ӧ�Ա���ֵ:
x
disp �ﵽ���Ž���ĵ�������:
iterations

%clear;