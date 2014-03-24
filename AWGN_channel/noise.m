function [ rno, b,c,d,e,count,temp ] = noise( )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
rno=randi(100000,1,50000);
b=de2bi(rno,17);
c=reshape(b,212500,4);
d=awgn(c,10);
e=zeros(212500,4);
for i=1:212500
    for j=1:4
        if(d(i,j)>=0.5)
            e(i,j)=1;
        else
            e(i,j)=0;
        end
    end
end
count=0;
for i=1:212500
    for j=1:4
        if(e(i,j)~=c(i,j))
            count=count+1;
        end
    end
end
temp=212500*4;
temp=count/temp;
disp('The bit error rate in AWGN channel is');
disp(temp)
end