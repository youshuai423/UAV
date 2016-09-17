P = perms(1:10); % 生成1~10的所有排列组合
l = length(P);
distanceT2T = zeros(11, 11);
distanceB2T = zeros(10);
distanceTotal = 0;

minDistance = inf;
track = [];

for i = 1:10
    for j = 1:10
        distanceT2T(i, j) = sqrt((x_y(i, 1) - x_y(j, 1))^2 + (x_y(i, 2) - x_y(j, 2))^2);
    end
    distanceB2T(i) = sqrt((368 - x_y(i, 1))^2 + (319 - x_y(i, 2))^2);
end

for i = 1:l
    distanceTotal = distanceB2T(P(i, 1)) + distanceB2T(P(i, 10));
    for j = 1:9
        distanceTotal = distanceTotal + distanceT2T(P(i, j), P(i, j + 1));
    end
    if distanceTotal < minDistance
        minDistance = distanceTotal;
        track = P(i,:);
    end
end