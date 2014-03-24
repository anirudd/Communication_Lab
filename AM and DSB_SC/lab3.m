function [  ] = lab3(  )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

ts=1/3200;
t=0:ts:1;
y1=sin(2*pi*20*t);
y2=sin(2*pi*200*t);
y3=y2.*5;
y=y1.*y2;
y=y+y3;
y4=y;
[m,n]=size(y4);
disp(m)
disp(n)

for i=1:n
    if(y4(1,i)<0)
        y4(1,i)=0;
    end
end
rc=0.03;
c=zeros(m,n);
c(1,1)=5;
for i=2:n
    if(y4(1,i)<c(1,i-1))
        c(1,i)=c(1,i-1)*(1-(ts/rc));
    end
    if(y4(1,i)>c(1,i-1))
        c(1,i)=y4(1,i);
    end
    if(y4(1,i)==c(1,i-1))
        c(1,i)=c(1,i-1);
    end
end

y6=y1+5;
plot(t,y,t,y6,t,c)
legend('orignal','envelope','detector')

end

