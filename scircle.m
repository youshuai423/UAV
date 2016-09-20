% 已知圆心和半径生成圆形数据
function [x,y] = scircle(centerx, centery, radius)
  alpha=0:0.01:2*pi;%角度[0,2*pi]?
  x=radius*cos(alpha) + centerx;
  y=radius*sin(alpha) + centery;
