% 计算种群个体适应度并排序
function fitnessValue = fitness(population, distanceT2T)
% distanceT2T 不同目标群间距离
[population_size, chromosome_size] = size(population);
fitnessValue = zeros(population_size, 1);

for i = 1 : population_size
    for j = 1 :10 : chromosome_size
        for k = 0 : 8
            if population(i, j+k) ~= 0 && population(i, j+k+1) ~= 0
                fitnessValue(i) = fitnessValue(i) + distanceT2T(population(i, j+k+1), population(i, j+k));
            else
                break;  % 0代表返回基地
            end
        end        
        if population(i, j) ~= 0  % 首位不为0说明有无人机出动，增加进出雷达区域距离140
            fitnessValue(i) = fitnessValue(i) + 140;
        end
    end
    fitnessValue(i) = 500 / fitnessValue(i); % 转换成最大值用于轮盘选择
end

clear i j k;
