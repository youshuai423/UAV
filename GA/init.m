% ��ʼ����Ⱥ
% population_size: ��Ⱥ��С
% chromosome_size: Ⱦɫ�峤��

function population = init(population_size, chromosome_size)
%a = [1 2 8 9 3 4 0 0 0 0 6 5 10 7 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
population = zeros(population_size, chromosome_size);
for i=1:population_size
    for j=1:10:chromosome_size
        % ��population��i��j�и�ֵ        
        population(i,j:j+9) = randperm(10);  % rand����(0,1)֮����������round()���������뺯��
    end
    %population(i, :) = a;
end
clear i;
clear j;

