% ������Ⱥ������Ӧ�Ȳ�����
function fitnessValue = fitness(population, distanceT2T)
% distanceT2T ��ͬĿ��Ⱥ�����
[population_size, chromosome_size] = size(population);
fitnessValue = zeros(population_size, 1);

for i = 1 : population_size
    for j = 1 :10 : chromosome_size
        for k = 0 : 8
            if population(i, j+k) ~= 0 && population(i, j+k+1) ~= 0
                fitnessValue(i) = fitnessValue(i) + distanceT2T(population(i, j+k+1), population(i, j+k));
            else
                break;  % 0�����ػ���
            end
        end        
        if population(i, j) ~= 0  % ��λ��Ϊ0˵�������˻����������ӽ����״��������140
            fitnessValue(i) = fitnessValue(i) + 140;
        end
    end
    fitnessValue(i) = 500 / fitnessValue(i); % ת�������ֵ��������ѡ��
end

clear i j k;
