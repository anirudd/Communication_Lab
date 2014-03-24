function [ record1 ] = lab2(  )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

a=audiorecorder();
recordblocking(a,10);
record1=getaudiodata(a);
f=fft(record1);
ts=1/8000;
f=f.*ts;
j=0:79999;
j=j';
j=j./10;
f1=abs(f);
figure
stem(j,f1);

h=zeros(80000,1);
for i=1:80000
    if((i<20000)||(i>60000))
        h(i)=1;
    end
    if((i==20000)||(i==60000))
        h(i)=0.5;
    end
end
f2=f.*h;
f3=abs(f2);
figure
stem(j,f3)

final=ifft(f2);
final=abs(final);
soundsc(final);

end

