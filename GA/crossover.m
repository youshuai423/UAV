% �������
function population = crossover(population, cross_rate)
% population_size ��Ⱥ��С
% chromosome_size Ⱦɫ�峤��
[population_size, chromosome_size] = size(population);
ScoutedTime = 0;  % ���波�Դ���

% ����Ϊ2 ������Ⱥ
for i=1:2:population_size
    % rand<������ʣ������������Ⱦɫ�崮���н������
    while(1)
        population1 = population(i,:);
        population2 = population(i + 1,:);
        if(rand < cross_rate)
            cross_position = round(rand * chromosome_size);
            if (cross_position == 0 || cross_position == chromosome_size)
                continue;
            end
            % �� cross_position��֮��Ļ�����н���
            temp = population1(cross_position:chromosome_size);
            population1(cross_position:chromosome_size) = population2(cross_position:chromosome_size);
            population2(cross_position:chromosome_size) = temp;
            % �������ڵ���ͬ����
            population1 = merge(population1);
            population2 = merge(population2);
        end
        if allScouted(population1) && allScouted(population2)  % �������嶼��������Ŀ��Ⱥ
            population(i, :) = population1;
            population(i + 1, :) = population2;
            break;
        elseif ScoutedTime > 100  % ����100�β��ɹ�������
            break;
        else
            ScoutedTime = ScoutedTime + 1;
        end
    end
    ScoutedTime = 0;
end

clear i;
clear j;
clear temp;
clear cross_position;

