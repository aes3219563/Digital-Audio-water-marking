% this is a function to decode the watermarked information
% input res is a 1-D binary array
% output is a string array made up by 26 small English letters
% the output is in circular form
% by Peng xi
% 4/17/13
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function output = dwm( res)
seg3=enframe(res,5);
[rn,~]=size(seg3);
for i=1:1:rn
        if seg3(i,:)==[0 0 0 0 0]
            output(i)='a';
        elseif seg3(i,:)== [0 0 0 0 1]
            output(i)='b';
        elseif seg3(i,:)== [0 0 0 1 0]
            output(i)='c';
        elseif seg3(i,:)== [0 0 0 1 1]
            output(i)='d';
        elseif seg3(i,:)== [0 0 1 0 0]
            output(i)='e';
        elseif seg3(i,:)== [0 0 1 0 1]
            output(i)='f';
        elseif seg3(i,:)== [0 0 1 1 0]
            output(i)='g';
        elseif seg3(i,:)== [0 0 1 1 1]
            output(i)='h';
        elseif seg3(i,:)== [0 1 0 0 0]
            output(i)='i';
        elseif seg3(i,:)== [0 1 0 0 1]
            output(i)='j';
        elseif seg3(i,:)== [0 1 0 1 0]
            output(i)='k';
        elseif seg3(i,:)== [0 1 0 1 1]
            output(i)='l';
        elseif seg3(i,:)== [0 1 1 0 0]
            output(i)='m';
        elseif seg3(i,:)== [0 1 1 0 1]
            output(i)='n';
        elseif seg3(i,:)== [0 1 1 1 0]
            output(i)='o';
        elseif seg3(i,:)== [0 1 1 1 1]
            output(i)='p';
        elseif seg3(i,:)== [1 0 0 0 0]
            output(i)='q';
        elseif seg3(i,:)== [1 0 0 0 1]
            output(i)='r';
        elseif seg3(i,:)== [1 0 0 1 0]
            output(i)='s';
        elseif seg3(i,:)== [1 0 0 1 1]
            output(i)='t';
        elseif seg3(i,:)== [1 0 1 0 0]
            output(i)='u';
        elseif seg3(i,:)== [1 0 1 0 1]
            output(i)='v';
        elseif seg3(i,:)== [1 0 1 1 0]
            output(i)='w';
        elseif seg3(i,:)== [1 0 1 1 1]
            output(i)='x';
        elseif seg3(i,:)== [1 1 0 0 0]
            output(i)='y';
        elseif seg3(i,:)== [1 1 0 0 1]
            output(i)='z';
        elseif seg3(i,:)== [1 1 0 1 0]
            output(i)='_';
        end
      end


