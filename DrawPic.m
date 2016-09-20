% 对基地、敌方目标以及雷达探测范围进行画图
scatter(HomeBase(:, 1), HomeBase(:, 2))
hold on;
scatter(A1(:, 1), A1(:, 2), 'd', 'r')
scatter(A2(:, 1), A2(:, 2), 'd', 'g')
scatter(A3(:, 1), A3(:, 2), 'd', 'y')
scatter(A4(:, 1), A4(:, 2), 'd', 'c')
scatter(A5(:, 1), A5(:, 2), 'd', 'm')
scatter(A6(:, 1), A6(:, 2), 'd', 'k')
scatter(A7(:, 1), A7(:, 2), 's', 'r')
scatter(A8(:, 1), A8(:, 2), 's', 'g')
scatter(A9(:, 1), A9(:, 2), 's', 'y')
scatter(A10(:, 1), A10(:, 2), 's', 'c')

for i=1:10
  [radarx, radary] = scircle(Radar(i, 1), Radar(i, 2), 70);
  plot(radarx, radary)
end

hold off;

