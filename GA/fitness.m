% ������Ⱥ������Ӧ�ȣ��Բ�ͬ���Ż�Ŀ�꣬�޸�����ĺ���
% population_size: ��Ⱥ��С
% chromosome_size: Ⱦɫ�峤��

function fitnessValue = fitness(population, distanceT2T)

[population_size, chromosome_size] = size(population);
fitnessValue = zeros(population_size, 1);

for i = 1 : population_size
    for j = 1 :10 : chromosome_size %----------ѭ����ֹ����������
        for k = 0 : 8
            if population(i, j+k) ~= 0 && population(i, j+k+1) ~= 0
                fitnessValue(i) = fitnessValue(i) + distanceT2T(population(i, j+k+1), population(i, j+k));
            else
                break;
            end
        end        
        if population(i, j) ~= 0
            fitnessValue(i) = fitnessValue(i) + 140;
        end
    end
    fitnessValue(i) = 1 / fitnessValue(i); %-----------ת�������ֵ����
end

clear i j k;
