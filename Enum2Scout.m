% ��ٷ��о�����2�����˻�̽��10��Ŀ��Ⱥ��·��
P = perms(1:10); % ����1~10����������������ڱ�ʾ·��
l = length(P);
distanceT2T = zeros(10, 10);  % ����Ŀ��Ⱥ�����
distanceTotal = 0;

minDistance = inf;  % ��С����
track = []; % ��С����ʱ��·��
  
for i = 1:10
    for j = 1:10
       distanceT2T(i, j) = sqrt((Radar(i, 1) - Radar(j, 1))^2 + (Radar(i, 2) - Radar(j, 2))^2);
    end
end

for i = 1:l
    for left = 1 : 5
        distanceTotal = 0;
        for j = 1:left-1
            distanceTotal = distanceTotal + distanceT2T(P(i, j), P(i, j + 1));
        end
        for j = left+1 : 9
            distanceTotal = distanceTotal + distanceT2T(P(i, j), P(i, j + 1));
        end
        if distanceTotal < minDistance
            minDistance = distanceTotal;
            track = [P(i,1:left), 0 , P(i,left + 1:10)];
        end
    end
end

% ����С·������
for i = 1 : 10
    if track(i) ~= 0 && track(i + 1) ~= 0 
        line([Radar(track(i), 1), Radar(track(i + 1), 1)], [Radar(track(i), 2), Radar(track(i + 1), 2)])
    end
end