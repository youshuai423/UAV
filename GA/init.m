% ��ʼ����Ⱥ
function population = init(population_size, chromosome_size)
population = zeros(population_size, chromosome_size);
for i=1:population_size
    for j=1:10:chromosome_size
        % ��population��i��j�и�ֵ        
        population(i,j:j+9) = randperm(10);  % ��ʼ��ȺΪ1~10�������
    end
end
clear i;
clear j;

