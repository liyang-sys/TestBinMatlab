function [ imgtohdr, maxm ] = Linearization3( hdrtoimg )
%�������hdrtoimg�ķ���TMO��
%   �����hdrtoimg�Ǿ���m=f*mh+(1-f)*ml�õ��ģ�
imgtohdr=zeros(1,32768);
imgtohdr(1)=0;
aj=2;
ai=2;
x1=0;y1=0;
x2=1;y2=hdrtoimg(ai);
th=y2;

maxm=max(hdrtoimg);
while aj<32769
    if (aj-1)*maxm/32767<=th
        imgtohdr(aj)=((maxm*(aj-1))/32767+y2*x1-y1*x2)/(y2-y1);
        aj=aj+1;
    else
        x1=x2;y1=y2;
        x2=ai;
        ai=ai+1;
        y2=hdrtoimg(ai);
        th=y2;     
    end
end

end

