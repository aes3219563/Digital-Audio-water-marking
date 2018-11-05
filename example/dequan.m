% this is the funtion to decode the binary inform in each frame
% input aa is the maximum value
% input bb is encoded value
% input c is the step length, from alpha
% out is 1 byte inform '0' or '1'
% By Peng Xi
% 4/17/13
%%%%%%%%%%%%%%%%%%%%%%%
function [out] = dequan(aa,bb,c)
a=abs(aa);
b=abs(bb);
n=floor(a/c); % total region num-1
temp1=zeros(1,n+2);
temp2=zeros(1,n+1);
for i=1:n+1
    temp1(i)=c*(i-1);
end
temp1(n+2)=a;
for j=1:n+1
    temp2(j)=(temp1(j)+temp1(j+1))/2;
end
temp3=abs(temp2-b);
[~,index2]=sort(temp3);
t=mod(index2(1),2);
if t==1
    out=1;
elseif t==0
        out=0;
end
