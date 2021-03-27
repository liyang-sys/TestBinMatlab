function [ ldr2hdr ] = Linearization2( ldrtohdr )
%������ldrtohdr�����������أ�����1X256��չΪ1X32768��
%   ���������ldrtohdr���ڱ���ǰ�ͼ�����Ĵ�LDR��HDR��ȫ��ɫ��ӳ�䣬����ԭʼ�İ汾��ldrtohdr��
%   ��������ldr2hdr���Կ�����Linearization�����õ���hdrtoldrӳ��ķ���ӳ�䡣

ldr2hdr=zeros(1,32768);
ldr2hdr(1)=0;
jj=2;
ii=2;
th=1;
x1=0;y1=0;
x2=ldrtohdr(ii);y2=ii-1;

while jj<32768
    if (255*(jj-1))/32767<th
        ldr2hdr(jj)=((x2-x1)*((255*(jj-1))/32767)+y2*x1-y1*x2)/(y2-y1);
    else
        th=th+1;
        x1=x2;y1=y2;
        y2=ii;
        ii=ii+1;
        x2=ldrtohdr(ii);
        ldr2hdr(jj)=((x2-x1)*((255*(jj-1))/32767)+y2*x1-y1*x2)/(y2-y1);
    end
    jj=jj+1;
end
ldr2hdr(32768)=((x2-x1)*255+y2*x1-y1*x2)/(y2-y1);

end
