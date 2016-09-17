function [x,y] = scircle(centerx, centery, radius)
  alpha=0:0.01:2*pi;%½Ç¶È[0,2*pi]?
  x=radius*cos(alpha) + centerx;
  y=radius*sin(alpha) + centery;
