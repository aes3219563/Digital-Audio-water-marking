% this is the function to encode binary information
% aa is the maximum value
% bb is the value needs encoding
% c is the step length, from alpha
% d is the parameter to decide encoding '1' or 'o', from array watermark
% output result is the value after encoding
% by Peng Xi 
% 4/16/13
%%%%%%%%%%%%%%%%%%%
function [ result ] = quan( aa,bb,c,d )
a=abs(aa);
b=abs(bb);
if bb>=0
    mag=0;
else
    mag=1;
end
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
if d==1 && t==1
    result=temp2(index2(1))*(-1)^mag;
elseif d==1 && t==0
    result=temp2(index2(2))*(-1)^mag;
elseif d==0 && t==0
    result=temp2(index2(1))*(-1)^mag;
elseif d==0 && t==1
    result=temp2(index2(2))*(-1)^mag;
end
end
    


