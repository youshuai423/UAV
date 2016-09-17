AX = [A01_X, A02_X, A03_X, A04_X, A05_X, A06_X, A07_X, A08_X, A09_X, A10_X];
AY = [A01_Y, A02_Y, A03_Y, A04_Y, A05_Y, A06_Y, A07_Y, A08_Y, A09_Y, A10_Y];
ScoutedSameTime = [];
for i = 1:68
  for j =1 :68
    distance(i,j) = sqrt((AX(i) - AX(j))^2 + (AY(i) - AY(j))^2);
    if distance(i, j) <= 2 && i ~= j
      ScoutedSameTime = [ScoutedSameTime; [i,j]];
    end
  end
end