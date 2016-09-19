% �����Ŵ��㷨�Ĳ���������Ч��
clear;
clc;

load('Coordinate.mat')
elitism = false;             % ѡ��Ӣ����
population_size = 50;      % ��Ⱥ��С
chromosome_size = 40;       % Ⱦɫ�峤��
generation_size = 200;      % ����������
cross_rate = 0.7;           % �������
mutate_rate = 0.05;         % �������
distanceT2T = zeros(10, 10);
% ���״�Ϊ�������ɸ�Ŀ��Ⱥ֮��ľ���
for i = 1:10
    for j = 1:10
        distanceT2T(i, j) = sqrt((Radar(i, 1) - Radar(j, 1))^2 + (Radar(i, 2) - Radar(j, 2))^2);
    end
end

% ���������Ŵ��㷨
for i = 1 : 1000
    [best_individual,best_fitness] = genetic_algorithm(distanceT2T, population_size,...
                                     chromosome_size, generation_size, cross_rate, mutate_rate,elitism);
     bestones(i, :) = best_individual;  % �洢ÿ�����Ÿ���
     bestDistance(i) = 500 / best_fitness;  % �洢ÿ�����ž���
end

%clear;