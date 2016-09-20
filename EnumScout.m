% 穷举所有路线
function [minDistance, track, distanceBetween] = EnumScout(Node)
[numNode, ~] = size(Node);
P = perms(1:numNode); % 生成1~10的所有排列组合
l = length(P);
distanceT2T = zeros(numNode); % 目标群间距离

minDistance = inf;
track = [];
  
for i = 1:numNode
    for j = 1:numNode
        distanceT2T(i, j) = sqrt((Node(i, 1) - Node(j, 1))^2 + (Node(i, 2) - Node(j, 2))^2);
    end
end

for i = 1:l
    distanceTotal = 0;
    for j = 1 : numNode - 1
        distanceTotal = distanceTotal + distanceT2T(P(i, j), P(i, j + 1));
    end
    if distanceTotal < minDistance
        minDistance = distanceTotal;
        track = P(i,:);
    end
end

hold on;
scatter(Node(:,1), Node(:, 2));
scatter(Node(track(1), 1), Node(track(1), 2), 'r');

for i = 1 : numNode - 1    
    distanceBetween(i) = sqrt((Node(track(i), 1) - Node(track(i + 1), 1))^2 ...
                     + (Node(track(i), 2) - Node(track(i + 1), 2))^2);
    %line([Node(track(i),1), Node(track(i+1),1)], [Node(track(i),2), Node(track(i+1),2)]);
end

for i = 1 : numNode - 1
    %[insideCircleX, insideCircleY] = scircle(Node(i, 1), Node(i, 2), 2);
    %fill(insideCircleX, insideCircleY, 'w')
end

for i = 1 : numNode
%     [insideCircleX, insideCircleY] = scircle(Node(i, 1), Node(i, 2), 2);
     [outsideCircleX, outsideCircleY] = scircle(Node(i, 1), Node(i, 2), sqrt(7.5^2 - 25));
%     plot(insideCircleX, insideCircleY)
     plot(outsideCircleX, outsideCircleY)
end

hold off;