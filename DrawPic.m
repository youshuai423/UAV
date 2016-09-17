scatter(HomeBaseX, HomeBaseY)
hold;
scatter(A01_X, A01_Y, 'd', 'r')
scatter(A02_X, A02_Y, 'd', 'g')
scatter(A03_X, A03_Y, 'd', 'y')
scatter(A04_X, A04_Y, 'd', 'c')
scatter(A05_X, A05_Y, 'd', 'm')
scatter(A06_X, A06_Y, 'd', 'k')
scatter(A07_X, A07_Y, 's', 'r')
scatter(A08_X, A08_Y, 's', 'g')
scatter(A09_X, A09_Y, 's', 'y')
scatter(A10_X, A10_Y, 's', 'c')

for i=1:10
  [radarx, radary] = scircle(RadarX(i), RadarY(i), 70);
  plot(radarx, radary)
end

hold;

