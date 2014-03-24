function [out,ff,w,y,yt,op,count,ber ] = ptrain( data )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

%bit rate=100 bps
%channel bandwidth=25Hz

[x,y]=size(data);
temp=x*y*5;
out=zeros(1,x*y*5);
k=0;
t=2125;
for i=1:x
    for j=1:y
        if(data(i,j)==1)
            for l=1:5
                out(1,l+k)=1;
            end
            k=k+5;
        else
            k=k+5;
        end
    end
end
figure
plot(out);
xlabel('5*t ----------->');
ylabel(' y(t)   ------------------->');
title('plot of pulse train using on-off signalling scheme');
out=out';
ff1=fft(out);
ff=abs(ff1);
w=zeros(temp,1);
for i=1:temp
    w(i)=2*pi*i/2125;
end
figure 
stem(w,ff);
xlabel('w ----------->');
ylabel(' H(w)   ------------------->');
title('spectrum of pulse train Bandwidth=50 Hz on-off signalling scheme');
h=zeros(4250000,1);
for i=1:4250000
    if((i<53126)||(i>4196874))
        h(i)=1;
    end
    if((i==53126)||(i==4196874))
        h(i)=0.5;
    end
end
y=h.*ff1;
y1=abs(y);
figure 
stem(w,y1);
xlabel('w ----------->');
ylabel(' H(w)   ------------------->');
title('spectrum of pulse train after passing through a channel of Bandwidth=25 Hz');

yt=ifft(y);
[~,yo]=cart2pol(real(yt),imag(yt));
figure
plot(yo);
xlabel('t ----------->');
ylabel(' h(t)   ------------------->');
title(' pulse train after passing through a channel of Bandwidth=25 Hz');
op=zeros(212500,1);
k=1;
for i=3:5:4250000
    if(yo(i)>=0.5)
        op(k)=1;
        k=k+1;
    else
        k=k+1;
    end
end
tempo=data';
tempo=reshape(tempo,850000,1);
count=0;
for i=1:850000
    if(tempo(i,1)~=op(i,1))
        count=count+1;
    end
end
ber=count/850000;
disp('The bit error rate due to ISI and limited channel bandwidth is');
disp(ber);

end