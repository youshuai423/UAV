% 初始化种群
function population = init(population_size, chromosome_size)
population = zeros(population_size, chromosome_size);
for i=1:population_size
    for j=1:10:chromosome_size
        % 给population的i行j列赋值        
        population(i,j:j+9) = randperm(10);  % 初始种群为1~10随机排列
    end
end
clear i;
clear j;

