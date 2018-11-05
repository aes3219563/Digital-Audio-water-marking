% this function creates a rn-length-array with watermark information
% note that the watermark information is represented circularly
% input s is watermarking information typied in
% input rn is the total frame number
% output watermark is a 1-D array with type in information circularly
% expressed
% by Peng Xi
% 4/17/13
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function watermark=wm(s,rn)
for i=1:1:length(s);
switch (s(i))
   case 'a'
        bb(1,(i-1)*5+1:(i-1)*5+5)=[0 0 0 0 0];
   case 'b'
        bb(1,(i-1)*5+1:(i-1)*5+5)=[0 0 0 0 1];
   case 'c'
        bb(1,(i-1)*5+1:(i-1)*5+5)=[0 0 0 1 0];
   case 'd'
        bb(1,(i-1)*5+1:(i-1)*5+5)=[0 0 0 1 1];
   case 'e'
        bb(1,(i-1)*5+1:(i-1)*5+5)=[0 0 1 0 0];
   case 'f'
        bb(1,(i-1)*5+1:(i-1)*5+5)=[0 0 1 0 1];
   case 'g'
        bb(1,(i-1)*5+1:(i-1)*5+5)=[0 0 1 1 0];
   case 'h'
        bb(1,(i-1)*5+1:(i-1)*5+5)=[0 0 1 1 1];
   case 'i'
        bb(1,(i-1)*5+1:(i-1)*5+5)=[0 1 0 0 0];
   case 'j'
        bb(1,(i-1)*5+1:(i-1)*5+5)=[0 1 0 0 1];
   case 'k'
        bb(1,(i-1)*5+1:(i-1)*5+5)=[0 1 0 1 0];
   case 'l'
        bb(1,(i-1)*5+1:(i-1)*5+5)=[0 1 0 1 1];
   case 'm'
        bb(1,(i-1)*5+1:(i-1)*5+5)=[0 1 1 0 0];
   case 'n'
        bb(1,(i-1)*5+1:(i-1)*5+5)=[0 1 1 0 1];
   case 'o'
        bb(1,(i-1)*5+1:(i-1)*5+5)=[0 1 1 1 0];
   case 'p'
        bb(1,(i-1)*5+1:(i-1)*5+5)=[0 1 1 1 1];
   case 'q'
        bb(1,(i-1)*5+1:(i-1)*5+5)=[1 0 0 0 0];
   case 'r'
        bb(1,(i-1)*5+1:(i-1)*5+5)=[1 0 0 0 1];
   case 's'
        bb(1,(i-1)*5+1:(i-1)*5+5)=[1 0 0 1 0];
   case 't'
        bb(1,(i-1)*5+1:(i-1)*5+5)=[1 0 0 1 1];
   case 'u'
        bb(1,(i-1)*5+1:(i-1)*5+5)=[1 0 1 0 0];
   case 'v'
        bb(1,(i-1)*5+1:(i-1)*5+5)=[1 0 1 0 1];
   case 'w'
        bb(1,(i-1)*5+1:(i-1)*5+5)=[1 0 1 1 0];
   case 'x'
        bb(1,(i-1)*5+1:(i-1)*5+5)=[1 0 1 1 1];
   case 'y'
        bb(1,(i-1)*5+1:(i-1)*5+5)=[1 1 0 0 0];
   case 'z'
        bb(1,(i-1)*5+1:(i-1)*5+5)=[1 1 0 0 1];    
    case '_'
        bb(1,(i-1)*5+1:(i-1)*5+5)=[1 1 0 1 0];
   otherwise
        disp('input error!');
end
end
watermark=bb;
tempmark=watermark;
len1=length(watermark);
num=floor(rn/len1);
for i=1:1:(num-1)
    watermark=[watermark tempmark];
end
len2=length(watermark);
watermark=[watermark zeros(1,rn-len2)];
