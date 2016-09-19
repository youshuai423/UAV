% �����Ŵ��㷨�Ĳ���������Ч��
% �趨��⾫��ΪС�����4λ
clear;
clc;

Coordinate
elitism = false;             % ѡ��Ӣ����
population_size = 50;      % ��Ⱥ��С
chromosome_size = 40;       % Ⱦɫ�峤��
generation_size = 200;      % ����������
cross_rate = 0.7;           % �������
mutate_rate = 0.05;         % �������
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
disp ���Ÿ���:
best_individual
disp ������Ӧ��:
500 / best_fitness
disp ���Ÿ����Ӧ�Ա���ֵ:
x
disp �ﵽ���Ž���ĵ�������:
iterations

%clear;