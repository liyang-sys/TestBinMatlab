function [ imgtoldr ] = Linearization4( ldrtohdr, m, ml )
%���������ldrtohdr�õ�һ����img��ldr��ӳ��,����img����ص�HDRӳ��ͼ��.
%   ���������ldrtohdr���ڱ���ǰ�ͼ�����Ĵ�LDR��HDR��ȫ��ɫ��ӳ�䣬����ԭʼ�İ汾��ldrtohdr��

idx=ldrtohdr(2)+1;
x1=0;y1=0;
x2=m(idx); y2=ml(idx);
ii=1;jj=2;

imgtoldr=zeros(1,32768);
while 1
    if ii<=x2
       y=((y2-y1)*(ii-1)+y1*x2-y2*x1)/(x2-x1);
       imgtoldr(ii)=y;
       ii=ii+1;
    else
       x1=x2;y1=y2;
       jj=jj+1;
       if jj>256
           break;
       end
       idx=ldrtohdr(jj)+1;
       x2=m(idx);y2=ml(idx);
    end
end

if ii<32768
   imgtoldr(ii:32768)=255; 
end

end

