% FY-1搭载S1时每个目标群内部最小路径查找——蒙特卡罗法
function [fitNode, mindist] = MCS1(TargetGroup, LeftRight, runNum)
% TargetGroup 目标群
% LeftRight 点相对无人机方位
% runNum 蒙特卡罗循环次数

% 限制随机取样范围
Area = [min(TargetGroup(:,1)) - 5, max(TargetGroup(:,1) + 5); ...
        min(TargetGroup(:,2)) - 5, max(TargetGroup(:,2)) + 5;];
[numTarget, ~] = size(TargetGroup);
TargetCovered = [];
distanceT = 0;
mindist = inf;

for i = 2 : 5
%     if mindist ~= inf
%         break;
%     end
    
    for runNow = 1 : runNum
        % 生成随机点代表线段
        for j = 1 : i
            fitTemp(j, 1) = rand * (Area(1, 2) - Area(1, 1)) + Area(1, 1);
            fitTemp(j, 2) = rand * (Area(2, 2) - Area(2, 1)) + Area(2, 1);
        end

        for j = 1 : i - 1
            q1 = fitTemp(j, :);
            q2 = fitTemp(j + 1, :);
            % 判断线段代表的轨迹可以侦察的目标
            for k = 1 : numTarget
                verticalDist = juli(q1(1), q1(2), q2(1), q2(2), TargetGroup(k, 1), TargetGroup(k, 2));
                if abs(verticalDist) >= 2 && abs(verticalDist) <= 8 && sign(verticalDist) == LeftRight
                    tempdist(1) = sqrt((q1(1) - TargetGroup(k, 1))^2 + (q1(2) - TargetGroup(k, 2))^2);
                    tempdist(2) = sqrt((q2(1) - TargetGroup(k, 1))^2 + (q2(2) - TargetGroup(k, 2))^2);
                    dist12 = sqrt((q2(1) - q1(1))^2 + (q2(2) - q1(2))^2);
                    if dist12 > sqrt(max(tempdist)^2 + verticalDist^2) + 0.07
                        TargetCovered = [TargetCovered, k];
                    end
                end                
            end
            TargetCovered = [TargetCovered, 0];
        end

        % 所有店都可以侦察到，判断是否路径最短
        if length(unique(TargetCovered)) == numTarget + 1
            for m = 1 : i - 1
                distanceT = distanceT + sqrt((fitTemp(m, 1) - fitTemp(m + 1, 1))^2 ...
                            + (fitTemp(m, 2) - fitTemp(m + 1, 2))^2);
            end
            if distanceT < mindist
                mindist = distanceT;
                fitNode = fitTemp;
                TargetCovered
            end            
        end        
        
        TargetCovered = [];
        distanceT = 0;
    end
end

if mindist == inf
    [fitNode, mindist] = [-1, -1];
end