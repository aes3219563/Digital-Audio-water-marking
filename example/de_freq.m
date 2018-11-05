% this is decoding main funtion
% function called:
% dwm.m
% dequan.m
% findwm.m
% majority rule is used
% frame length (sn) and step size (alpha) are needed in decoding
% by Peng Xi
% 4/17/13
%%%%%%%%%%%%%%%%%%%%%%%%
clc;
clear;
m=zeros(1,4);
jud=zeros(1,3);
alpha=0.2;
sn=floor((44100/1000)*2);% sample number in 2 ms. the frame length is the
%only thing we need to decode
ss=input('Select the watermarked sond file in the form of *.wav : ','s');
y=audioread(ss); % read the watermarked sound file
y=y';
seg2=enframe(y,sn);
[rn,fn]=size(seg2);
for i=1:1:rn
   len1=length(seg2(i,:));
   [cc,ll]=dwt(seg2(i,:),'haar'); %wavelet decomposition
   len2=length(cc);
   temp=dct(cc); % DCT of low frequency part
   [ts,index]=sort(abs(temp));
   m(1)=temp(index(length(index)));% max position
   m(2)=temp(index(length(index)-1));  % second max value
   m(3)=temp(index(length(index)-2)); % third max value
   m(4)=temp(index(length(index)-3)); % fourth max value
   for j=1:3
       jud(j)=dequan(m(1),m(j+1),alpha);
   end
   one=histc(jud,1);
   if one==2 || one==3
       res(i)=1;
   else
       res(i)=0;
   end
end
    temp=dwm(res);
    watermark=findwm(temp);
    disp('Watermark is :');
    display(watermark);
    