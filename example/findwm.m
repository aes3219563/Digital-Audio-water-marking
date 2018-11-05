% this is a function to find the exact watermarked information from circular expression
% input x is the circular expression of 26 letters
% output is the exact information
% by Peng Xi
% 4/17/13
%%%%%%%%%%%%%%%%%%%%%%%%%
function output = findwm( x )
a=mod(length(x),2);
if a==0
    num=length(x)/2;
else
    num=(length(x)+1)/2;
end
ratio=zeros(1,num);
for i=1:1:num
    seg=enframe(x,i);
    line=seg(:,1);
    xout=hist(line,sort(line));
    ratio(i)=max(xout)/length(line);    
end
if max(ratio)<0.8
    disp('decoding error')
elseif max(ratio)>=0.8
        for j=1:length(ratio)
            if ratio(j)>0.8
                seg2=enframe(x,j);
                temp=seg2';
                break
            end  
        end
        [~,col]=size(seg2);
        for ii=1:1:col
            [n2 aaa]=hist(temp(ii,:),sort(temp(ii,:)));
            out2(ii)=aaa(find(n2==max(n2)));
        end 
end
output=char(out2);

