%计算各个雷达站之间的距离
leidazhan=[264,715;
           225,605;
           168,538;
           210,455;
           120,400;
           96,304;
           10,451;
           162,660;
           110,561;
           105,473];
       
 distleidazhan=zeros(10,10);
 distchonghe=zeros(10,10);

 for i=1:length(leidazhan)
      x1=leidazhan(i,1);
      y1=leidazhan(i,2);
        for j=i+1:length(leidazhan)
            x2=leidazhan(j,1);
            y2=leidazhan(j,2);
            distleidazhan(i,j)=sqrt((x1-x2)^2+(y1-y2)^2);
            if distleidazhan(i,j)<75*2
                distchonghe(i,j)=75*2-distleidazhan(i,j);
            else
                distchonghe(i,j)=0;
            end
        end
 end
 
 distleidazhan;
 distchonghe;