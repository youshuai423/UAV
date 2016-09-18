% 计算种群个体适应度，对不同的优化目标，修改下面的函数
% population_size: 种群大小
% chromosome_size: 染色体长度

function fitnessValue = fitness(population, distanceT2T)

[population_size, chromosome_size] = size(population);
fitnessValue = zeros(population_size, 1);

for i = 1 : population_size
    for j = 1 :10 : chromosome_size %----------循环终止条件？？？
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
    fitnessValue(i) = 1 / fitnessValue(i); %-----------转换成最大值？？
end

clear i j k;
