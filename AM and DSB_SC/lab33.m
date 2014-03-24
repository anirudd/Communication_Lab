function [ data,y1 ] = lab33(  )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

a=audiorecorder(48000,8,1);
recordblocking(a,5);
data=getaudiodata(a);
ts=1/48000;
t=0:ts:5;
y1=sin(2*pi*10000*t);
y1=y1';
y=data(1:240000).*y1(1:240000);
plot(t(1:240000),y(1:240000))

end

