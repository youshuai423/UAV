function [fitNode, mindist] = MCS2(TargetGroup, runNum)
Area = [min(TargetGroup(:,1)) - 5, max(TargetGroup(:,1) + 5); ...
        min(TargetGroup(:,2)) - 5, max(TargetGroup(:,2)) + 5;];
[numTarget, ~] = size(TargetGroup);
TargetCovered = [];
distanceT = 0;
mindist = inf;

for i = 1 : 5
%     if mindist ~= inf
%         break;
%     end
    
    for runNow = 1 : runNum
        for j = 1 : i
            fitTemp(j, 1) = rand * (Area(1, 2) - Area(1, 1)) + Area(1, 1);
            fitTemp(j, 2) = rand * (Area(2, 2) - Area(2, 1)) + Area(2, 1);
        end

        for j = 1 : i
            q = fitTemp(j, :);
            for k = 1 : numTarget
                myDist = sqrt((q(1) - TargetGroup(k, 1))^2 + (q(2) - TargetGroup(k, 2))^2);
                if myDist <= sqrt(7.5^2 - 5^2)
                    TargetCovered = [TargetCovered, k];
                end                
            end
            TargetCovered = [TargetCovered, 0];
        end

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