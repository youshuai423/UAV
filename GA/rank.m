% �Ը��尴��Ӧ�ȴ�С�������򣬲��ұ�����Ѹ���
% population_size: ��Ⱥ��С
% chromosome_size: Ⱦɫ�峤��

function [fitness_sum, fitness_average, best_fitness, best_individual, best_generation, bestDistance] = ...
         rank(population, fitnessValue, offspring, best_fitness, best_individual, best_generation)

[population_size, ~] = size(population);

fitness_sum = zeros(population_size,1);

% ������Ⱥ 
% ð������
% ���population(i)����Ӧ����i������������population(1)��С��population(population_size)���
for i=1:population_size
    min_index = i;
    for j = i+1:population_size
        if fitnessValue(j) < fitnessValue(min_index)
            min_index = j;
        end
    end
    
    if min_index ~= i
        % ���� fitnessValue(i) �� fitnessValue(min_index) ��ֵ
        temp = fitnessValue(i);
        fitnessValue(i) = fitnessValue(min_index);
        fitnessValue(min_index) = temp;
        % ��ʱ fitnessValue(i) ����Ӧ����[i,population_size]����С
        
        % ���� population(i) �� population(min_index) ��Ⱦɫ�崮
        temp_chromosome = population(i,:);
        population(i,:) = population(min_index,:);
        population(min_index,:) = temp_chromosome;
    end

end

% fitness_sum(i) = ǰi���������Ӧ��֮��
fitness_sum(1) = fitnessValue(1); 
for i = 2:population_size
    fitness_sum(i) = fitness_sum(i-1) + fitnessValue(i);
end

% fitness_average(offspring) = ��offspring�ε��� �����ƽ����Ӧ��
fitness_average = fitness_sum(population_size) / population_size; 
bestDistance = 500 / fitnessValue(population_size);
% ���������Ӧ�ȺͶ�Ӧ�ĵ���������������Ѹ���(��Ѹ������Ӧ�����)
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
