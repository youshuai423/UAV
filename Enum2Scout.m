% 穷举法列举所有2架无人机探索10个目标群的路线
P = perms(1:10); % 生成1~10的所有排列组合用于表示路线
l = length(P);
distanceT2T = zeros(10, 10);  % 各个目标群间距离
distanceTotal = 0;

minDistance = inf;  % 最小距离
track = []; % 最小距离时的路径
  
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

% 对最小路径连线
for i = 1 : 10
    if track(i) ~= 0 && track(i + 1) ~= 0 
        line([Radar(track(i), 1), Radar(track(i + 1), 1)], [Radar(track(i), 2), Radar(track(i + 1), 2)])
    end
end