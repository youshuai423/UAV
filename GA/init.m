% 初始化种群
% population_size: 种群大小
% chromosome_size: 染色体长度

function population = init(population_size, chromosome_size)
%a = [1 2 8 9 3 4 0 0 0 0 6 5 10 7 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
population = zeros(population_size, chromosome_size);
for i=1:population_size
    for j=1:10:chromosome_size
        % 给population的i行j列赋值        
        population(i,j:j+9) = randperm(10);  % rand产生(0,1)之间的随机数，round()是四舍五入函数
    end
    %population(i, :) = a;
end
clear i;
clear j;

