function [ a,t,ftemp ] = lab1(  )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

a=20:10:110;
ts=0.0010;
t=0:ts:1;
[m,n]=size(t);
disp(m)
disp(n)
disp(a(1))
wave=zeros(10,n);
temp=zeros(1,n);
temp1=zeros(1,n);
for i=1:10
    for j=1:n
        wave(i,j)=sin((2*pi*a(i)*t(1,j)));
        temp(j)=wave(i,j);
        temp1(1,j)=temp1(1,j)+temp(1,j);
    end
%     figure
%     plot(t,temp);
end
figure
plot(t,temp1)
t=t';
temp1=temp1';
ftemp=fft(temp1);
ftemp=ftemp.*ts;
% ftemp=abs(ftemp);
j=0:1000;
j=j';
figure
stem(j,ftemp);

k=1:1001;
h=zeros(1001,1);

for i=1:1001
    if ((i<=35)||(i>=966))
        h(i)=1;
    end
    if((i==36)||(i==965))
        h(i)=0.5;
    end
end

final=ftemp.*h;

figure
stem(j,final);

h1=zeros(1001,1);
for i=1:1001
    if((i>15)&&(i<65))
        h1(i)=1;
    end
    if((i>936)&&(i<986))
            h1(i)=1;
    end
    if((i==15)||(i==65)||(i==936)||(i==986))
          h1(i)=0.5;
    end
    
end

final1=ftemp.*h1;
figure
stem(j,final1);

fi=ifft(final);
plot(t,fi)


end

