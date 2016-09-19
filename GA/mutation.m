% ������������ѡ���������򲢽���
function population = mutation(population, mutate_rate)
[population_size, chromosome_size] = size(population);

for i=1:population_size
    while(1)
        population1 = population(i, :);
        if rand < mutate_rate
            mutate_position1 = round(rand*chromosome_size);  % ����λ��
            mutate_position2 = round(rand*chromosome_size);  % ����λ��
            if mutate_position1 == 0 || mutate_position2 == 0
                % ������λ��Ϊ0��������
                continue;
            end
            % ��������
            temp = population1(mutate_position1);
            population1(mutate_position1) = population1(mutate_position2);
            population1(mutate_position2) = temp;
            population1 = merge(population1); % ����������ͬ����
            
            if allScouted(population1)  % �ж�����Ŀ��Ⱥ�������
                population(i, :) = population1;
                break;
            end
        end
    end
end

clear i;
clear mutate_position1;
clear mutate_position2;
