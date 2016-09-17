function [x, y, distance] = DistanceCal(x0, y0, rx, ry, r, LeftRight)
syms xs ys;

[a, b] = solve((xs - rx)^2 + (ys - ry)^2 == r^2, (xs - x0) * (xs - rx) + (ys - y0) * (ys - ry) == 0);
m = eval(a);
n = eval(b);

S = (x0 - rx) * (n - ry) - (y0 - ry) * (m - rx);
if (LeftRight == 0)  % Left
    if S(1) > 0
        x = m(1);
        y = n(1);
    else
        x = m(2);
        y = n(2);
    end
else
    if S(1) < 0
        x = m(1);
        y = n(1);
    else
        x = m(2);
        y = n(2);
    end
end
distance = sqrt((x - x0)^2 + (y - y0)^2);