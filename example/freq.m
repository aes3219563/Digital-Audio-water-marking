% main function of encoding
% function called:
% wm.m
% enframe.m
% quan.m
% by Peng xi
% 4/17/2013
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc;clear;
sn=floor((44100/1000)*2);% sample number in 2 ms
s=input('Please input a watermark made up by 26 small English letters :  ','s');
ss=input('Select the original sound file in the form of *.wav :  ','s');
watermarkedfile=input('Type in the name of watermarked sound file in the form of *.wav :  ','s');
x=audioread(ss)';%read the wave film
seg1=enframe(x,sn); % divided into frames each frame has 20ms
[rn,fn]=size(seg1); % compute total frame number
watermark=wm(s,rn); % creat the watermarking array
alpha=0.2;  % step size 
 for i=1:1:rn;       
         len1=length(seg1(i,:));
         [cc,ll]=dwt(seg1(i,:),'haar'); %wavelet decomposition
         len2=length(cc);
         temp=dct(cc); % DCT of low frequency part
         [ts,index]=sort(abs(temp));
         m=temp(index(length(index)));% max position
         sm=temp(index(length(index)-1));  % second max value
         tm=temp(index(length(index)-2)); % third max value
         fm=temp(index(length(index)-3)); % fourth max value
         temp(index(length(index)-1))=quan(m,sm,alpha,watermark(1,i)); %quantize the second max value
         temp(index(length(index)-2))=quan(m,tm,alpha,watermark(1,i)); %quantize the third max value
         temp(index(length(index)-3))=quan(m,fm,alpha,watermark(1,i)); %quantize the fourth max value         
         rcc=idct(temp); %recover low frequency part         
         rc=[rcc,ll];
         rl=[len2,len2,len1];         
         seg1(i,:)=waverec(rc,rl,'haar'); % idwt
 end
seg1=seg1';
out=seg1(:);
out=mapminmax(out);
out(out>=1)=0.99996948242188; % the following two statements avoid overflow
out(out<=-1)=-0.99996948242188;
disp('Watermarked file created:');
display(watermarkedfile);
audiowrite(watermarkedfile,out',44100);
y=x(1,1:length(out))';
snr=10*log10(sum(y.^2)/sum((y-out).^2));
display(snr);
disp('Would you like to hear the sound after watermarking?');
disp('please input y/n');
k=input('','s');
if k(1)=='y'
    sound(out,44100);
elseif k(1)~='y' && k(1)~='n'
    disp('input error');
end


    
    




        