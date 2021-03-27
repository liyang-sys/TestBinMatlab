function [ ldri ] = pfmtonemapping( hdr2ldr, double2int, h, w, isgry )
%�˺�����ʵ��pfm��ʽͼ���ɫ��ӳ��
%   hdr2ldr�������TMO��double2int�Ǹ�����ת���������HDR����,���������붼Ӧ����.dat��׺�Ķ������ļ�
%   isgry���ж��ǵ�ͨ��������ͨ����

%%%��ȡHDR����
hdri = read_doubletohalf( double2int, h, w, isgry );
%%%��ȡTMO
tmo=read_defaulttmoc(hdr2ldr);
%%%ɫ��ӳ��
if isgry==0
    d=3;
else
    d=1;
end
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

