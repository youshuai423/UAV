% ���̶�ѡ�����
function population = selection(population, elitism, fitness_sum)
% elitism ��Ӣѡ��
[population_size, chromosome_size] = size(population);
population_new = zeros(population_size, chromosome_size);

for i=1:population_size
    r = rand * fitness_sum(population_size);  % ����һ�����������[0,����Ӧ��]֮��
    first = 1;
    last = population_size;
    mid = round((last+first)/2);
    idx = -1;
    
    % ���з�ѡ�����
    while (first <= last) && (idx == -1) 
        if r > fitness_sum(mid)
            first = mid;
        elseif r < fitness_sum(mid)
            last = mid;     
        else
            idx = mid;
            break;
        end
        mid = round((last+first)/2);
        if (last - first) == 1
            idx = last;
            break;
        end
    end
   
   % ������һ������
   population_new(i,:) = population(idx,:);
end

% �Ƿ�Ӣѡ��
if elitism
    population(1:population_size-1,:) = population_new(1:population_size-1,:);
else
    population = population_new;
end

clear i;
clear j;
clear population_new;
clear first;
clear last;
clear idx;
clear mid;
 

