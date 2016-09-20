Total = 0;
flag = [];
for i = 1:10
    eval(['[myfit', num2str(i), ', bestDist] = MCS2(A', num2str(i), ', 100000)']);
%     scatter(myfit(:, 1), myfit(:, 2), '*', 'r')
%     eval(['EnumScout(A', num2str(i), ')']);
%     line(myfit(:, 1), myfit(:, 2))
    if (bestDist == -1)
        flag = [flag, i];
    else
        Total = Total + bestDist;
    end
end