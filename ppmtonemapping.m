function [ ldri ] = ppmtonemapping( infilename, hdr2ldr)
%�˺���������PPM��ʽͼ����������hdrtoldrӳ�䵽�Ͷ�̬��Χ
%   infilename�����PPM�ļ���hdr2ldr��һ��.dat��׺�Ķ������ļ����������һ��ӳ���

%��ȡHDR����
[ hdri, h, w, d, ~, ~ ] = ppmread_gry( infilename );
%��ȡTMO
tmo=read_defaulttmoc(hdr2ldr);
%ɫ��ӳ��
output=zeros(h,w,d);
for ii=1:h
    for jj=1:w 
        for kk=1:d
            t=hdri(ii,jj,kk);
            v=tmo(t+1);
            output(ii,jj,kk)=v;
        end
    end
end
ldri=uint8(output);

end

