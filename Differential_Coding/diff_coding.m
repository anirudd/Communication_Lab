function [img, dimg, ent,a, prob, dict, code, ent1] = diff_coding( )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
img=imread('lena.pgm');
[x,y]=size(img);
pp=x*y;
dimg=zeros(x,y);
a1=unique(img);
[l11,~]=size(a1);
loop1=zeros(l11,1);
prob1=zeros(l11,1);
ent1=0;
for i=1:l11
    loop1(i,1)=sum(histc(img,a1(i,1)));
    prob1(i,1)=loop1(i,1)/pp;
    ent1=ent1-(prob1(i,1)*log2(prob1(i,1)));
end
disp(' The entropy of the orignal image is: ');
disp(ent1);
for i=1:512
    dimg(i,1)=img(i,1);
    for j=2:512
        dimg(i,j)=img(i,j)-img(i,j-1);
    end
end
for i=512:-1:2
    dimg(i,1)=dimg(i,1)-dimg(i-1,1);
end

a=unique(dimg);
[l,~]=size(a);
loop=zeros(l,1);
prob=zeros(l,1);
ent=0;
for i=1:l
    loop(i,1)=sum(histc(dimg,a(i,1)));
    prob(i,1)=loop(i,1)/pp;
    ent=ent-(prob(i,1)*log2(prob(i,1)));
end
disp('The entropy of the image after applying differential coding is ');
disp(ent);
[dict,~]=huffmandict(a,prob);
temp=reshape(dimg,1,x*y);
code=huffmanenco(temp,dict);

[~,pp2]=size(code);

joker=8-rem(pp2,8);
qw=zeros(1,joker);
code=cat(2,code,qw);

        
fid=fopen('data.dat','w');
fid1=fopen('compressed.dat','w');
dlmwrite('data.dat',code,'');
fclose(fid);
fid=fopen('data.dat','r');
while(pp2>0)
    m=fread(fid,8);
    for i=1:8
        m(i,1)=m(i,1)-48;
    end
    m=m';
    d=bi2de(m,'left-msb');
    fwrite(fid1,d);
    pp2=pp2-8;
end
fclose(fid);
fclose(fid1);
end

