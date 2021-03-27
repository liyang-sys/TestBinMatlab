function [  lav, llav, m, maxy, miny, maxl, minl ] = GetTMOParameter( input, isfloat )
%�˺������ڻ�ȡ����ToneMapping��������Ҫ�Ĳ���
%   �˴���ʾ��ϸ˵��
max_hdr=65535;
count=size(input,3);
input=double(input);
%%%�������ֵ����Сֵ�Ͷ������ֵ��������Сֵ
if count == 1   %%��ͨ�����Ҷ�ͼ��
    if isfloat == 1
         y= double(input);
    else
         y= double(input) / double(max_hdr);
    end
else    %%��ͨ������ɫͼ��
    if isfloat==1
        y=0.2126*input(:,:,1)+0.7152*input(:,:,2)+0.0722*input(:,:,3);
    else
        y=(0.2126*input(:,:,1)+0.7152*input(:,:,2)+0.0722*input(:,:,3))/max_hdr;
    end
end
y(y<0)=0;
ly=(y==0)+y; logy=log(ly); %��logy
cnt=sum(sum(y~=0));
lav=sum(sum(y))/cnt; llav=sum(sum(logy))/cnt; %%��ƽ��ֵ��logƽ��ֵ���Լ����ֵ����Сֵ
maxy=max(max(y)); miny=min(min(y(y>0)));%%��y�����ֵ�ͷ������Сֵ

maxl=log(maxy); minl=log(miny);
 %%%�������m
 if maxl <= minl
     m=0.3;
 else
     k=double((maxl-llav) / (maxl-minl));
     k(k==inf)=0;
     if k>0.0
         m=0.3+0.7*(k^1.4);
     else
         m=0.3;
     end
 end

end

